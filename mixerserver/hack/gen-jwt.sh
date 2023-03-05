#! /usr/bin/env bash

if [ -z ${JWT_SIGNINGKEY+x} ]; then
    exit 1
fi

jwt encode --secret "$JWT_SIGNINGKEY" '{"token_type": "access", "is_superuser": true}'
