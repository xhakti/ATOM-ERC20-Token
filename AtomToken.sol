// contracts/AtomToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol"; // by importing this we can set the max supply
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol"; // by importing this we can make the token burnable


contract AtomToken is ERC20Capped , ERC20Burnable {   
    
    address payable public owner;       // here we dont have to inherit both the blocks as ERC20Capped itself inherits ERC20 contract.
    uint public blockReward;

    constructor(uint _cap, uint reward) ERC20("AtomToken", "ATOM") ERC20Capped(_cap * (10 * decimals())) {
        owner = payable(msg.sender);
        _mint(owner, 70000000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }

    function _mint(address account, uint256 amount) internal virtual override( ERC20Capped ,ERC20 ) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"ONLY OWNER CAN ACESSES THIS FUNCTION" );
        _;
    }

    function setBlockReward(uint _reward) public onlyOwner {
        blockReward = _reward * (10 ** decimals());
    } 

    function _mintMinerReward() internal {
        _mint(block.coinbase ,blockReward); // block.coinbase this returns the reward for the current user 
    }

    function _beforeTokenTransfer(address from , address to, uint value) internal virtual override {
        if (from != address(0) && to != block.coinbase && block.coinbase != address(0)){ // this checks if the from and miners address are valid & a infinite loop should not start as reward shold'nt be given on givng reward itself
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from,to,value);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }


}

