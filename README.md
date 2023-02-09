# ATOM-ERC20-Token

This is a smart contract written in Solidity language for creating an ERC-20 token called "AtomToken" with the symbol "ATOM". The contract inherits from two libraries: "ERC20Capped" and "ERC20Burnable".

The "ERC20Capped" library provides a cap on the total supply of tokens that can be minted, which is set in the contract's constructor with the argument _cap. This cap is multiplied by 10^decimals() to convert it to the smallest unit of the token.

The "ERC20Burnable" library provides the ability to destroy tokens, or "burn" them. This is done in the "destroy" function, which can only be executed by the owner of the contract.

The contract also includes a "blockReward" variable which is used to store the amount of tokens that are rewarded to the miner whenever a transfer of tokens is made (other than a transfer to the miner themselves). This reward is minted using the "_mintMinerReward" function.

The "_mint" function is used to mint new tokens and the "setBlockReward" function allows the owner to set the block reward.

The "onlyOwner" modifier is used to restrict access to certain functions, such as the "setBlockReward" function, to only the owner of the contract.

The "_beforeTokenTransfer" function is called before a token transfer is made and it checks if the transfer is from a valid address and to a valid address. If the transfer is not to the miner, it calls the "_mintMinerReward" function to reward the miner with the block reward.

The "destroy" function can be used by the owner of the contract to destroy the contract and transfer its remaining funds to the owner's address.
