# Week01

## Pre-setup
* cloning the `plutus-apps` repository & `plutus-pioneer-program` repository to a selected folder of self's choice, for example, I created a `Plutus-Pioneer-Program` in my desktop:

1. Open Terminal

2. Go to the selected directory:
>```
>cd Desktop/Plutus-Pioneer-Program/
>```

3. Clone the repository needed
>```
>git clone https://github.com/input-output-hk/plutus-pioneer-program/
>git clone https://github.com/input-output-hk/plutus-apps/
>```

## Part 3
* Look up the latest repo package use for the week

  *  Look up the check-out hash for relevant repository
  
      1. <strong>(outside nix-shell)</strong> Go to the `cabal.project` file inside `week01` through: 
      >```
      >cd plutus-pioneer-program/code/week01
      >less cabal.project
      >```
      2. Find something like:
      >```
      >source-repository-package
      >  type: git
      >  location: https://github.com/input-output-hk/plutus-apps.git
      >  tag: 41149926c108c71831cfe8d244c83b0ee4bf5c8a
      >  subdir:
      >    xxx
      >    xxx
      >    xxx
      >```
      3. <strong>(outside nix-shell)</strong> Take out the tag hash `4114xxxxxxxxxx` and go to `plutus-apps` repo clone and checkout through 
      >```
      >cd ~/Desktop/Plutus-Pioneer-Program/plutus-apps/
      >git checkout 41149926c108c71831cfe8d244c83b0ee4bf5c8a
      >```

  * Update it inside the nix-shell
  
      1. <strong>(outside nix-shell)</strong> Running nix-shell inside `plutus-apps` directory
      >```
      >nix-shell
      >```
      
      2. <strong>(inside nix-shell)</strong> Go to the respective folder, e.g. week01 as below 
      >```
      >cd ~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week01
      >```
      
      3. <strong>(inside nix-shell)</strong> Execute to build, which might take some time
      >```
      >cabal build
      >```
      
      4. <strong>(inside nix-shell)</strong> If you want a repl
      >```
      >cabal repl
      >```
      
* <strong>(inside nix-shell)</strong> Get out of the EnglishAuction `cabal repl` then check plutus documentation to check definition & other helps
>```
>build-and-serve-docs
>```

e.g. in my mac, go to web browser with http://localhost:8002. Check pre-set variable: http://localhost:8002/haddock/

## Part 5

* Starting the local plutus playground

  * Follow below steps

    1. Get into nix-shell and start the server
    >```
    >cd ~/Desktop/Plutus-Pioneer-Program/plutus-apps/
    >nix-shell
    >```
    ><strong>(inside nix-shell)</strong>
    >```
    >cd plutus-playground-client
    >GC_DONT_GC=1 plutus-playground-server   
    >```
    2. Open another nix-shell, go the same directory and start the playground client
    >```
    >cd ~/Desktop/Plutus-Pioneer-Program/plutus-apps/
    >nix-shell
    >```
    ><strong>(inside nix-shell)</strong>
    >```
    >cd plutus-playground-client
    >GC_DONT_GC=1 npm run start
    >```

    3. Open the address browser and use the playground there: http://localhost:8009
    4. Clear the Hellow Word codes and paste in the english option code inside `~/Desktop/Plutus-Pioneer-Program/plutus-pioneer-program/code/week01/src/Week01/`
    5. Click compile then simulate
    6. The rest simulation and scenario testing follows the video and interact with local instance: http://localhost:8009


## Questions to be asked

1. What kind of interaction with chain consume fee?
2. Can ADA locked in a contract be staked?

## Skeleton for my own quick reference use
* BIG TOPIC

  * TOPIC 1

    1. SUB-STEPS1
    2. SUB-STEPS2
    3. SUB-STEPS3
