// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
// contract Enum{
//     enum Status{
//         pending,
//         cancelled,
//         shipped
//     }

//     Status public  status ;
//     function set(Status _status) public{
//         status = _status;
//     }
//     // // function get() public view returns(Status){
//     // //     return status;
//     // }
//     function pending() public{
//         status = Status.pending;
//     }
//     function shipped() public{
//         status = Status.shipped;
//     }
//     function cancelled() public{
//         status = Status.cancelled;
//     }
//     function remove() public {
//         delete status;
//     }
// }
contract Duty{
    enum day{
        none,
        monday,
        tuesday,
        thursday,
        friday,
        saturday,
        sunday
    }
    mapping(address => day) private person;

    function setDuty(address addr) public view returns(day){
        return person[addr];

    }
    function getMonday(address _addr , day _d) public{
        person[_addr] = _d;
        
    }
}