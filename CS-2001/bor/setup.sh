#!/usr/bin/env sh

DATA_DIR=$PWD/dataDir
BUILD_DIR=$GOPATH/src/github.com/maticnetwork/bor/build/bin

# set -x #echo on

$BUILD_DIR/bor --datadir $DATA_DIR init ./genesis.json

cp ./static-nodes.json $DATA_DIR/bor/static-nodes.json

mkdir -p logs
mkdir -p keystore

echo "Setup done!"
