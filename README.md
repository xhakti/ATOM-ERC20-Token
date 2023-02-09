# ATOM-ERC20-Token

This smart contract creates an ERC-20 token called AtomToken with the symbol "ATOM". It is designed to have a limited total supply, as specified by the "ERC20Capped" library, and the ability to destroy tokens, as specified by the "ERC20Burnable" library.

Whenever a transfer of tokens is made, the miner is rewarded with a set amount of tokens as specified by the "blockReward" variable. This reward can only be changed by the owner of the contract.

The owner of the contract has exclusive access to certain functions, such as setting the block reward. The contract can also be destroyed by the owner and its remaining funds will be transferred to the owner's address.
