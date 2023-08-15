// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// contract AgeVerifier{
//         function checkEligibility(uint age) public pure returns (bool) {
//         if (age >= 18) {
//             return true;
//         } else {
//             return false;
//         }
//     }
// }


      //Task 2
// contract IntegerChecker{
//     function checkInteger(int256 number) external pure returns (string memory) {
//         if (number >= 0 && number <= 255) {
//             return "uint";
//         }
//         else if (number >= -255 && number <= 0){
//             return "int";
//         }
//          else {
//             return "invalid";
//         }
//     }
// }

      //task 3
// contract AgeVerifier{
//         function checkEligibility(uint age) public pure returns (bool) {
//         return (age >= 18) ? true : false;
//     }
// }

       //task 4
contract result {
    function examGrade(int256 score) external pure returns (bool, string memory) {
        if (score >= 60) {
            if (score >= 80 && score <= 100) {
                return (true, "Achieved Grade: A");
            } else  {
                return (true, "Achieved Grade: B");
            } 
        }else{
            if (score >= 40 && score <= 59) {
                return (false, "Achieved Grade: C");
            } else {
                return (false, "Better Luck Next Time");
            }
        }
    }
}

