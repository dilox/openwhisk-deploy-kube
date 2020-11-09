#!/bin/bash
set -x
cd /opt
rm -rvf io-sdk
git clone https://github.com/pagopa/io-sdk.git
wsk property set --apihost $APIHOST --auth $AUTH
cd io-sdk/admin
make web && make deploy

