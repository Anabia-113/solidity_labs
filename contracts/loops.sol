// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
     //while loop
// contract quiz{
//     uint public count = 10;
//     function incrementWhileLessThanTen() public {
//         while (count <=10){
//             count++;
//         }

//     }
// }
     //do-while loop
// contract quiz{
//     int public count = 10;
//     function decrementWhileGreaterThanTen() public {
//         do{
//             count--;
//         }while (count > 0);

//     }
// }
 
         //for loop
// contract quiz{
//     uint public sum = 0;
//     function calculateSum(uint n) public{
//         for (uint i = 0; i <= n; i++){
//         sum += i;}
//     }
// }

        //nested loops
contract MaxUintCalculator{
    function macUint(uint256 digits) public pure returns (uint256){
        uint256 max = 0;
        for(uint i = 0; i < digits; i++){
        uint256 value = 1;
        for(uint j = 0; j < i; j++){
            value *= 2;
    }
    max += value;
  }
  return max;
}
}
