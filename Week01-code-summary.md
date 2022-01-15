# Week01
## Part 3
* Look up the latest repo package use for the week

  *  Look up the check-out hash for relevant repository
  
      1. Go to the `cabal.project` file inside week01 through:
      ```
      # outside nix-shell
      less cabal project
      ```
      2. Find something like:
      ```
      source-repository-package
        type: git
        location: https://github.com/input-output-hk/plutus-apps.git
        tag: 4114xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        subdir:
          xxx
          xxx
          xxx
      ```
      3. Take out the tag hash `4114xxxxxxxxxx` and go to `plutus-apps` repo clone and checkout through
      ```
      # outside nix-shell
      git checkout 4114xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      ```

  * Update it inside the nix-shell
  
      1. Running nix-shell inside `plutus-apps` directory
      ```
      # outside nix-shell
      nix-shell
      ```
      
      2. Go to the respective folder, e.g. week01 as below 
      ```
      # inside nix-shell
      cd ~/code/haskell/plutus-pioneer-program/code/week01
      ```
      
      3. Execute to build, which might take some time
      ```
      # inside nix-shell / week folder
      cabal build
      ```
      
      4. If you want a repl
      ```
      # inside nix-shell / week folder
      cabal repl
      ```
      
* Check plutus documentation to check definition & other helps

```
# inside nix-shell / plutus-apps folder
build-and-serve-docs
```

e.g. in my mac, go to web browser with http://localhost:8002. Check pre-set variable: http://localhost:8002/haddock/
