// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "dutchAuc.sol";

contract intAuc {
    //Test Network: Injected - MetaMask 
    //Contract Address: 0xAb2B040ab0C81E941370d5684a72528dC2B352E9
    //DutchAuction address
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
    
    receive () external payable {
        buy();
    }
    
    function buy() public payable {
        da.buy{value: msg.value}();
        
    }

    function getPrice() public view {
        da.getPrice();
        
    }

    function getContractStatus() public view {
        da.getContractStatus();
        
    }

    function withdrawlocal(uint amount) external onlyOwner{
        owner.transfer(amount);
    }
    
    //function destroy() public onlyOwner{
      //  selfdestruct(owner);
    //}


}
    
    
