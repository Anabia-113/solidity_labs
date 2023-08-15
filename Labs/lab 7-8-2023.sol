//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

              //task 1
// contract mapper{
//     mapping(string => uint) public NameToBalance;
//     function set(string memory name, uint balance)public{
//         NameToBalance[name] = balance;
//     }
//     function get(string memory _name) public view returns(uint balace){
//         return NameToBalance[_name];
//     }
//     function reset(string memory _name) public{
//         delete NameToBalance[_name];
//     }
// }
                //task 2

// contract Mappings{
//  mapping(address => mapping(string =>string)) public AddrWalletToName;
//  function AddValue(address _addr, string memory _walletname, string memory _name) public{
//  AddrWalletToName[_addr][_walletname] = _name;
//  }
//  function get(address _addr, string memory _walletname) public view returns(string memory){
//  return AddrWalletToName[_addr][_walletname];
//  }
//  function remove(address _addr, string memory _walletname) public{
//  delete AddrWalletToName[_addr][_walletname];
//  }
// }

               //task 3
// contract NameMap {
//     mapping(uint => mapping(address => mapping(string => string))) public UserMap;

//     function setMap(uint _yearofbirth, address _wallet, string memory _codename, string memory _username) public {
//         UserMap[_yearofbirth][_wallet][_codename] = _username;
//     }

//     function getMap(uint _yearofbirth, address _wallet, string memory _codename) public view returns (string memory _username) {
//         return UserMap[_yearofbirth][_wallet][_codename];
//     }

//     function reset(uint _yearofbirth, address _wallet, string memory _codename) public {
//         delete UserMap[_yearofbirth][_wallet][_codename];
//     }
// }

              //task 4
// contract StorageDLoc {
//  uint[] arr = [1,2,3]; // state variable
//  function fStorage() public view{
//  // Declare a local storage variable xStorage
//  uint[] memory xStorage = arr;
//  xStorage[0] = 100;
//  }
//  function fStorage1() public{
//  // Declare a local storage variable xStorage
//  uint[] storage yStorage = arr;
//  yStorage[0] = 100;
//  }
//  function get() public view returns (uint[] memory){
//  return arr;
//  }
// }

                     //task5
// contract MemoryAssignment {

//  function modifyMemory(uint[] memory originalArray) public pure
// returns (uint[] memory) {
//  // Assign the input array to a new variable in memory
//  uint[] memory newArray = originalArray;
//  // Modify a value within the new array
//  if (newArray.length > 0) {
//  newArray[0] = 999;
//  }
//  return originalArray; // Return the original array

               //task6
// contract calldataDloc {
//  function fCalldata(uint[] calldata _x) public pure
// returns(uint[] calldata){
//  _x[0] = 0;
//  return(_x);
//  }
// }

               //task 7

contract Cars {
    struct Car {
        string make;
        string model;
        string variant;
    }

    Car car;
    function initCar1() public returns (Car memory) {
        Car storage car1 = car;
        car1.make = "Toyota";
        car1.model = "prado";
        car1.variant = "LE";
        return car1;
    }

    function initCar2() public pure returns (Car memory) {
        Car memory car2;
        car2.make = "Honda";
        car2.model = "Civic";
        car2.variant = "EX";
        return car2;
    }
}









