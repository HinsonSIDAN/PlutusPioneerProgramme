# PlutusPioneerProgramme

## Handy Code

### TimeSlot
>Inside `cabal repl`
>``` 
>import Ledger.Time
>import Ledger.TimeSlot
>import Data.Default
>```
Example of slot 10:
>``` 
>slotToBeginPOSIXTime def 10
>```
| Slot | Plutus Number |
|---|---|
| Slot 1  | 1596059092000 |
| Slot 2  | 1596059093000 |
| Slot 10 | 1596059101000 |
| Slot 15 | 1596059106000 |
| Slot 20 | 1596059111000 |

### Wallets addresses for development
>Inside `cabal repl`
>``` 
>import Wallet.Emulator
>```
>``` 
>knownWallet 2
>knownWallet 3
>```
>``` 
>mockWalletPaymentPubKeyHash $ knownWallet 2
>mockWalletPaymentPubKeyHash $ knownWallet 3
>```
| Wallet   | Wallet Address | Wallet  Payment Public Key Hash |
|---|---|---|
| Wallet 1 | Wallet 872cb83b5ee40eb23bfdab1772660c822a48d491 | a2c20c77887ace1cd986193e4e75babd8993cfd56995cd5cfce609c2 |
| Wallet 2 | Wallet 7ce812d7a4770bbf58004067665c3a48f28ddd58 | 80a4f45b56b88d1139da23bc4c3c75ec6d32943c087f250b86193ca7 |
| Wallet 3 | Wallet c30efb78b4e272685c1f9f0c93787fd4b6743154 | 2e0ad60c3207248cecd47dbde3d752e0aad141d6b8f81ac2c6eca27c |
| Wallet 4 | Wallet 5f5a4f5f465580a5500b9a9cede7f4e014a37ea8 | 557d23c0a533b4d295ac2dc14b783a7efc293bc23ede88a6fefd203d |
