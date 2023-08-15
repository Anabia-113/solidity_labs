// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// contract EncapFuncCalls {
// function someFuncWithManyInputs(
// uint x,
// uint y,
// uint z,
// address a,
// bool b,
// string memory c) public pure returns (uint _x,uint _y,uint _z,address _a,bool
// _b,string memory _c ) {
// _x = x;
// _y = y;
// _z = z;
// _a = a;
// _b = b;
// _c = c;
// }
// function callFunc() external pure returns (uint _x,uint _y,uint _z,address _a,bool _b,string memory _c ) {
// return someFuncWithManyInputs(1, 2, 3, address(0), true, "Simple Function Call");
// }
// function callFuncWithKeyValue() external pure returns (uint _x,uint _y,uint _z,address _a,bool _b,string memory _c ) {
// return someFuncWithManyInputs({a: address(0), b: true, c: "Function Call with Key Value", x: 1, y: 2, z: 3});
// }
// }


                //task 2
// contract about{
    //first
    // string public name;
    // string public gender;
    // address public walletAddress;
    // function setName(string memory _name) public{
    //     name = _name;
    // }
    //  function getGender(string memory _gender) public{
    //     gender = _gender;
    //  }
    //  function getWalletAddress(address _walletAddress) public{
    //      walletAddress = _walletAddress;
    //  }
    //second
    // function About() public pure returns(string memory, string memory, address){
    //     return ("anabia", "female", 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f );
    // }
    //third
    // function About() public pure returns(string memory _name, string memory _gender, address _addres){
    // return ("anabia", "female", 0x2A2fff2F220A616F15876fbb82C06f87C5c5a76f );

     
    // } 
              



        //task 3
// contract circle{
//     function calculateCircumference(uint r) public pure returns(uint circumference){
//         uint pi = 31435;
//         return circumference = (2*pi*r)/10000;


//     }
// }
   

      //task 4
contract FunctionTypes{
uint public number = 4;
// default
function add() public{
number += 2;
}
// // pure
function addPure(uint256 _number) public pure returns(uint temp_number){
return temp_number = _number+ 2;
}
// // view
function addView() public view returns(uint temp_number) {
return temp_number = number + 2;

}
}



       //task 5
// contract DArray {
// uint[] public arr;
// function getlength() public view returns(uint){
// return arr.length;
// }
// }



      //task 6
// contract array{
//     uint[4] arr1;
//     function getArray() public view returns(uint[4] memory){
//         return arr1; 
//     }
//     function revalue() public{
//         arr1[0] = 2;
//         arr1[2] = 10;
//     }
// }


    //task7
//    contract array{
//        string[] arr2;
//       function pushFullName(string memory fullName ) public {
//         arr2.push(fullName); 

//    } 
//    function Len() public view returns(uint){
//         return arr2.length;

//    }
//    function popLastName() public {
//         arr2.pop();
//    }
//    function getFirstName() public view returns (string memory) {
//         return arr2[0];
//    }
//    }
    
        //task 8
// contract Array{
// int[4] public array;
// function ipush() public{
// array[0] = -5;
// array[1] = 0;
// array[2] = 5;
// array[2] = 10;

// }
// function get() public view returns(int[4] memory){
// return array;
// }
// function getlength() public view returns(uint){
// return array.length;
// }
// }

        //task 9
    // contract DynamicIntArray {
    // int[] public arr;
    // function push(int _x) public{
    //     arr.push(_x);
    //  }
    //  function retrive(uint index) public view returns(int){
    //      return arr[index];
    //  }
    //  function remove(uint index) public{
    //      delete arr[index];

    //  }
    //  function upop() public{
    //     arr.pop();
    //  }
    // }



    
