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
// contract Person {
//     string public name;
//     uint256 public age;

//     // setting values of state variables
//     constructor(string memory _name, uint256 _age) {
//         name = _name;
//         age = _age;
//     }
// }

// contract Patient is Person {
//     string public disease;
//     constructor(string memory _name, uint256 _age, string memory _disease) Person(_name, _age){
//         disease = _disease;
//     }
// }

//  contract PatientList {
//     Patient[] public patients;

//     function createPatient(string memory _name, uint256 _age, string memory _disease) public {
//         Patient newPatient = new Patient(_name, _age, _disease);
//         patients.push(newPatient);
//     }

//     function getPatientCount() public view returns (uint256) {
//         return patients.length;
//     }

//     function getPatientDetails(uint256 _index) public view returns (string memory, uint256, string memory) {
//         require(_index < patients.length, "Patient index out of range");
//         Patient patient = patients[_index];
//         return (patient.name(), patient.age(), patient.disease());
//     }
// }

//task 4
// contract PrimeChecker {
//     constructor(uint256 a) {
//         require(a != 0, "Invalid Entry");
//         assert(a != 1);
//     }

//     function isPrime(uint256 b) internal pure returns (bool) {
//         if (b <= 1) {
//             return false;
//         }
//         if (b == 2) {
//             return true;
//         }
//         if (b % 2 == 0) {
//             return false;
//         }
//         for (uint256 i = 3; i * i <= b; i += 2) {
//             if (b % i == 0) {
//                 return false;
//             }
//         }
//         return true;
//     }

//     function onlyPrime(uint256 b) external pure returns (bool success) {
//         // revert when a non-prime number is entered
//         require(isPrime(b), "Ups! Reverting");
//         success = true;
//     }
// }

// contract TryCatch {
//     // success event
//     event SuccessEvent();
//     // failure event
//     event CatchEvent(string message);
//     event CatchByte(bytes data);
//     PrimeChecker even;

//     constructor() {
//         even = new PrimeChecker(2);
//     }

//     function execute(uint256 amount) external returns (bool success) {
//         try even.onlyPrime(amount) returns (bool _success) {
//             emit SuccessEvent();
//             return _success;
//         } catch Error(string memory reason) {
//             // if call fails
//             emit CatchEvent(reason);
//         }
//     }

//     function executeNew(uint256 a) external returns (bool success) {
//         try new PrimeChecker(a) returns (PrimeChecker _even) {
//             // if call succeeds
//             emit SuccessEvent();
//             success = _even.onlyPrime(a);
//         } catch Error(string memory reason) {
//             emit CatchEvent(reason);
//         } catch (bytes memory reason) {
//             emit CatchByte(reason);
//         }
//     }
// }

//task 4
contract SimpleDivision {
    function Divide2Nums(uint256 numerator, uint256 denominator)
        public
        pure
        returns (uint256)
    {
        require(denominator != 0, "Denominator cannot be zero");
        return numerator / denominator;
    }
}

contract TryCatchExample {
    SimpleDivision public simpleDivision;

    constructor(address _simpleDivisionAddress) {
        simpleDivision = SimpleDivision(_simpleDivisionAddress);
    }

    function tryDivide(uint256 numerator, uint256 denominator)
        public
        view
        returns (bool, uint256)
    {
        try simpleDivision.Divide2Nums(numerator, denominator) returns (
            uint256 result
        ) {
            return (true, result);
        } catch Error(string memory errorMessage) {
            return (false, 0);
        } catch (bytes memory) {
            // Revert for unknown error
            revert("Unknown error");
        }
    }
}
