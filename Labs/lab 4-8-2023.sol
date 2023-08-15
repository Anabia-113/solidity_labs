//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//task 1
// contract Loop{
//  uint[] public arr;
//  function NaturalNum(uint max) public returns(uint[] memory){
//  uint i = 4;
//  while(i <= max){
//  arr.push(i);
//  i+=4;
//  }
//  return arr; }
//  }

//             task 2
// contract NumberProcessor {
//  function calculateSumAndAverage(uint256[5] memory numbers) public pure
// returns (uint256 sum, uint average) {
//  uint256 totalSum = 0;
//  uint256 i = 0;
//  while(i < numbers.length) {
//  totalSum += numbers[i];
//  i++;
//  }
//  sum = totalSum;
//  average = totalSum/numbers.length;
//  }
// }

//task 3
// contract FibonacciSeries {
//  function generateFibonacci(uint256 n) public pure returns (uint256[] memory) {
//  uint256[] memory fibonacciSeries = new uint256[](n);
//  if (n >= 1) {
//  fibonacciSeries[0] = 0; }
//  if (n >= 2) {
//  fibonacciSeries[1] = 1; }
//  for (uint256 i = 2; i < n; i++) {
//             fibonacciSeries[i] = fibonacciSeries[i - 1] + fibonacciSeries[i - 2];
//  }
//  return fibonacciSeries; }
// }
//task 4
// contract Loop{
// //The value of cond that you will input will decide
// //the number of times the loop is run
// function iterate(uint cond) public pure returns(uint){
// uint i;
// uint iteration;
// do {
// iteration ++;
// i++;
// } while(i < cond);
// //If you input the value of 'cond' as 0, the condition will be false
// //on the first try, however you will notice that the loop still runs once
// return iteration;
// }
// }

//task 5
// contract Loop{
//  uint[] public arr;
//  function ODDNum(uint max) public{
//  uint i = 1;
//  while(i <= max){
//  if (i % 2 != 0)
//  arr.push(i);
//  i++;
//  }
//  }
//  function get() public view returns(uint[] memory){
//  return arr;
//  }
// }
//Modified form of above code
// contract Loop {
//     uint[] public arr;
//     function ODDNum(uint max) public {
//         uint i = 1;
//         do {
//             if (i % 2 != 0)
//                 arr.push(i);
//             i++;
//         } while (i <= max);
//     }
//     function get() public view returns(uint[] memory) {
//         return arr;
//     }
// }

//task 5
// contract ForLoop{
// uint[] public numtable;
// function table(uint num) public{
// uint temp = num;
// for(uint i = 1; i <= 20; i++){
// numtable.push(num);
// num += temp;
// }
// }
// function get() public view returns(uint[] memory){
// return numtable;
// }
// function resetarr() public{
// delete numtable;
// }
// }

//task 6
// contract ForLoop{
// int[5] public arr = [-9, 8, 7, -2, 1];
// int[] public positarr;
// int[] public negarr;
// function positivepart() public{
// for(uint i = 0; i < arr.length; i++){
// if(arr[i] >= 0){
// positarr.push(arr[i]);
// }
// }
// }
// function negtivepart() public{
// for(uint i = 0; i < arr.length; i++){
// if(arr[i] >= 0){
// negarr.push(arr[i]);
// }
// }
// }
// function getposit() public view returns(int[] memory){
// return positarr;
// }
// function getneg() public view returns (int[] memory) {
//         return negarr;
//     }
// }

//task 7
// contract Factorial {
//     function createFact(uint n) public pure returns (uint) {
//         uint factvalue = 1;
//         if (n == 0) {
//             return factvalue;
//         }
//         for (uint i = 1; i <= n; i++) {
//             factvalue *= i;
//         }
//         return factvalue;
//     }
// }

//task 7

contract MerkleTree {
    // Sum(H1,H2,H3,H4)
    // / \
    // Sum(H1,H2) Sum(H3,H4)
    // / \ / \
    // H1 H2 H3 H4
    uint256[] arr = [1, 1, 1, 1,1,3,3];
    

    function add() public {

        // uint256 length = arr.length;
        // uint256 offset =0;
        while (arr.length != 1) {
            if (arr.length % 2 ==1){
                arr.push(0);
            }
            for (uint i = 0; i < arr.length/2; i++) {
                arr[i]=arr[i*2] + arr[ (i*2) + 1];
            }            
            for (uint i = 0; i < arr.length; i ++) {
                arr.pop();
            }            
        }
    }

    function getter() public view returns (uint256[] memory) {
        return arr;
    }
}
