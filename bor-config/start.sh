#!/usr/bin/env sh

ADDRESS=0x6c468CF8c9879006E22EC4029696E005C2319C9D
INSTANCE_DIR=$PWD/dataDir
BUILD_DIR=$GOPATH/src/github.com/maticnetwork/bor/build/bin

$BUILD_DIR/geth --datadir $INSTANCE_DIR init genesis.json
set -x #echo on

mkdir -p logs

$BUILD_DIR/geth --datadir $INSTANCE_DIR \
  --port 30303 \
  --rpc --rpcaddr '0.0.0.0' \
  --rpcvhosts '*' \
  --rpccorsdomain '*' \
  --rpcport 8545 \
  --ipcpath $INSTANCE_DIR/geth.ipc \
  --rpcapi 'personal,db,eth,net,web3,txpool,miner,admin' \
  --networkid '15002' \
  --gasprice '0' \
  --keystore ./keystore \
  --unlock $ADDRESS \
  --password password.txt \
  --allow-insecure-unlock \
  --mine > logs/bor.log 2>&1 &
