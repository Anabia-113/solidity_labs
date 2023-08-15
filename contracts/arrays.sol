// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
// contract array{
//     bytes1 public var1 = 'a';
//     bytes2 public var2 = 'b';
//     bytes3 public var3 = 'c';
//     bytes4 public var4 = 0x12345678;
//     function getBytes(uint i) public view returns(bytes1){
//         return var3[i];

//     }
//      function getBytesLength() public view returns(uint){
//         return var3 . length;

//     }
    
// }
          //fixed arrays
// contract Array{
//     uint[2] public num1 = [1,2];
//     uint8[3] public num2;
//     function setInt1(uint i , uint8 _num1) public {
//         num1[i] = _num1;
//     }

//     function setInt2(uint i , uint8 _num2) public {
//         num2[i] = _num2;
//     }

// }

             //dynamic array
contract array{
    uint[] public uninit_arr;

    function getArr() public view returns (uint[] memory){
        return uninit_arr;
    }

    function uinitPush(uint i) public {
        uninit_arr.push(i);
    }
    function uinitPop() public {
        uninit_arr.pop();
    }
    function uninitLen() public view returns(uint){
        return uninit_arr.length;
    }
    function remove(uint index) public{
        delete uninit_arr[index];
    }
    function setInt(uint i , uint8 _num1) public{
        uninit_arr[i] = _num1;
    }


}