//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

          //task 1
// contract TicketBookingSystem{
//     enum TicketType{
//         economy,
//         bussiness,
//         firstClass
//     }
//     enum Days{
//         monday,
//         tuesday,
//         wednesday,
//         thursda,
//         friday,
//         saturday,
//         sunday

//     }
//     struct Ticket{
//         string passengers;
//         TicketType ticketType;
//         Days day;
//         bool isBooked;
//     }
//     Ticket[] public tickets;
//     function bookTicket(string memory _passenger, Days _day, TicketType _ticketType) public{
//         tickets.push(Ticket(_passenger, _ticketType, _day, false));

//     }
//      function getTicketType(uint _index) public view returns (TicketType){
//         return tickets[_index].ticketType;
//     }
//     function  getTicketDay(uint _index) public view returns (Days){
//         return tickets[_index].day;
//     }
//     function toggleStatus(uint _index) public {
//         tickets[_index].isBooked = !tickets[_index].isBooked;
//     }

// }

              //task 2
// contract Loop {
// uint[] data;
// function loop() public returns (uint[] memory) {

//  for (uint8 i = 0; i < 20; i=i+1) {
//  data.push(i);
//  }
//  return data;
// }
// }

           //task 3
contract ControlFlow {
// while
 function whileTest() public pure returns(uint256){
   uint sum = 0;
   uint i = 0;
   while(i < 15){
     sum += i;
     i++; }
 return(sum);
 }
 function ForLoop() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        for (i; i<15; i++)
        sum += i;
        return (sum);
    }
    function doWhileLoop() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        do {
        sum += i;
        i++;
        } while (i<15);
        return (sum);
    }
}
