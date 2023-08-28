// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// contract Address{
//    address public myAddress = 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f;


// }
contract baseA{
   uint public x;
   function setx(uint _x) public{
      x = _x;

   }

}
contract baseB{
   string public name;
   function setx(string memory _name) public{
      name = _name;

   }

}
contract derived is baseA, baseB{
   function getdata() public view returns(uint, string memory){
      return (x, name);
   }
}