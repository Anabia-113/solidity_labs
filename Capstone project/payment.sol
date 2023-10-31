// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentSystem {
    address public employer;
    address public employee;
    address public escrow;
    uint public amount;
    bool public employerSigned;
    bool public employeeSigned;

    constructor(address _employee, address _escrow, uint _amount) {
        employer = msg.sender;
        employee = _employee;
        escrow = _escrow;
        amount = _amount;
    }

    modifier onlyEmployer() {
        require(msg.sender == employer, "Only the employer can perform this action");
        _;
    }

    modifier onlyEmployee() {
        require(msg.sender == employee, "Only the employee can perform this action");
        _;
    }

    modifier onlyEscrow() {
        require(msg.sender == escrow, "Only the escrow can perform this action");
        _;
    }

    function employerSigns() public onlyEmployer {
        employerSigned = true;
    }

    function employeeSigns() public onlyEmployee {
        employeeSigned = true;
    }

    function transfer() public payable  {
        require(employerSigned && employeeSigned, "Both parties must sign before transferring funds");

        // Transfer funds to the  employee's wallet
        payable(employee).transfer(amount);
    }
}

