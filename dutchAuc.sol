// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
contract DutchAuction {

	address payable public immutable beneficiary; 
	uint public immutable startingPrice;
	uint public startAt;
	uint public immutable expiresAt;
	uint public immutable discountRate;
	uint private immutable duration;
	

	constructor(address payable beneficiaryAddress, uint _startingPrice,uint _discountRate, uint _duration) {
		beneficiary = beneficiaryAddress;
        startingPrice = _startingPrice;
        startAt = block.timestamp;
        expiresAt = block.timestamp + _duration;
        discountRate = _discountRate;
	}


	function buy() external payable{
		require(block.timestamp < expiresAt, "auction expired");

        uint timeElapsed = block.timestamp - startAt;
        uint discount = discountRate * timeElapsed;
        uint price = startingPrice - discount;

        require(msg.value >= price, "bid value is lower than the current price");

        beneficiary.transfer(msg.value);

        selfdestruct(beneficiary);
	}

}
