# To note the process of playing with PAB

### Step 1: Run the `start-testnet-wallet.sh`
>```
>./start-testnet-wallet.sh
>```
* Error of not recognizing `node-socket`: Either re-export the node socket or directly pointing to the exisiting node-socket (please find my shell script as uploaded).

### Step 2: To Create the wallet `create-wallet.sh`
>```
>./create-wallet.sh MyWallet mysecretpassphrase wallet.json
>```
* The `mysecretpassphrase` could interchange with any passphrase you want, file name could be either, could be `restore-wallet.json` as Lars uses.


### Step 3: Fund the wallet through Faucet
* Simple way to get receive address: Look at `wallet.json` created above, enter the seed phrase into `yoroi nightly` (a testnet wallet) to restore the wallet & get addresses there.

### Step 4: Inform the backend wallet about your new wallet `load-wallet.sh`
>```
>./load-wallet.sh
>```

### Step 5: Start the testnet chain index `start-testnet-chain-index.sh`
>```
>./start-testnet-chain-index.sh
>```

### Step 6: Start the PAB `start-testnet-pab.sh`


