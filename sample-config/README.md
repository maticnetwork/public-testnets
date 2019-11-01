# Sample config for single Validator

## Running bor

> NOTE: Make sure you have the BOR binary installed before running the below steps

```bash
cd sample-config/bor-config

// initialise bor
geth --datadir dataDir init genesis.json

// start bor
bash start.sh
```

## Running heimdall

> NOTE: Make sure you have the heimdalld and heimdallcli binary installed before running the below steps

```bash
// move configrations to $HOME
cp -r sample-config/heimdall-config ~/.heimdalld

// run heimdall
make run-heimdall
```
