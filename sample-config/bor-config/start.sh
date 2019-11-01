#!/usr/bin/env sh

ADDRESS=0xcfbc26591af0dae88aa7ae14d0ecaced8f679976
INSTANCE_DIR=/dataDir

set -x #echo on

mkdir -p logs
geth --datadir $INSTANCE_DIR \
  --port 30303 \
  --rpc --rpcaddr '0.0.0.0' \
  --rpcvhosts '*' \
  --rpccorsdomain '*' \
  --rpcport 8545 \
  --ipcpath $INSTANCE_DIR/geth.ipc \
  --rpcapi 'personal,db,eth,net,web3,txpool,miner,admin' \
  --networkid '15001' \
  --gasprice '0' \
  --keystore ./keystore \
  --unlock $ADDRESS \
  --password password.txt \
  --allow-insecure-unlock \
  --mine > logs/bor.log 2>&1 &

