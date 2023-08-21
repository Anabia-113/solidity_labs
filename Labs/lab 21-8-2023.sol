// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//task 1
// contract Student {
//     string private stdName;
//     uint256 private stdRollNum;

//     // setting values of state variables
//     constructor(string memory name, uint256 rollNum) {
//         stdName = name;
//         stdRollNum = rollNum;
//     }
// }

// contract StudentsList {
//     // array to store students ( composition )
//     Student[] public students;

//     constructor() {
//         Student newStudent = new Student("Burak", 20);
//         students.push(newStudent);
//     }
// }

//task 2
contract Person {
        string public name;
        uint256 public age;
        string public disease;
        constructor(string memory _name, uint _age, string memory _disease){
            name = _name;
            age = _age;
            disease = _disease;
        }
        




}
