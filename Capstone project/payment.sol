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

    //// Constructor that sets the contract deployer as the owner
    constructor()payable {
        owner=msg.sender;
    }
    //A mapping to store reviews given by the employer for the employee
     mapping(address=>string) public reviews;

    //Modifier to restrict certain functions to only the employer
    modifier onlyEmployer() {
        require(msg.sender == employer, "Only the employer can perform this action.");
        _;
    }
    // Modifier to restrict certain functions to only the employee
    modifier onlyEmployee() {
        require(msg.sender == employee, "Only the employee can perform this action.");
        _;
    }
    // Function to set the deployer as the employer
     function IamEmployer()public{
        employer=msg.sender;
    }
    // Function to set the caller as the employee
    function Employ()public{
      employee=msg.sender;
    }
    // Function to initialize payment details (can only be called once)
     function initializePayment(address _employee, uint _amount) public {
        require(employer != address(0), "Payment details are already initialized.");
        employer = msg.sender;
        employee = _employee;
        paymentAmount = _amount;
    }
    // Function for the employer to give a review for the employee
     function giveReview(string memory review)public onlyEmployer{
        reviews[employee]=review;
     }
     // Function for the employer to sign the payment (can only be called once)
    function employerSigns() public onlyEmployer {
        require(employerSigned, "Employer has already signed.");
        employerSigned = true;
    }
    // Function for the employee to sign the payment (can only be called once)
    function employeeSigns() public onlyEmployee {
        require(employeeSigned==true, "Employee has already signed.");
        employeeSigned = true;
    }
    // Function to get the review given by the employer for the employee
    function getReview()public view returns(string memory){
        return reviews[employee];
    }
    // Function for the employee to mark the work as completed
    function completeWork() public onlyEmployee {
        require(!workCompleted, "Work is already completed.");
        workCompleted = employerSigned&&employeeSigned;
        reviews[msg.sender]="";
    }
    // Function for either party to raise a dispute
    function raiseDispute() public {
        require(msg.sender == employer || msg.sender == employee, "Only the employer or employee can raise a dispute.");
        require(!disputeRaised, "A dispute is already raised.");
        disputeRaised = true;
        disputeParty = msg.sender;
    }
    // Function to resolve the dispute, transferring funds accordingly
    // function resolveDispute(bool resolve) public {
    //     require(disputeRaised, "No dispute to resolve.");

    //     if (resolve) {
    //         // Dispute resolved in favor of the party who didn't raise the dispute.
    //         address payable receiver;
    //         if (disputeParty == employer) {
    //             receiver = payable(employee);
    //         } else {
    //             receiver = payable(employer);
    //         }
            
    //         uint deduction = paymentAmount / 10; // 10% deduction
    //         uint finalPayment = paymentAmount - deduction;
            
    //         receiver.transfer(finalPayment);
    //     }
    //     disputeRaised = false;
    // }

    function resolveDispute(bool resolve) public {
    require(disputeRaised, "No dispute to resolve.");

    // Transfer the funds to the contract address
    require(address(this).balance >= paymentAmount, "Insufficient funds in the contract.");

    if (resolve) {
        // Dispute resolved in favor of the party who didn't raise the dispute.
        address payable receiver;
        if (disputeParty == employer) {
            receiver = payable(employee);
        } else {
            receiver = payable(employer);
        }

        // Transfer the funds to the receiver
        receiver.transfer(paymentAmount);
    } else {
        // Dispute not resolved, refund the funds to the employer
        payable(employer).transfer(paymentAmount);
    }

    disputeRaised = false;
}
}

