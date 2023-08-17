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
// contract Base {
//     uint256 public x;

//     function setX(uint256 _x) public {
//         x = _x;
//     }
// }

// contract DerivedA is Base {
//     function getX() public view returns (uint256) {
//         return x;
//     }
// }

// contract DerivedB is Base {
//     function getXTimesTwo() public view returns (uint256) {
//         return x * 2;
//     }
// }
// contract DerivedC is Base {
//     function getXCube() public view returns (uint256) {
//         return x ** 3;
//     }
// }

//task 14
// contract car{
//      string public make;
//      string public model;

//     constructor(string memory _make, string memory _model) {
//         make = _make;
//         model = _model;
//     }

// }
// contract electricCar is car{
//     uint256 public batteryCapacity;

//     constructor(
//         string memory _make,
//         string memory _model,
//         uint256 _batteryCapacity
//     )
//      car(_make, _model) {
//         batteryCapacity = _batteryCapacity;
//     }

// }
// contract hybridCar is car{
//        uint256 public gasTankCapacity;

//     constructor(
//         string memory _make,
//         string memory _model,
//         uint256 _gasTankCapacity
//     )
//      car(_make, _model) {
//         gasTankCapacity = _gasTankCapacity;
//     }

// }
// contract Instances {
//     electricCar public electricCarInstance;
//     hybridCar public hybridCarInstance;

//     constructor() {
//         electricCarInstance = new electricCar("ModelE", "Tesla", 500);
//         hybridCarInstance = new hybridCar("ModelF", "Toyota", 50);
//     }

//     function getElectricCarAttributes() public view returns (string memory, string memory, uint) {
//         return (
//             electricCarInstance.model(),
//             electricCarInstance.make(),
//             electricCarInstance.batteryCapacity()
//         );
//     }

//     function getHybridCarAttributes() public view returns (string memory, string memory, uint) {
//         return (
//             hybridCarInstance.model(),
//             hybridCarInstance.make(),
//             hybridCarInstance.gasTankCapacity()
//         );
//     }
// }
//task 15
// contract engine{
//     uint public horsePower;
//     constructor(uint _horsePower) {
//         horsePower = _horsePower;
//     }

// }
// contract transmission{
//     uint public gearType;

//     constructor(uint _gearType) {
//         gearType = _gearType;
//     }

// }
// contract car is engine , transmission{
//      constructor(uint _horsepower, uint _gearType)
//         engine(_horsepower)
//         transmission(_gearType)
//     {
//     }

//     // A function to get combined attributes
//     function getCarAttributes() public view returns (uint, uint) {
//         return (horsePower, gearType);
//     }

// }

//task 16
// contract WorkerRole {
//     address[] public workers;
//     mapping(address => bool) public isWorker;

//     function addWorker(address _worker) external {
//         isWorker[_worker] = true;
//     }

//     function submitWork() external pure {

//     }
// }

// contract ClientRole {
//     address[] public clients;
//     mapping(address => bool) public isClient;

//     function addClient(address _client) external {
//         isClient[_client] = true;
//     }

//     function createProject() external pure {

//     }
// }
// contract Freelancer is WorkerRole, ClientRole {
//     constructor() {

//     }
// }

// contract FreelancerInstance {
//     Freelancer public freelancerInstance;

//     constructor() {
//         freelancerInstance = new Freelancer();
//     }

//     function addWorker(address _worker) public {
//         freelancerInstance.addWorker(_worker);
//     }

//     function addClient(address _client) public {
//         freelancerInstance.addClient(_client);
//     }

//     function submitWork() public view {
//         freelancerInstance.submitWork();
//     }

//     function createProject() public view {
//         freelancerInstance.createProject();
//     }
// }

//task 15
// contract Participant {
//     address public participantAddress;

//     constructor() {
//         participantAddress = msg.sender;
//     }
// }

// contract Supplier is Participant {
//     mapping(address => uint256) public orders;

//     function placeOrder(address _manufacturer, uint256 _quantity) external {
//         orders[_manufacturer] += _quantity;
//     }
// }

// contract Manufacturer is Participant {
//     mapping(address => uint256) public manufacturedProducts;

//     function manufactureProduct(uint256 _quantity) external {
//         manufacturedProducts[participantAddress] += _quantity;
//     }
// }

// contract Product is Supplier, Manufacturer {
//     uint256 public productCount;

//     constructor() {
//         productCount = 0;
//     }

//     function trackProduct() external view returns (uint256, uint256) {
//         return (
//             orders[participantAddress],
//             manufacturedProducts[participantAddress]
//         );
//     }
// }

// contract SupplyChain {
//     Product public productInstance;

//     constructor() {
//         productInstance = new Product();
//     }

//     function placeOrder(uint256 _quantity) public {
//         productInstance.placeOrder(address(this), _quantity);
//     }

//     function manufactureProduct(uint256 _quantity) public {
//         productInstance.manufactureProduct(_quantity);
//     }

//     function trackProduct() public view returns (uint256, uint256) {
//         return productInstance.trackProduct();
//     }
// }

//task 16
/* Inheritance tree：
 Car
 / \
TOYOTA BMW
 \ /
 Supra
*/
contract Car {
    event Log(string message);

    function demo() public virtual {
        emit Log("Base Car demo Called");
    }

    function temp() public virtual {
        emit Log("Base Car temp Called");
    }
}

contract TOYOTA is Car {
    function demo() public virtual override {
        emit Log("TOYOTA demo called");
    }

    function temp() public virtual override {
        emit Log("TOYOTA temp called");
        super.temp();
    }
}

contract BMW is Car {
    function demo() public virtual override {
        emit Log("BMW demo called");
    }

    function temp() public virtual override {
        emit Log("BMW temp called");
        super.temp();
    }
}

contract Supra is TOYOTA, BMW {
    function demo() public override(TOYOTA, BMW) {
        super.demo();
    }

    function temp() public override(TOYOTA, BMW) {
        super.temp();
    }
}
