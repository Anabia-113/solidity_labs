// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract BytesDatatypes{
    bool public boolean;
    function getBool(bool isEmploy) public pure returns (bool){
        bool hasBalance = true;
        bool getPaid = isEmploy || hasBalance;
        return getPaid;


    }
}
