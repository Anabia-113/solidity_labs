// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//task 1
// contract Public {
//     string public publicmsg = "Public Variable is Called";

//     function getpublic() public view returns (string memory) {
//         return publicmsg;
//     }
// }
// contract public2 is Public{

// }

//task 2
// contract PublicVisibility{
//     uint public publicData = "public data";

// }
// contract PublicChild is PublicVisibility{
//     function getPublicData() public view returns(uint){
//         return publicData;
//     }
// }

//task 3
// contract Private {
//     string public privatemsg = "Private Variable is Called";

//     function getprivate() private view returns (string memory) {
//         return privatemsg;
//     }

//     function getprivatevar() public view returns (string memory) {
//         return privatemsg;
//     }

//     function getprivatefunc() public view returns (string memory) {
//         //You are calling 'getprivate()' function here
//         //It returns a string value which is then returned by the
//         //'getprivatefunc()' function
//         return getprivate();
//     }
// }
// contract private2 is Private{

// }

//task 4
// contract Bank{
//     uint private balance;
//     function Deposite(uint amount) public{
//         balance+= amount;

//     }
// }
// contract BankUser is Bank{
//     function get() public view returns(uint){
//         return balance;
//     }

// }

//task 5
// contract Internal {
//     string public internalmsg = "Internal Variable is Called";

//     function getinternal() internal view returns (string memory) {
//         return internalmsg;
//     }

//     function getinternalvar() public view returns (string memory) {
//         return internalmsg;
//     }

//     function getinternalfunc() public view returns (string memory) {
//         return getinternal();
//     }
// }
// contract Internal2 is Internal{
//     function modifyStateVar() public{
//         internalmsg = "newMsg";
//     }

// }

//task 6
// contract FamilyFortune{
//     uint internal inheritence;
//     function addInheritance(uint amount) internal{
//         inheritence += amount;
//     }
// }
// contract Heir is FamilyFortune{
//     function addInheritence(uint amount) public{
//       addInheritence(amount);
// }

// }

//task 7
// contract External {
//     // string external externalmsg = "External Variable is Called";//state variables cannot be external
//     function getexternal() external pure returns (string memory) {
//         return "External Function";
//     }
//     //error because we cannot call an external function within the contract
//     // function getexternalfunc() public view returns(string memory){
//     // return getexternal();
//     // }
// }

// contract External2 is External {
//     function getexternalfunc() public view returns (string memory) {
//         return getexternal();
//     }
// }

//task 8

// contract Apartment {
//     uint internal tenantCount;

//     // External function for new tenants to join the apartment
//     function joinApartment() external {
//         tenantCount++;
//     }

//     // Internal function to get the tenant count
//     function getTenantCount() internal view returns (uint) {
//         return tenantCount;
//     }
// }
// contract Tenant is Apartment {
//     // This contract inherits the joinApartment() function from the parent contract
//     // which is inherited from the parent contract
//     function getTenantCountFromTenant() public view returns (uint) {
//         return getTenantCount(); // This is possible since the function is inherited
//     }
// }

//task 9
// contract Base {
//     uint256 public x;

//     function setX(uint256 _x) public {
//         x = _x;
//     }
// }

// contract Derived is Base {
//     function getX() public view returns (uint256) {
//         return x;
//     }
// }

//task 10
// contract parent{
//     uint parentValue;
// }
// contract child{
//     uint childValue;
// }

//task 11
// contract Base {
//     string public base = "Base Contract";

//     function foo() public view virtual returns (string memory) {
//         return base;
//     }
// }

// contract Middle is Base {
//     string public middle = "Middle Contract";

//     function foo() public view virtual override returns (string memory) {
//         return middle;
//     }
// }

// contract Derived is Middle {
//     string public derived = "Derived Contract";

//     function foo() public view virtual override returns (string memory) {
//         return derived;
//     }
// }

//task 12
// contract BaseUser{
//     address public userAddress;
//      constructor(address _address) {
//         userAddress = _address;
//     }
//     event base(address);
//     function Print() public virtual {
//         emit base(userAddress);
//     }
// }
// contract Moderator is BaseUser{
//     string public name;
//     constructor(address _address, string memory _name) BaseUser(_address) {
//         name = _name;
//     }
//     event moderator(address, string);
//     function Print() public virtual override {
//         emit moderator(userAddress, name);
//     }

// }
// contract Admin is Moderator{
//     uint public PIN;
//     constructor(address _address, string memory _name, uint _pin) Moderator(_address, _name) {
//         PIN = _pin;
//     }
//     event admin( address, string, uint);
//     function Print() public override {
//         emit admin(userAddress, name, PIN);
//     }

// }

//task 13
contract Base {
    uint256 public x;

    function setX(uint256 _x) public {
        x = _x;
    }
}

contract DerivedA is Base {
    function getX() public view returns (uint256) {
        return x;
    }
}

contract DerivedB is Base {
    function getXTimesTwo() public view returns (uint256) {
        return x * 2;
    }
}
contract DerivedC is Base {
    function getXTimesTwo() public view returns (uint256) {
        return x * 3;
    }
}

