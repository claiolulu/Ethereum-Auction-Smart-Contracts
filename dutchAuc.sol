// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

//Due to the absence of actual assets for real transactions within this contract,
//it serves solely as an experimental auction contract. 
//Bidders will not receive any profits or gains in the end
contract DutchAuction {

	address payable public immutable beneficiary; //Address designated to receive funds resulting from the auction.
	uint public immutable startingPrice; //start price of contract
    uint public immutable minPrice;  //minimum price of contract
	uint public immutable startAt;   //timestamp of contract start
    uint public immutable endAt;    //timestamp of contract end
	uint public immutable discountRate; //price drop per step
	uint private immutable duration;  //price holding duration in second
    uint private transPrice; //contract transaction price
    
    bool ended;
    //Test Network: Injected - MetaMask 
    //Contract Address: 0xBE4b3536279f5a7CC121630F3b6a330Ae0698776
    //startingPrice:
    //100000000000000000
    //discountRate:
    //5500000000000000
    //minPrice:
    //10000000000000000
    //duration(in second):
    //60
    //bid price
    //90000000000000000
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

    //View function to check the current price without gas fee
    function getPrice() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        //Maintain the price for a specific duration, then gradually reduce it in incremental steps
        uint discount = discountRate * (timeElapsed / duration);
        //Stop the price drop and set it to minimun price when it reaches the minimum price
        uint price;
        if(ended){
            price = transPrice;
        } else {
            if(discount > startingPrice - minPrice){
                //Constract ended, set the price equal the minPrice to avoid the value decrease any further
                price = minPrice;
            }
            else {
                price = startingPrice - discount;
            }
        }
        return price;
    }

    //View function to check the current status of contract
    function getContractStatus() public view returns (string memory) {
        if(ended || block.timestamp > endAt){
            return "the contract is ended";
        } else {
            return "the contract is open";
        }

    }

    receive() external payable{
        buy();
    } 

    //Function to allow users to place bids on the auction
	function buy() public payable{
        //Validate the contract state before taking any further action
        if(ended || block.timestamp > endAt)
            revert("bid ended");
        
        uint price = getPrice();

        require(msg.value >= price, "bid value is lower than the current price"); 

        transPrice = msg.value;

        ended = true;

        // Transfer the Ether sent by the bidder to the beneficiary (contract owner)
        beneficiary.transfer(msg.value);

	}

}
