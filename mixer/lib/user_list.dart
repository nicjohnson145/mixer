import 'package:flutter/material.dart';
import 'package:mixer/api.dart';
import 'package:mixer/common.dart';
import 'package:mixer/hamburger.dart';
import 'package:mixer/user_drinks.dart';
import 'package:mixer/services.dart';
import 'package:mixer/protos/user.pb.dart';
import 'package:multiple_result/multiple_result.dart';

class UserList extends StatefulWidget {
    UserList({
        Key? key,
    }) : super(key: key);

    @override
    _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

    Future<Result<ListUsersResponse, ApiError>> getFuture() async {
        var api = getIt<API>();
        final apiResp = await api.listUsers();
        return apiResp.when(
            (success) {
                return Success(success);
            },
            (error) {
                return Error(error);
            },
        );
    }

    @override
    Widget build(BuildContext context) {
        return FutureBuilder(
            future: getFuture(),
            builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                    return loadingSpinner(context);
                }

                final resp = snapshot.data as Result<ListUsersResponse, ApiError>;
                return resp.when(
                    (success) {
                        return UserListView(
                            users: success.users,
                        );
                    },
                    (error) {
                        return errorScreen(context, error.message);
                    },
                );
            }
        );
    }
}

class UserListView extends StatelessWidget {

    List<String> users;

    UserListView({
        required this.users,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Users"),
                actions: const [Hamburger()],
            ),
            body: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int i) {
                    return UserCard(username: users[i]).build(context);
                },
            ),
        );
    }
}

class UserCard {
    String username;

    UserCard({
        required this.username,
    });

    Widget build(BuildContext context) {
        return Card(
            child: InkWell(
                onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                            return UserDrinks(username: username);
                        },
                    ));
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                    ),
                    child: Text(username),
                ),
            ),
        );
    }
}
