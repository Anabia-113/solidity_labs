// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract HouseholdServices {
    address public owner;
    uint256 public serviceCount = 0;

    struct Service {
        uint256 id;
        address provider;
        string serviceName;
        uint256 price; // in wei
        bool isAvailable;
    }
}