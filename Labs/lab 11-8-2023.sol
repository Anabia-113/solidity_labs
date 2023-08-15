//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Events{
 enum Quality{
 Good, Moderate, Bad
 }
 struct specs{
 string microprocessor;
 uint RAM;
 }
 //A single event can have multiple parameters
 event multi(string laptop, uint price);
 //You can also emit enums and structs as well
 //An event can have upto 3 indexed parameters
 event multiple(string laptop, uint indexed price, Quality indexed q, specs indexed s);
 //Naming the variable in an event is not necessary
 event mu(string, Quality);
 //You can also emit empty events
 event empty();
 event qualities(Quality quality, specs spec, uint ROM);
 function emits() public{
 emit multi("Hp", 150000);
 emit multiple("dell", 100000, Quality.Good, specs("intel", 128));
 emit mu("Lenovo", Quality.Moderate);
 emit empty();
 emit qualities(Quality.Moderate , specs("intel", 128),  1000);
 }
}

//task 2
// contract eventss {
//     address owner;

//     constructor() {
//         owner = msg.sender;
//     }

//     function NewOwner(address newOwner) public {
//         require(
//             msg.sender == owner,
//             "Only the current owner can set a new owner"
//         );
//         owner = newOwner;
//     }

//     event change(address preowner, address newowner);

//     function emits() public {
//         emit change(
//             0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
//             0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
//         );
//     }
// }

//task 3
// contract personContract {
//     struct personInfo {
//         uint256 age;
//         string name;
//     }
//     personInfo public P1;
//     event Update(
//         personInfo oldValue,
//         personInfo newValue,
//         uint256 timestamp,
//         uint256 blockNumber
//     );
//     function setPersonInfo(uint256 newAge, string memory newName) public {
//         personInfo memory oldValue = P1;
//         P1.age = newAge;
//         P1.name = newName;
//         emit Update(oldValue, P1, block.timestamp, block.number);
//     }
// }


//task 4
// contract Number{
//     function numgive(int inputValue) public returns (int){
//        int neg;
//        int positiveEven;
//        int positiveOdd;
//         if (inputValue < 0) {
//             neg = inputValue;
//             emit localVar("Returning value from 'neg'");
//             return neg;
//         } else if (inputValue > 0 && inputValue % 2 == 0) {
//             positiveEven = inputValue;
//             emit localVar("Returning value from 'positiveEven'");
//             return positiveEven;
//         } else if (inputValue > 0 && inputValue % 2 != 0) {
//             positiveOdd = inputValue;
//             emit localVar("Returning value from 'positiveOdd'");
//             return positiveOdd;
//         } else {
//             emit localVar("Returning value 0");
//             return 0;
//         }
//     }
//     event localVar(string message);
// }


                        //generating logs
// contract Event {
//  event Log(address indexed sender, string msg);
//  event AnotherLog();
//  function test() public {
//  emit Log(msg.sender, "Hello Web3.0");
//  emit Log(msg.sender, "It's all about Decentralization");
//  emit AnotherLog();
//  }
// }
