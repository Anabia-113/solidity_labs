// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// //1) Compile-time errors are checked during the compilation process when Solidity code is
// converted into bytecode.
// 2) Runtime errors occur while executing contracts and can be challenging to identify.
// Common runtime errors include out-of-gas errors, data type overflow errors, divide by
// zero errors, and array out-of-index errors.

// Revert:
// The revert statement is used to revert the current transaction or execution with an optional error message.
// It consumes the least gas compared to require and assert since it doesn't perform additional checks or validations beyond stopping execution.
// It's commonly used for controlled error handling and to provide informative error messages to users.

// Require:
// The require statement is used to validate conditions and revert the transaction if the condition is not met.
// It consumes more gas compared to revert due to the additional condition checking and evaluation.
// It's often used for input validation and preconditions to ensure that a function is only executed under certain circumstances.

// Assert:
// The assert statement is used to ensure internal consistency and check for conditions that should never occur under normal circumstances.
// It's used for debugging and should not be relied upon for regular error handling.
// It consumes the most gas among the three because it's assumed that if an assert condition fails, there's a serious bug in the code.

// contract InputValidator {
//      mapping(address => uint256) public balances;
//     constructor() {
//         // Initialize balance of the contract deployer with 10,000
//         balances[msg.sender] = 10000;
//     }
//     function Transfer(uint256 amount, address recipient) public {
//         require(amount > 0 && amount <= 100, "Amount must be between 1 and 100");
//         require(balances[msg.sender] >= amount, "Insufficient balance");
//         payable(recipient).transfer(amount);
//     }
// }

//task 2
// contract QuotientCalculator {
//     function calculateQuotient(uint256 _numerator, uint256 _denominator) public pure returns (uint256) {
//         // Ensure non-zero denominator
//         require(_denominator != 0, "Denominator cannot be zero");
//         //return quotient
//         return _numerator / _denominator;
//     }
// }

//task 3
// contract OwnerShipTransfer{
//  mapping(uint256 => address) private owners;
//  function transferOwner2(uint256 ID, address newOwner) public {
//  if(owners[ID] != msg.sender){
//  revert("Transfer Not Owner"); }
//  owners[ID] = newOwner;
// }
// }

// contract QuotientCalculator {
//     function calculateQuotient(uint256 _numerator, uint256 _denominator) public pure returns (uint256) {
//         // Ensure non-zero denominator
//         if(_denominator == 0){
//         revert("Denominator cannot be zero");
//         }
//         //return quotient
//         return _numerator / _denominator;
//     }
// }

//task 4
// contract VotingSystem{
//     mapping(uint =>bool) public checkVote;
//     function vote(uint256 _candidateID) public{
//         if(checkVote[_candidateID] == true){
//             revert("alredy voted");
//         }
//         checkVote[_candidateID] = true;
//     }
// }

//task 5
// contract Assert{
// function subtract(uint num1, uint num2) public pure returns(uint){
// uint sub;
// sub = num1 - num2;
// assert(int(num1)-int(num2) >= 0);
// return sub;
// }
// }

//task 6
// contract DynamicArray{
//     uint256[] public dynamicArray;

//     function addElements(uint256 _value) public {
//         dynamicArray.push(_value);
//     }
//      function removeElement() public {
//         assert(dynamicArray.length > 0);
//         // Remove the last element from the array
//         dynamicArray.pop();
//     }
//     function getElement(uint256 _index) public view returns (uint256) {
//         return dynamicArray[_index];
//     }
// }

//task 7
// contract AdmissionSystem {
//     enum Department {
//         Civil,
//         Mechanic,
//         Electrical,
//         Software
//     }
//     mapping(uint256 => bool) public admissionStatus;
//     mapping(uint256 => Department) public choosenDepartment;
//     function setAdmissionStatus(uint256 _student, bool _hasPassed) public {
//         //Use this function to set a student's admission status using admissionStatus mapping
//         admissionStatus[_student] = _hasPassed;
//     }
//     function chooseDepartment(uint256 _student, Department _selectedDept) public {
//         if(admissionStatus[_student] == true){
//             revert("the student has met admission requirement");
//         }
//         //assign the chosen department using the chosenDepartment mapping
//         choosenDepartment[_student] = _selectedDept;
//     }
// }

//task 8
// contract OwnerShipTransfer{
// error Invalid();
// mapping(uint256 => address) private owners;
// function transferOwner4(uint256 ID, address newOwner) public {
// if(owners[ID] != msg.sender){
// revert Invalid();
// }
// owners[ID] = newOwner;
// }
// }
// contract CustomError{
// uint[] public arr;
// error checkIfPrime(string message, uint num);
// function upush(uint num) public{
// if(IsPrime(num)){
//     revert checkIfPrime("not prime" ,num);
// }
// arr.push(num);
// }
// function IsPrime(uint num) public pure returns(bool){
// if(num == 0 || num == 1){
// return false;
// }
// for(uint i = 2; i <= num/2; i++){
// if(num % i == 0){
// return true;
// }
// }
// return false;
// }
// }

//task 9
// contract DriverLicence{
//     uint RequiredAge = 18;

//     error tooYoung(string message, uint RequiredAge);
//     function DriverID(uint age) public view returns(uint256){
//         if(age >= RequiredAge){
//             return age;
//         }
//         else{
//             revert tooYoung("you are too young" , RequiredAge);
//         }

//     }

// }

//task 10
contract ATM {
    uint256 CashAvailable;
    error InsufficientFunds(string message, uint256 CashAvailable);

    function MoneyWithdraw(uint256 WithdrawAmount) public {
        if (CashAvailable < WithdrawAmount) {
            revert InsufficientFunds("Insufficient funds", CashAvailable);
        }
        // deduct the ‘WithdrawAmount’ from the ‘CashAvailable’
        CashAvailable -= WithdrawAmount;
    }

    function ATMRefill(uint256 RefillAmount) public {
        //Add the ‘RefillAmount’ to the current ‘CashAvailable’ balance
        CashAvailable += RefillAmount;
    }
}
