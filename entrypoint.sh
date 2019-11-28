#!/bin/bash

DOMAIN=$DOMAIN
USER=$USER
SECRET_KEY=$SECRET_KEY
PASS=$PASS


if [ -n "$DOMAIN" ]
then
    eval $(echo $PASS | op signin $DOMAIN $USER $SECRET_KEY)
    op $@
    op signout
else
    echo "[WARNING] For 1pass CLI to function you need to sign in."
    echo "[WARNING] To sign in you need to specify env variable: DOMAIN, USER, SECRET_KEY, PASS"
    echo "[WARNING] You can specify them in env.list or directly"
    op $@
fi

