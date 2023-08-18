// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
//contract marketplace is the Base contract
contract Marketplace{
    mapping(address=> uint) balance;
    event Purchase(address indexed buyerAddress, address indexed senderAddress, uint valueOfPurchase);
     function register(address _participant, uint _initialBalance) external  {
         if(_initialBalance == 0){
             revert("_initialBalance cannot be zero"); }   
        balance[_participant] = _initialBalance;
    }
    function buy(address _seller, uint _cash, address _buyer) virtual external {
        require(balance[_seller] >= _cash, "Insufficient balance");
        require(balance[_seller] > 0, "Not registered");
        require(balance[_buyer] > 0, "Not registered");
        balance[_buyer] -= _cash;
        balance[_seller] += _cash;
        emit Purchase(msg.sender, _seller, _cash);
    }
    function sell(address buyer, uint256 price, address seller) virtual public returns (string memory) {
        require(balance[seller] > 0, "Seller not registered");
        require(balance[buyer] > 0, "Buyer not registered");
        require(price > 0, "Price should be greater than zero");
        require(msg.sender != buyer, "Seller and buyer cannot be the same");
        return "Item will be shipped to buyer's location";
    }

}
//contract premium seller
contract PremiumSeller is Marketplace{
    uint public fee;
    constructor(uint _fee){
        fee = _fee;
    }
    function sell(address buyer, uint256 price, address seller) virtual override public returns (string memory) {
        require(balance[seller] > 0, "balance of seller is zero");
        uint256 feeAmount = (price * fee) / 100;
        balance[msg.sender] -= price;
        balance[address(this)] += feeAmount; // Add fee to contract's balance
        return super.sell(buyer, price, seller);
    }
}
//contract regular buyer
contract RegularBuyer is Marketplace{

}
//contract VIP buyer
contract VIPBuyer is Marketplace{
    uint public discount;
    constructor (uint _discount){
        discount = _discount;
    }
    function buy(address _seller, uint256 _cash, address _buyer) virtual override  public {
        require(balance[_buyer] > 0, "Buyer not registered");
        require(balance[_seller] > 0, "Seller not registered");
        require(_cash > 0, "Cash should be greater than zero");
        uint256 discountedCash = _cash - (_cash * discount) / 100;
        require(balance[_buyer] >= discountedCash, "Buyer balance insufficient");
        balance[_buyer] -= discountedCash;
        balance[_seller] += discountedCash;
        emit Purchase(msg.sender, _seller, discountedCash);
    }

    }

