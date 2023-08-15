// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


       //task 1
// contract Enum{
// enum Exam{
// Checking,
// Pass,
// Fail,
// Scholarship
// }
// // Exam public e1;
//    Exam public e3 = Exam(3);
// }

     //task 2
// contract PizzaDeli{
//     enum pizzaOrder{
//         pending,
//         preparing,
//         delivering,
//         received

//     }
//     pizzaOrder public p1;
//     pizzaOrder public p2 = pizzaOrder.preparing;
//     pizzaOrder public p3 = pizzaOrder(3);
//     // function set(pizzaOrder _p) public{
//     // p1 = _p;
//     function get() public view returns (pizzaOrder, pizzaOrder , pizzaOrder) {
//         return(p1, p2, p3);

//   }
// }

      //task 3
// contract Enum{
// enum Exam{
// Checking,
// Pass,
// Fail,
// Scholarship
// }
// Exam public e1;
// function Fail() public{
// if(e1 == Exam.Checking){
// e1 = Exam.Fail;
// }
// }
// function Scholarship() public{
// if(e1 == Exam.Pass){
// e1 = Exam.Scholarship;
// }
// }
// function idelete() public{
// delete e1;
// }
// }


        //task 4
// struct Voter {
//  string Name;
//  address addr;
//  bool hasVoted;
//  }
// contract VotingSystem {
//  // An array of 'Voter' structs
//  Voter[] public voters;
//  function create1(string memory _Name, address _addr)
// public {
//  voters.push(Voter(_Name, _addr, false));
//  }

// function create2(string memory _Name, address _addr) public {
//  voters.push(Voter({Name: _Name, addr:_addr, hasVoted:
// false}));
//  }
//  function create3(string memory _Name, address _addr)
// public {
//  Voter memory voter;
//  voter.Name = _Name;
//  voter.addr = _addr;
//  // Voter.hasVoted initialized to false
//  voters.push(voter);
//  }
//  function get(uint _index) public view returns (string
// memory Name, address addr, bool hasVoted) {
//  Voter storage voter = voters[_index];
//  return (voter.Name, voter.addr,voter.hasVoted);
//  }
//  // update hasVoted
//  function togglehasVoted(uint _index) public {
//  Voter storage voter = voters[_index];
//  voter.hasVoted = !voter.hasVoted;
//  }
// }

            //task 5
contract bankaccount{
      struct bankAccount{
            uint256 accountID;
            uint256 balance;
            address owner;
      }
      bankAccount BankAccount;
                  //Creating a storage struct reference within a function
      // function initAccount() public {
      // bankAccount storage _BankAccount = BankAccount;
      // _BankAccount.accountID = 10;
      // _BankAccount.balance = 1000;
      // _BankAccount.owner = 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f;}
                  //Directly referring to the struct of a state variable:
      //  function initAccount() public {
      // BankAccount.accountID = 10;
      // BankAccount.balance = 1000;
      // BankAccount.owner = 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f;}
                   //Using a struct constructor
      // function initAccount() public {
      // BankAccount = bankAccount(3, 90, 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f );}
                  //Assigning values using key-value pairs:
      function initAccount() public {
      BankAccount = bankAccount({accountID: 4, balance: 60, owner: 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f });}
      function get() public pure returns(uint256 accountID, uint256 balance, address owner){
            accountID;
            balance;
            owner;
      }

}

