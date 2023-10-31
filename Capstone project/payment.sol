// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract PaymentSystem {
//     address public employer;
//     address public employee;
//     address public escrow;
//     uint public amount;
//     bool public employerSigned;
//     bool public employeeSigned;

//     constructor(address _employee, address _escrow, uint _amount) {
//         employer = msg.sender;
//         employee = _employee;
//         escrow = _escrow;
//         amount = _amount;
//     }

//     modifier onlyEmployer() {
//         require(msg.sender == employer, "Only the employer can perform this action");
//         _;
//     }

//     modifier onlyEmployee() {
//         require(msg.sender == employee, "Only the employee can perform this action");
//         _;
//     }

//     modifier onlyEscrow() {
//         require(msg.sender == escrow, "Only the escrow can perform this action");
//         _;
//     }

//     function employerSigns() public onlyEmployer {
//         employerSigned = true;
//     }

//     function employeeSigns() public onlyEmployee {
//         employeeSigned = true;
//     }

//     function transfer() public onlyEscrow  {
//         require(employerSigned && employeeSigned, "Both parties must sign before transferring funds");

//         // Transfer funds to the  employee's wallet
//         payable(employee).transfer(amount);
//     }
// }

contract PaymentSystem {
    address public employer;
    address public employee;
    address public escrow;
    uint public paymentAmount;
    bool public employerSigned;
    bool public employeeSigned;
    bool public workCompleted;
    bool public disputeRaised;
    address public disputeParty;

    constructor(address _employee, address _escrow, uint _amount) {
        employer = msg.sender;
        employee = _employee;
        escrow = _escrow;
        paymentAmount = _amount;
    }

    modifier onlyEmployer() {
        require(msg.sender == employer, "Only the employer can perform this action.");
        _;
    }

    modifier onlyEmployee() {
        require(msg.sender == employee, "Only the employee can perform this action.");
        _;
    }

    modifier onlyEscrow() {
        require(msg.sender == escrow, "Only the escrow can perform this action.");
        _;
    }

    function employerSigns() public onlyEmployer {
        require(!employerSigned, "Employer has already signed.");
        employerSigned = true;
    }

    function employeeSigns() public onlyEmployee {
        require(!employeeSigned, "Employee has already signed.");
        employeeSigned = true;
    }

    function completeWork() public onlyEmployee {
        require(!workCompleted, "Work is already completed.");
        workCompleted = true;
    }

    function raiseDispute() public {
        require(msg.sender == employer || msg.sender == employee, "Only the employer or employee can raise a dispute.");
        require(!disputeRaised, "A dispute is already raised.");
        disputeRaised = true;
        disputeParty = msg.sender;
    }

    function resolveDispute(bool resolve) public onlyEscrow {
        require(disputeRaised, "No dispute to resolve.");

        if (resolve) {
            // Dispute resolved in favor of the party who didn't raise the dispute.
            if (disputeParty == employer) {
                payable(employee).transfer(paymentAmount);
            } else {
                payable(employer).transfer(paymentAmount);
            }
        }

        disputeRaised = false;
    }
}
