
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract abc {
    bool public A = true;
    bool public B = true;
    function and(bool a, bool b) public pure returns(bool) {
        return a && b;
    }
}