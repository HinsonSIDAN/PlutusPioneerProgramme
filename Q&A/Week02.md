Plutus Pioneer Program - Cohort 3 
Jan 25, 2022

Contributed By:
Whatever [SIDAN]

Offical Q&A by Lars Brünjes: [PPP-Cohort3-Q&A-5](https://zoom.us/rec/share/Bvml-WCrb2C5NzCtiZr_RXtyiZneujZ-ERAW2ep3G9buH5TD9BWJoNgWsVsFKoM.FiOLRPX4rvunKgIm) | Password: Refer to Pioneer Channel

# Week02 Q&A


### [9:55] Is it possible to deploy smart contract on testnet and use cli tools to interact with it?
>A: Yes, it will be covered in the third lecture.

### [10:43] What are the different use cases for datum versus redeemer?
>A: Different parties responsible for them. Datum sit in the output: the person who lock fund in the script provides the datum. Where the redeemer comes the transaction wants to use the. Forget the eTUxO things and look back at UTxO model, the transaction is authorized through signing with your private key. The UTxO sits in a public address like datum, while the redeemer is alike the private key to unlock the UTxO.

### [13:14] You said untype can be used for speed resource mechanism. Can you explaine the scenario where people choose to use untype? What are the negative impact of this work, when will they become relevant things? (Cannot catch, please supplement if any.)
>A: Sundae struggles to fit their contracts into their resource limit. The contract is too big (i.e. they need more execution steps). They have 3 constraints:
>1. Size of the scripts in byte.
>2. Execution steps
>3. Memories consumption limitation.

### [15:37] Offer explanation of Plutus environment setup?
>A: Yes, it is Haskell setup in Visual Studio. I can do that.

### [16:12] Can redeemer include references (or a hash)?
>A: Sure for both datum or redeemer if hash or policy ID cause it is just ByteString in type.

### [17:06] How to learn to work with packages such as where `ToSchema` resides?
>A: It is included `Plutus.Prelude` since it is Plutus specific.

### [19:10] Other possible places than the haddock to investigate the codes?
>A: I use / installed Haskell language server, which can hint Haskell codes in different editors. VS Code is more user friendly in my opinion.

### [21:00] How does the `traceIfFalse` work?
>A: When you send a transaction on testnet or mainnet, you will see the error message if it fails (validation error).

### [25:07] Cannot catch, please supplement if any.

### [27:24] 
