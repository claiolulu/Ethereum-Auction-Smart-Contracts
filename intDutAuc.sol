// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "dutchAuc.sol";

contract intAuc {
    
    DutchAuction public da;
    address payable public owner;
  
    constructor (address payable _saddress,
                 address payable owneraddress
    )  {
        owner = owneraddress;
        da = DutchAuction(_saddress);
    }
    
   modifier onlyOwner {
        require(msg.sender == owner, "Only contract owner can do this");
        _;
    }  

    //function () payable {
    //       sa.bid.value(msg.value)();

    //}
    
    receive () external payable {
	if (msg.sender == owner) {
            buy();
	}
        
    }
    
    function buy() public payable {
        da.buy{value: msg.value}();
        
    }
    
    function getPrice() public {
        da.getPrice();
    }
    
    function destroy() public onlyOwner{
        selfdestruct(owner);
    }


}
    
    
