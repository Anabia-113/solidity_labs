// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//task 1
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// contract MyToken is ERC20, ERC20Burnable, Ownable {
//     constructor() ERC20("AnabiaBaig", "ANB") {}

//     function mint(address to, uint256 amount) public onlyOwner {
//         _mint(to, amount);
//     }
// }

//task 2
// contract GasConsumer {
// uint256 public count;
// function consumeGas(uint256 iterations) public {
// for(uint256 i = 0; i < iterations; i++) {
// count++;
// }
// }
// }

//task 3
contract Task1 {
function etherToWei(uint valueEther) public pure returns (uint) {
return valueEther * (10**18);
}
function weiToEther(uint valueWei) public pure returns (uint) {
return valueWei / (10**18);
}
function etherToGWei(uint valueEther) public pure returns (uint) {
return valueEther * (10**9);
}
function gweiToEther(uint valueGwei) public pure returns (uint) {
return valueGwei / (10**9);
}
}