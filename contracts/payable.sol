// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
contract pay{
    function notPayable() public {

    }
     function Payable() public payable {

    }
    function getBalance() public view returns(uint){
        return address(this).balance;

    }
    function sendEther(address payable _user) public payable{
        _user.transfer (msg.value);
    }
}


