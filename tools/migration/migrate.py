import requests
import os
import sys


def require_env(key):
    val = os.getenv(key, None)
    if val is None:
        print(f"{key} is required")
        sys.exit(1)
    return val


def main():
    old_user = require_env("OLD_USR")
    old_pass = require_env("OLD_PASS")
    new_user = require_env("NEW_USR")
    new_pass = require_env("NEW_PASS")
    copy_user = require_env("COPY_USR")

    old_token = requests.post(
        "https://mixer.nicjohnson.info/api/v1/auth/login",
        json={
            "username": old_user,
            "password": old_pass,
        },
    ).json()["access_token"]
    new_token = requests.post(
        "https://new-mixer.nicjohnson.info/api/v1/login",
        json={
            "username": new_user,
            "password": new_pass,
        },
    ).json()["accessToken"]

    old_drinks = requests.get(
        f"https://mixer.nicjohnson.info/api/v1/drinks/by-user/{copy_user}",
        headers={"MixerAuth": old_token}
    ).json()
    new_drinks = requests.get(
        f"https://new-mixer.nicjohnson.info/api/v1/drink/user/{new_user}",
        headers={"authorization": new_token}
    ).json()

    new_map = {d["drinkData"]["name"]: d for d in new_drinks["drinks"]}

    for drink in old_drinks["drinks"]:
        name = drink["name"]
        new_drink = translate(drink)
        if name not in new_map:
            print(f"{name} not found, creating")
            resp = requests.post(
                "https://new-mixer.nicjohnson.info/api/v1/drink",
                headers={"authorization": new_token},
                json={
                    'drink_data': new_drink,
                },
            )
            if resp.status_code != 200:
                print(resp.json())
                sys.exit(1)
        else:
            print(f"{name} already exists, updating")
            resp = requests.put(
                "https://new-mixer.nicjohnson.info/api/v1/drink",
                headers={"authorization": new_token},
                json={
                    "id": drink["id"],
                    "drink_data": new_drink,
                },
            )
            if resp.status_code != 200:
                print(resp.json())
                sys.exit(1)


def translate(drink):
    return {
        "name": drink["name"],
        "primary_alcohol": drink["primary_alcohol"],
        "preferred_glass": drink.get("preferred_glass", ""),
        "ingredients": drink["ingredients"],
        "instructions": drink.get("instructions", ""),
        "notes": drink.get("notes", ""),
        "publicity": "DrinkPublicity_Public" if drink["publicity"] == "public" else "DrinkPublicity_Private",
        "under_development": drink["under_development"],
        "favorite": drink["favorite"],
    }



if __name__ == "__main__":
    main()
