// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
contract DutchAuction {

	address payable public immutable beneficiary; //contract owner address
	uint public immutable startingPrice; //start price of contract
    uint public immutable minPrice;  //minimum price of contract
	uint public immutable startAt;   //timestamp of contract start
    uint public immutable endAt;    //timestamp of contract end
	uint public immutable discountRate; //price drop per step
	uint private immutable duration;  //price holding duration
    
    bool ended;
	
    //Test construcator value
    //0x2C89DF082212717B6D5B8BedDEeeBE3fA03D215F
    //100000000000000000
    //1000000000000000
    //10000000000000000
    //10
	constructor(address payable beneficiaryAddress, uint _startingPrice,uint _discountRate, uint _minPrice, uint _duration) {
		beneficiary = beneficiaryAddress;
        startingPrice = _startingPrice;
        startAt = block.timestamp;
        minPrice = _minPrice;
        discountRate = _discountRate;
        duration = _duration;
        //Calculate the end time of the contract
        endAt = startAt + ((startingPrice - minPrice) / discountRate + 1) * duration;
        //Validate the start price and minimum price
        require(_startingPrice >= _minPrice, "starting price < min");
	}

    //Test function need to remove
    function getDropTime() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        return timeElapsed / duration;
    }

    //View function to check the current price without gas fee
    function getPrice() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        //Maintain the price for a specific duration, then gradually reduce it in incremental steps
        uint discount = discountRate * (timeElapsed / duration);
        //Stop the price drop and set it to minimun price when it reaches the minimum price
        uint price;
        if(discount > startingPrice - minPrice){
            //Constract ended, set the price lower than the minPrice 
            price = minPrice;
        }
        else {
            price = startingPrice - discount;
        }
        return price;
    }

	function buy() external payable{
        //Validate the contract state before taking any further action
        if(ended)
            revert("bid ended");

        //Validate the contract state by comparing the current timestamp and endtime
        require(block.timestamp >= endAt, "bid ended");
        
        uint price = getPrice();

        require(msg.value >= price, "bid value is lower than the current price");

        ended = true;

        beneficiary.transfer(msg.value);

	}

}
