// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Ownable{
    address public owner;

    event LogOwnershipTransfer(address indexed _currentOwner, address indexed _newOwner);

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    constructor(){
        owner == msg.sender;
    }
    
}