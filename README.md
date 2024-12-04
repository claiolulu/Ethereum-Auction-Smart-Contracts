# Ethereum Auction Smart Contracts

This repository contains two Ethereum-based smart contracts developed using Solidity: a **Proportional Bidding Auction** and a **Dutch Auction**. Both contracts demonstrate advanced auction mechanisms and can be deployed and tested on any Ethereum-compatible test network.

---

## Contracts Overview

### 1. **Proportional Bidding Auction**
This contract allows users to bid on **two different items** simultaneously by specifying a proportion along with their Ether payment. Key features include:
- **Proportional Bidding**: Each bid specifies how much Ether to allocate to each item (e.g., 30% for Item 1 and 70% for Item 2).
- **Independent Winners**: The highest bidder for each item may differ, allowing for independent auction outcomes.
- **Refunds**: Refunds are calculated and distributed proportionally for unsuccessful bids.

### 2. **Dutch Auction**
This contract implements a traditional **Dutch Auction** mechanism:
- The auction starts with a high price set by the auctioneer.
- If no bids are placed within a specified time frame, the price is lowered incrementally.
- The auction ends when:
  - A bidder finds the current price acceptable and pays.
  - The minimum price is reached without any bids.

---

## Deployment and Testing

### Test Network
- Both contracts were deployed and tested on the **Rinkeby** test network.

### Deployed Contracts
- **Proportional Bidding Auction**: `<Insert Contract Address>`
- **Dutch Auction**: `<Insert Contract Address>`

---
