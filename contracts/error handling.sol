// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
contract error{
    int public i;
    function set(int _i) public{
        i = _i;
    }
    // function int_to_uint(int num) public view returns(uint){
    //     require(num >= 0 , "int is -ve");
    //     uint _u1 = uint(i);
    //     return _u1;
        // function int_to_uint() public view{
        // if( i < 0){
        // }
        // else{
        //     revert("int is -ve");
        // }
        // function int_to_uint(int num) public view returns(uint){
            // assert (num >=0 );
            // uint _u1 = uint(i);
            // return _u1;
            function Require(uint _amount) public{
                withdraw(_amount);
                require(_amount >= 100 , "some error");
                
            }
}
