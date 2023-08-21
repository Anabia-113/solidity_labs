// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//contract marketplace is the Base contract
contract Marketplace {
    mapping(address => uint256) balance;
    event Purchase(
        address indexed buyerAddress,
        address indexed senderAddress,
        uint256 valueOfPurchase
    );

    function register(address _participant, uint256 _initialBalance) external {
        require(_initialBalance != 0, "initialBalance cannot be zero");
        balance[_participant] = _initialBalance;
    }

    function buy(
        address _seller,
        uint256 _cash,
        address _buyer
    ) external virtual {
        require(balance[_seller] > 0, "Not registered");
        require(balance[_buyer] > 0, "Not registered");
        require(balance[_buyer] >= _cash, "Insufficient balance");

        balance[_buyer] -= _cash;
        balance[_seller] += _cash;
        emit Purchase(_buyer, _seller, _cash);
    }

    function sell(
        address buyer,
        uint256 price,
        address seller
    ) public virtual returns (string memory) {
        require(balance[seller] > 0, "Seller not registered");
        require(balance[buyer] > 0, "Buyer not registered");
        require(price > 0, "Price should be greater than zero");
        require(seller != buyer, "Seller and buyer cannot be the same");
        return "Item will be shipped to buyer's location";
    }
}

//contract premium seller
contract PremiumSeller is Marketplace {
    uint256 public fee;

    constructor(uint256 _fee) {
        fee = _fee;
    }

    function sell(
        address buyer,
        uint256 price,
        address seller
    ) public virtual override returns (string memory) { 
        uint256 feeAmount = (price * fee) / 100;
        balance[buyer] -= price;
        balance[address(this)] += feeAmount; // Add fee to contract's balance
        require(balance[seller] > 0, "balance of seller is zero");
        return super.sell(buyer, price, seller);
    }
}

//contract regular buyer
contract RegularBuyer is Marketplace {

}

//contract VIP buyer
contract VIPBuyer is Marketplace {
    uint256 public discount;

    constructor(uint256 _discount) {
        discount = _discount;
    }

    function buy(
        address _seller,
        uint256 _cash,
        address _buyer
    ) public virtual override {
        require(balance[_buyer] > 0, "Buyer not registered");
        require(balance[_seller] > 0, "Seller not registered");
        uint256 discountedCash = _cash - (_cash * discount) / 100;
        balance[_buyer] -= discountedCash;
        balance[_seller] += discountedCash;
        emit Purchase(msg.sender, _seller, discountedCash);
    }
}
