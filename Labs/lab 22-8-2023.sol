// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//task 1
//cannot deploy
// interface Calculator {
//     function getResult() external view returns (uint256);
// }

// contract Temp is Calculator {
//     constructor() {}

//     function getResult() external pure returns (uint256 result) {
//         uint256 a = 2;
//         uint256 b = 5;
//         result = b / a;
//     }
// }

//task 2
// contract Counter {
//     uint256 public count = 2;

//     function square() external {
//         count = count**2;
//     }
// }

// interface ICounter {
//     function count() external view returns (uint256);

//     function square() external;
// }

// contract MyContract {
//     function squareCounter(address _counter) external {
//         ICounter(_counter).square();
//     }

//     function getCount(address _counter) external view returns (uint256) {
//         return ICounter(_counter).count();
//     }
// }

//task 3
// interface Token {
//     function transfer(address to, uint256 amount) external;
// }

// // Create the TokenContract contract
// contract TokenContract is Token {
//     mapping(address => uint256) balances;

//     // Implement the transfer function
//     function transfer(address to, uint256 amount) external override {
//         require(to != address(0), "Invalid recipient");
//         require(amount > 0, "Amount must be greater than 0");
//         require(balances[msg.sender] >= amount, "Insufficient balance");

//         balances[msg.sender] -= amount;
//         balances[to] += amount;

//         emit Transfer(msg.sender, to, amount);
//     }
//     function balanceOf(address account) external view returns (uint256) {
//         return balances[account];
//     }

//     // Event emitted on successful transfer
//     event Transfer(address indexed from, address indexed to, uint256 amount);
// }

//task 4
// contract Payable {
//     address payable public owner;

//     constructor() payable {
//         owner = payable(msg.sender);
//     }

//     function deposite() public payable returns (uint256 account, uint256 cont) {
//         cont = address(this).balance;
//         account = owner.balance;
//     }

//     function notPayable() public view returns (uint256 account, uint256 cont) {
//         cont = address(this).balance;
//         account = owner.balance;
//     }
// }

//task 5
contract PaymentContract {
    // Event emitted when a payment is received
    event PaymentReceived(address indexed sender, uint256 amount);

    // Payable function to receive Ether
    function receivePayment() external payable {
        emit PaymentReceived(msg.sender, msg.value);
    }
}
