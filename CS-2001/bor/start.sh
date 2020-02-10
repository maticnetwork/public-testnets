#!/usr/bin/env sh

if [ -z "$1" ]
  then
    echo "Address is required as argument"
  exit 1
fi

ADDRESS=$1
DATA_DIR=$PWD/dataDir
BUILD_DIR=$GOPATH/src/github.com/maticnetwork/bor/build/bin

# set -x #echo on

mkdir -p logs

$BUILD_DIR/bor --datadir $DATA_DIR \
  --port 30303 \
  --rpc --rpcaddr '0.0.0.0' \
  --rpcvhosts '*' \
  --rpccorsdomain '*' \
  --rpcport 8545 \
  --ipcpath $DATA_DIR/geth.ipc \
  --rpcapi 'db,eth,net,web3,txpool' \
  --networkid '15002' \
  --gasprice '0' \
  --keystore ./keystore \
  --unlock $ADDRESS \
  --password password.txt \
  --allow-insecure-unlock \
  --mine > logs/bor.log 2>&1 &

echo "Node started! Logs are being written to logs/bor.log"
