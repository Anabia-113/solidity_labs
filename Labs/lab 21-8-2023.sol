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
// contract SimpleDivision {
//     function Divide2Nums(uint256 numerator, uint256 denominator)
//         public
//         pure
//         returns (uint256)
//     {
//         return numerator / denominator;
//     }
// }

// contract TryCatchExample {
//     SimpleDivision public simpleDivision;
//     event catchPanic(uint errorMsg);
//     event catchError(string errorMsg);
//     event catchBytes(string errorMsg);

//     function tryDivide(uint256 numerator, uint256 denominator)
//         public
//         returns (bool a, uint256 b)
//     {
//         try simpleDivision.Divide2Nums(numerator, denominator) returns (uint256 result) {
//             return (true, result);
//         }
//         catch Panic(uint errorCode){
//             emit catchPanic(errorCode);

//         }
//         catch Error(string memory reason){
//             emit catchError(reason);

//         }
//         catch (bytes memory) {
//             // Revert for unknown error
//             emit catchBytes("Unknown error");

//         }

//     }
// }

//task 5

import "./Callee.sol";

// contract LibraryClient {
//     SumContract public foo = new SumContract();

//     function GetExponential(uint256 firstVal, uint256 secondVal)
//         public
//         pure
//         returns (uint256)
//     {
//         return Explibrary.exponential(firstVal, secondVal);
//     }

//     function Sum(uint256 firstVal, uint256 secondVal)
//         public
//         view
//         returns (uint256)
//     {
//         return foo.sum(firstVal, secondVal);
//     }
// }

//task 6
// library Operations {
//     function add(uint256 a, uint256 b) internal pure returns (uint256) {
//         return a + b;
//     }

//     function subtract(uint256 a, uint256 b) internal pure returns (uint256) {
//         require(a >= b, "Subtraction result must be positive or zero");
//         return a - b;
//     }

//     function power(uint256 base, uint256 exponent) internal pure returns (uint256) {
//         uint256 result = 1;
//         for (uint256 i = 0; i < exponent; i++) {
//             result *= base;
//         }
//         return result;
//     }
// }

// contract App {
//     using Operations for uint256;

//     function calculate(uint256 a, uint256 b, uint256 exponent) external pure returns (uint256 sum, uint256 diff, uint256 pow) {
//         // Calculate sum using the library function
//         sum = a.add(b);

//         // Calculate difference using the library function
//         diff = a.subtract(b);

//         // Calculate power using the library function
//         pow = a.power(exponent);
//     }
// }

//task 7
// import "./Callee.sol";
// contract Import {
//  Callee public demo = new Callee();
//  // Test Callee.sol by getting it's name.
//  function getdemoName() public view returns (string memory) {
//  return demo.name();
//  }
// }

//task 8
// contract ABI {
//     function encode(address _address, uint256 data)
//         public
//         pure
//         returns (bytes memory)
//     {
//         return (abi.encode(_address, data));
//     }

//     function encodePacked(address _address, uint256 data)
//         public
//         pure
//         returns (bytes memory result)
//     {
//         result = abi.encodePacked(_address, data);
//     }

//     function encodeWithSelector(address _address, uint256 data)
//         public
//         pure
//         returns (bytes memory result)
//     {
//         result = abi.encodeWithSelector(
//             bytes4(keccak256("encodeWithSelector(address, uint )")),
//             _address,
//             data
//         );
//     }

//     function encodeWithSignature(address _address, uint256 data)
//         public
//         pure
//         returns (bytes memory result)
//     {
//         result = abi.encodeWithSignature(
//             ("encodeWithSelector(address, uint)"),
//             _address,
//             data
//         );
//     }
// }

//task 9
// contract LaptopContract {
//     struct Laptop {
//         string brand;
//         uint256 price;

//     }
//     bytes public b;
//     Laptop public laptopDecoded;

//     function encodeLaptops(string memory _brand, uint _price) external returns (bytes memory)
//     {
//         b=abi.encode(Laptop(_brand,_price));
//         return b;
//     }
//     function decode() public {
//         laptopDecoded = abi.decode(b, (Laptop));
//     }
// }

//task 10
contract Vote {
    struct voter {
        address Address;
        string name;
        uint ID;
        uint DOB;

    }
    bytes public b;
    voter public VoteDecoded;

    function encodeLaptops(address _Address, string memory _name, uint _ID, uint _DOB) external returns (bytes memory)
    {
        b=abi.encode(voter(_Address,_name, _ID, _DOB));
        return b;
    }
    function decode() public {
        VoteDecoded = abi.decode(b, (voter));
    }
}
