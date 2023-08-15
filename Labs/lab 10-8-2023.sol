//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// contract Events{
//     event Transfer(address indexed from, address indexed to, uint256 value);
//     // define _transfer function，execute transfer logic
//     mapping(address =>uint256) public balances;
//  function _transfer(address from, address to, uint256 amount) external{
//  balances[from] = 10000000; // give some initial tokens to transfer address
//  balances[from] -= amount; // "from" address minus the number of transfer
//  balances[to] += amount; // "to" address adds the number of transfer
//  // emit event
//  emit Transfer(from, to, amount);
// }
// }
//task 2
// contract Event {
//  // Event declaration
//  // Up to 3 parameters can be indexed.
//  // Indexed parameters helps you filter the logs by the indexed parameter
//  event Log(address indexed sender, string msg);
//  event AnotherLog();
//  event About(string name, address indexed ContractAddress, string dept);
//  function test() public {
//  emit Log(msg.sender, "Hello Web3.0");
//  emit Log(msg.sender, "It's all about Decentralization");
//  emit AnotherLog();
//  emit About("anabia", 0xf8e81D47203A594245E36C48e151709F0C19fBe8, "IT");
//  }
// }

//task3
// contract PersonContract {
//  struct PersonInfo {
//      string name;
//      uint256 age;
//  }
// PersonInfo public P1;
// event Update(
//  PersonInfo oldValue,
//  PersonInfo newValue,
//  uint256 timestamp,
//  uint256 blockNumber
//  );
//  function setPersonInfo(uint256 newAge, string memory newName) public {
//  PersonInfo memory oldValue = P1;
//  P1.age = newAge;
//  P1.name = newName;
//  emit Update(oldValue, P1, block.timestamp, block.number);
// }

// }

//task 4
// contract ZeroAddressEventContract {
//     address public owner;

//     event ZeroAddressInputted(string message);
//     constructor(address _initialOwner) {
//         if (_initialOwner == address(0)) {
//             emit ZeroAddressInputted("Zero Address inputted on deployement of the contract");
//         } else {
//             owner = _initialOwner;
//         }
//     }
// }

//task 5
contract NoPrime {
    uint256 public num;
    event PrimeChecker(string, uint256);

    function setter(uint256 _inputNum) public {
        num = _inputNum;
    }

    function PrimeNo(uint256 number) internal pure returns (bool) {
        if (number <= 1) {
            return false;
        }
        if (number <= 3) {
            return true;
        }
        if (number % 2 == 0 || number % 3 == 0) {
            return false;
        }

        uint256 i = 5;
        while (i * i <= number) {
            if (number % i == 0 || number % (i + 2) == 0) {
                return false;
            }
            i += 6;
        }
        return true;
    }
    function check(uint256 number) public returns (bool) {
        if (PrimeNo(number)) {
            emit PrimeChecker("The Number is Prime", number);
            return true;
        } else {
            emit PrimeChecker("The Number is not Prime", number);
            return false;
        }
    }
}
