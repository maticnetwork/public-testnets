#!/usr/bin/env sh

BOR_CONFIG_DIR=`dirname $0`

cd $BOR_CONFIG_DIR

ADDRESS=0xcfbC26591Af0DAe88aa7AE14D0EcAceD8f679976
INSTANCE_DIR=$PWD/dataDir
BUILD_DIR=$GOPATH/src/github.com/maticnetwork/bor/build/bin

$BUILD_DIR/bor --datadir $INSTANCE_DIR init genesis.json
# set -x #echo on

touch $INSTANCE_DIR/bor/static-nodes.json

mkdir -p logs
LOG_FILE=logs/bor.log

$BUILD_DIR/bor --datadir $INSTANCE_DIR \
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
  --mine > $LOG_FILE 2>&1 &

LOG_FULL_PATH=$(cd logs && pwd -P)/`basename $LOG_FILE`

echo "Node started! Logs are being written to ${LOG_FULL_PATH}"
