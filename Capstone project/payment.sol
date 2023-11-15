// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentSystem {
    address public employer;
    address public employee;
    uint public paymentAmount;
    bool public employerSigned;
    bool public employeeSigned;
    bool public workCompleted;
    bool public disputeRaised;
    address public disputeParty;
    address private owner;
    constructor()payable {
        owner=msg.sender;
    }
     mapping(address=>string) public reviews;
    function initializePayment(address _employee, uint _amount) public {
        require(employer != address(0), "Payment details are already initialized.");
        employer = msg.sender;
        employee = _employee;
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
     function giveReview(string memory review)public onlyEmployer{
        reviews[employee]=review;
     }
    function employerSigns() public onlyEmployer {
        require(employerSigned, "Employer has already signed.");
        employerSigned = true;
    }

    function employeeSigns() public onlyEmployee {
        require(employeeSigned==true, "Employee has already signed.");
        employeeSigned = true;
    }
    function getReview()public view returns(string memory){
        return reviews[employee];
    }

    function completeWork() public onlyEmployee {
        require(!workCompleted, "Work is already completed.");
        workCompleted = employerSigned&&employeeSigned;
        reviews[msg.sender]="";
    }

    function raiseDispute() public {
        require(msg.sender == employer || msg.sender == employee, "Only the employer or employee can raise a dispute.");
        require(!disputeRaised, "A dispute is already raised.");
        disputeRaised = true;
        disputeParty = msg.sender;
    }
    function IamEmployer()public{
        employer=msg.sender;
    }
    function Employ()public{
      employee=msg.sender;
    }
    function resolveDispute(bool resolve) public {
        require(disputeRaised, "No dispute to resolve.");

        if (resolve) {
            // Dispute resolved in favor of the party who didn't raise the dispute.
            address payable receiver;
            if (disputeParty == employer) {
                receiver = payable(employee);
            } else {
                receiver = payable(employer);
            }
            
            uint deduction = paymentAmount / 10; // 10% deduction
            uint finalPayment = paymentAmount - deduction;
            
            receiver.transfer(finalPayment);
        }

        disputeRaised = false;
    }
}
