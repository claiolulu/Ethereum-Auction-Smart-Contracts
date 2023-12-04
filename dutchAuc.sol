// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
contract DutchAuction {

	address payable public immutable beneficiary; 
	uint public immutable startingPrice;
    uint public immutable minPrice;
	uint public startAt;
	uint public immutable expiresAt;
	uint public immutable discountRate;
	uint private immutable duration;
    
    bool ended;
	

	constructor(address payable beneficiaryAddress, uint _startingPrice,uint _discountRate, uint endPrice, uint _duration) {
		beneficiary = beneficiaryAddress;
        startingPrice = _startingPrice;
        startAt = block.timestamp;
        expiresAt = block.timestamp + _duration;
        minPrice = endPrice;
        discountRate = _discountRate;
	}

    function getPrice() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        uint discount = discountRate * timeElapsed;
        return startingPrice - discount;
    }

	function buy() external payable{
		require(block.timestamp < expiresAt, "auction expired");

        uint price = getPrice();
    
        require(price >= minPrice, "bid ended");

        require(msg.value >= price, "bid value is lower than the current price");
        
        if(ended)
            revert("bid ended");

        ended=true;

        beneficiary.transfer(msg.value);
	}

}
