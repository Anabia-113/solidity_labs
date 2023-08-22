// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// contract Callee {
//  string public name = "I'm getting called";
// }
library Explibrary {
    function exponential(uint256 a, uint256 b) public pure returns (uint256) {
        return a**b;
    }
}

contract SumContract {
    function sum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}