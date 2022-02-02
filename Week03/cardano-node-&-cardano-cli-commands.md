# Week03

## Pre-setup
Following [(my setup habit)](https://github.com/SIDANWhatever/PlutusPioneerProgramme/edit/main/Week01-code-summary.md), I cloned the week03 material on my macbook.

## Running a local cardano node

1. Download the latest cardano node (as of md date most updated version: [(1.33.0)](https://github.com/input-output-hk/cardano-node/releases/tag/1.33.0)
* I use the hydra binaries as Lars, more specifically the [(cardano-node-macos)](https://hydra.iohk.io/build/9941204) version, you can find your respective version [(here)](https://hydra.iohk.io/build/9941098#tabs-constituents)
2. Save the unzip folder wherever you like, for me, I created a `testnet_1.33` folder inside the `testnet` folder in `week03`:
>```
>~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week03/testnet/testnet_1.33/
>```
3. Download all the `config`, `byronGenesis`, `shelleyGenesis`, `alonzoGenesis`, `topology` files from [(here)](https://hydra.iohk.io/build/8111119/download/1/index.html), and also saved in:
>```
>~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week03/testnet/testnet_1.33/
>```

4. In order to keep the system config issues to the minimum as a M1 Mac user, I chose to execute all scripts inside `nix-shell`:
>```
>cd ~/Desktop/Plutus-Pioneer-Program/plutus-apps/
>nix-shell
>```

5. Since the nix-shell installed the node version 1.32 (check through `cardano-node --version`, I need to manually point to the 1.33 node I downloaded through changing the setting inside 
`start-node-testnet.sh` inside `testnet` directory. Changing the first line, from `cardano-node run \` to:
>```
>~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week03/testnet/testnet_1.33/cardano-node-1.33.0-macos/cardano-node run \
>--topology testnet-topology.json \
>--database-path db \
>--socket-path node.socket \
>--host-addr 127.0.0.1 \
>--port 3001 \
>--config testnet-config.json
>```

6. Replace the config files (`config`, `byronGenesis`, `shelleyGenesis`, `alonzoGenesis`, `topology`) inside `testnet\` with those saved in `testnet\testnet_1.33\`

7. Inside `nix-shell`, start the node:
>```
>./start-node-testnet.sh
>```
* Once the node is started, it takes several hours to sync.

## Using cardano-cli
### Note before start
* Before getting started, the `cardano-cli` also needs to point to the 1.33 version as downloaded. The below action needs to be performed everytime restarting the `nix-shell`:
>```
>alias cardano-cli='~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week03/testnet/testnet_1.33/cardano-node-1.33.0-macos/cardano-cli'
>```
* Checking the testnet magic through `less testnet-shelley-genesis.json`, we would use `--testnet-magic 1097911063` throughout the whole documentation.
* A summary of `cardano-cli` commonly used commands covered in week03, all commands are executed inside `nix-shell` and
>```
>~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week03/testnet/
>```

### cardano-cli examples
  * `cardano-cli address`
    1. To create addresses with a pair of verification key and signing key. E.g. creating a `01` address & `02` address as below:
    >```
    >cardano-cli address key-gen --verification-key-file 01.vkey --signing-keyfile 01.skey
    >cardano-cli address key-gen --verification-key-file 02.vkey --signing-keyfile 02.skey
    >```
    Looking at the details of keys:
    >```
    >cat 01.vkey
    >```
    
    2. Create the address file using the verification key:
    >```
    >cardano-cli address build --payment-verification-key-file 01.vkey --testnet-magic 1097911063 --out-file 01.addr
    >cardano-cli address build --payment-verification-key-file 02.vkey --testnet-magic 1097911063 --out-file 02.addr
    >```
    >After obtaining the `01.addr`, can use the address revealed by `cat 01.addr` to request tADA in the [(faucet)](https://testnets.cardano.org/en/testnets/cardano/tools/faucet/)
    
    3. Create payment key-hash for smart contract uses, e.g. creating a key hash for address 02 and put the result in `02.pkh`.
    >```
    >cardano-cli address key-hash --payment-verification-key-file 02.vkey --outfile 02.pkh
    >```
    
    4. To create script address (smart contract address). In week03, a script `vesting.plutus` is created and its address `vesting.addr` could be created through:
    >```
    >cardano-cli address build-script --script-file vesting.plutus --testnet-magic 1097911063 --out-file vesting.addr
    >```
    
  * `cardano-cli query`
    > After the local cardano node is synced, there will be a file called `node.socket` created inside `testnet/`. In order to use `cardano-cli query`, we need to let the machine know where is the chain we referring to. In this particular course, we refer to the local node and build the connection through:
    > ```
    > export CARDANO_NODE_SOCKET_PATH=node.socket
    > ```
    1. To query the address balance:
    >```
    >cardano-cli query utxo --address $(cat 01.addr) --testnet-magic 1097911063
    >```

## Skeleton for my own quick reference use
* BIG TOPIC

  * TOPIC 1

    1. SUB-STEPS1
    2. SUB-STEPS2
    3. SUB-STEPS3
