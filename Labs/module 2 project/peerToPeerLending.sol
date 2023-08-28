// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./SafeMath.sol";
import "./Credit.sol";

contract PeerToPeerLending is Ownable{
    using SafeMath for uint;
    struct User{
        bool credited;
        address activeCredit;
        bool fraudStatus;
        address[] allCredits;
    } 
    mapping(address=> User) public users;
    address[] public credits;

    event LogCreditCreated(address indexed _address, address indexed _borrower, uint indexed timestamp);
    event LogCreditStateChanged(address indexed _address, Credit.State indexed state, uint indexed timestamp);
    event LogCreditActiveChanged(address indexed _address, bool indexed active, uint indexed timestamp);
    event LogUserSetFraud(address indexed _address, bool fraudStatus, uint timestamp);

    function applyForCredit(uint requestedAmount, uint repaymentsCount, uint interest, bytes memory creditDescription) public returns(address _credit){
        require(users[msg.sender].credited == false);
        require(users[msg.sender].fraudStatus == false);
        assert(users[msg.sender].activeCredit == address(0));
        users[msg.sender].credited == true;

        Credit credit = new Credit(requestedAmount, repaymentsCount, interest, creditDescription);
        users[msg.sender].activeCredit = address(credit);
        credits.push(address(credit));
        users[msg.sender].allCredits.push(address(credit));
        emit LogCreditCreated(address(credit), msg.sender, block.timestamp);
        return address(credit);

    }
    function getCredits() public view returns(address[] memory){
        return credits;
    }
    function getUserCredits() public view returns(address[] memory){
        return users[msg.sender].allCredits;
    }
    function setFraudStatus(address _borrower) external returns(bool){
        users[_borrower].fraudStatus = true; //update user fraud status
        emit LogUserSetFraud(_borrower, users[_borrower].fraudStatus, block.timestamp); //log fraud status
        return users[_borrower].fraudStatus;
    }
    function changeCreditState(Credit _credit, Credit.State state) public onlyOwner{
        Credit credit = Credit(_credit); //call credit contract stateChange
        credit.changeState(state);
        emit LogCreditStateChanged(address(credit), state, block.timestamp);
    }
    function changeCreditState(Credit _credit) public onlyOwner{
        Credit credit  = Credit(_credit);
        bool active = credit.toggleActive();
        emit LogCreditActiveChanged(address(credit), active, block.timestamp); //log state change
    }


}
