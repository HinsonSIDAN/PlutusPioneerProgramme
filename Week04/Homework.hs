{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE NumericUnderscores #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE TypeApplications   #-}
{-# LANGUAGE TypeOperators      #-}

module Week04.Learning_Homework where

import Control.Monad.Freer.Extras as Extras
import Data.Aeson                 (FromJSON, ToJSON)
import Data.Functor               (void)
import Data.Text                  (Text, unpack)
import GHC.Generics               (Generic)
import Data.Void                  (Void)
import Ledger     
import Ledger.Ada                 as Ada
import Ledger.Constraints         as Constraints
import Plutus.Contract            as Contract
import Plutus.Trace.Emulator      as Emulator
import Wallet.Emulator.Wallet

data PayParams = PayParams
    { ppRecipient :: PaymentPubKeyHash
    , ppLovelace  :: Integer
    } deriving (Show, Generic, FromJSON, ToJSON)

type PaySchema = Endpoint "pay" PayParams

payContract :: Contract () PaySchema Text ()
payContract = do
    pp <- awaitPromise $ endpoint @"pay" return
    let tx = mustPayToPubKey (ppRecipient pp) $ lovelaceValueOf $ ppLovelace pp
    Contract.handleError (\err -> Contract.logInfo $ "caught: " ++ unpack err) $ (void $ submitTx tx)
    payContract

-- A trace that invokes the pay endpoint of payContract on Wallet 1 twice, each time with Wallet 2 as
-- recipient, but with amounts given by the two arguments. There should be a delay of one slot
-- after each endpoint call.
payTrace :: Integer -> Integer -> EmulatorTrace ()
payTrace a b = do
    h1 <- activateContractWallet (knownWallet 1) payContract
    -- h2 <- activateContractWallet (knownWallet 2) payContract
    callEndpoint @"pay" h1 $ PayParams   
        { ppRecipient = mockWalletPaymentPubKeyHash $ knownWallet 2
        , ppLovelace  = a
        }
    void $ Emulator.waitUntilSlot 1
    callEndpoint @"pay" h1 $ PayParams   
        { ppRecipient = mockWalletPaymentPubKeyHash $ knownWallet 2
        , ppLovelace  = b
        }
    s <- Emulator.waitNSlots 2
    Extras.logInfo $ "reached " ++ show s

payTest1 :: IO ()
payTest1 = runEmulatorTraceIO $ payTrace 10_000_000 20_000_000

payTest2 :: IO ()
payTest2 = runEmulatorTraceIO $ payTrace 1000_000_000 20_000_000
