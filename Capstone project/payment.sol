// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentSystem {
    address public employer;
    address public employee;
    uint public paymentAmount;
    bool public employerSigned=false;
    bool public employeeSigned=false;
    bool public workCompleted;
    bool public disputeRaised;
    address public disputeParty;
    address private owner;
    bool public paid;

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
        employerSigned = true;
    }
    // Function for the employee to sign the payment (can only be called once)
    function employeeSigns() public onlyEmployee {
        employeeSigned = true;
    }
    // Function to get the review given by the employer for the employee
    function getReview()public view returns(string memory){
        return reviews[employee];
    }
    // Function for the employee to mark the work as completed
    function completeWork() public payable onlyEmployee {
        require(employerSigned&&employeeSigned,"Either Employ or Employed haven't signed yet");
        reviews[msg.sender]="";
        employeeSigned=false;
        employerSigned=false;
        payable(employee).transfer(address(this).balance);
    }
    //pay to the contract address
    function pay()public payable onlyEmployer{
          require(msg.value>paymentAmount,"Low Amount Entered");
          paid=true;

    }


}