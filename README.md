# Programming-in-Fin-tech
MS815 – Programming for FinTech
Group assignment
ALL QUESTIONS CONTRIBUTE EQUALLY TO THE TOTAL


Part A (Python programming)
1)	Your client wants to purchase Apple stocks in 2 months’ time. They are exploring the Asian style option and would like evaluate the value of this option.  While the European or American call options are exercised at some strike price chosen right now, the Asian style option gives the right to purchase at the average spot price over the next two months.  

Assume the risk free interest rate r as 5%.

Write a 1-page report detailing your approach to solve this problem stating all assumptions. Include appropriate charts to support your analysis. 

2)	You have another client who is a technology enthusiast and he would like to invest in tech companies. Choose 5 active tech companies and build a diversified portfolio for your client. The client does not want to invest more than 40% of his budget in any single stock. Write a 1-page report detailing the following: (i) choice of stocks (ii) your approach to solve the portfolio optimisation problem (iii) appropriate analysis of your output including charts and explanation.

----------------
Include a copy of your simulation and/or optimisation programs and data that were used during this exercise. The page limit assumes that the text will be “normal” size (i.e. 11-12pt), single spaced and have ample page margins. It does not include the title page, contents page, reference list or appendices.  

Part B (Ethereum)

1)	Modify your simple auction contract to accept bids for two different items. 
a)	The contract should accept a proportion along with the ether payment. The bids will be placed based on the proportion. For instance, if proportion = 0.3 and you paid 10 Ethers then 0.3 of payment (3 Ethers) will be placed on first item and the remaining 0.7 of the payment (7 Ethers) will be placed on the second item.
b)	The highest bidder (winner) can be different for the first and second item. The proportion of refunds has to be individually calculated and given out. 

2)	Modify your simple auction contract to a Dutch auction. The auctioneer starts the auction at a certain price. Any bidder who finds the price acceptable can pay the price and the auction ends. If there are no bidders within a certain time period, the auctioneer lowers the asking price. The auction also ends when the minimum asking price has been reached and there are still no bidders.


----------------
Include a copy of your commented codes <filename.sol> in your submission. Use any test network to deploy your codes. Mention the following in the comments a) test network you used b) contract address

