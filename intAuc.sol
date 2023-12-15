// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "dutchAuc.sol";

contract intAuc {
    //Test Network: Remix VM (Shanghai) 
    //Contract Address: 0xd9145CCE52D386f254917e481eB44e9943F39138
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
    
    
