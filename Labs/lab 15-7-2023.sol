// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
// pragma solidity ^0.8.17;
// contract StateVariable {
//     uint public storedData; // State variable
//     constructor() {
//         storedData = 10; // Using State variable
// }
// }
           //task 2

// pragma solidity ^0.8.17;
// contract constant_val{
//     uint256 constant PI = 31415;
// function calculateArea(uint radius) public pure returns (uint area){
//     return area = (PI * radius * radius) / 10000;
// }


// }
             //Task 3

pragma solidity ^0.8.17;
contract person{
    string public _firstName;
    string public _lastName;
function setFullName(string memory firstName, string memory lastName) public{
    _firstName = firstName;
    _lastName = lastName;

     }
function getFullName() public view returns (string memory){
    return string(abi.encodePacked(_firstName, " ", _lastName));

     }


}

        //task4

// pragma solidity ^0.8.17;
// contract myAddress{
//     address public immutable ADMIN_Address = 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f ;
// function getAdminAddress() public view returns(address){
//     return ADMIN_Address;
// }
// }


        //task5


// pragma solidity ^ 0.8.17 ;
// contract Constant {
// // constant variables must be initialized at the time of declaration and cannot be changed afterwards
// uint256 public constant CONSTANT_NUM = 10 ;
// string public constant CONSTANT_STRING = "0xAA" ;
// bytes public constant CONSTANT_BYTES = "WTF" ;
// address public constant CONSTANT_ADDRESS =
// 0x0000000000000000000000000000000000000000 ;
// // CONSTANT_NUM = 100 ;
// // CONSTANT_STRING = "0xBA" ;
// // CONSTANT_BYTES = "Hello" ;
// // CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000001 ;
// // immutable variables can be initialized in the constructor and cannot be changed afterwards
// uint256 public immutable IMMUTABLE_NUM = 9999999999 ;
// address public immutable IMMUTABLE_OWNER;
// address public immutable IMMUTABLE_ADDRESS;
// uint256 public immutable IMMUTABLE_BLOCK;
// uint256 public immutable IMMUTABLE_TIMESTAMP;
// address public immutable IMMUTABLE_COINBASE;
// uint256 public immutable IMMUTABLE_TEST;
// // Use constructor to initialize immutable variables, so you can use
// constructor (){
// IMMUTABLE_OWNER = msg.sender;
// IMMUTABLE_ADDRESS = address ( this );
// IMMUTABLE_BLOCK = block.number ;
// IMMUTABLE_TIMESTAMP = block.timestamp;
// IMMUTABLE_COINBASE =block.coinbase;
// IMMUTABLE_TEST = test ();
// }
// function test () public pure returns ( uint256 ){
// uint256 what = 9 ;
// return (what);
// }
// }
            //task 6
// pragma solidity ^0.8.17;
// contract SimpleStorage {
// // State variable to store a number
//        uint public num;
// function input(uint _num) public {
//      num = _num;
// }
// function output() public view returns (uint) {
//       return num;
// }
// }
            




         
