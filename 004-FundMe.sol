// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5 * 1e18;

    address[] public funders;

    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
    
        funders = new address[](0); 

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

}

// ABOUT THE CONTRACT
// This contract allows several functions: funding from users and withdraw (owner).
// Other functions not seen are getPrice, getConversionRate, getVersion (imported from PriceConverter.sol).
// Whenever we interact with another contract we need the address (ETH sepolia from chainlink) and ABI (AggregatorV3Interface).
// We can call the contract functions from AggregatorV3Interface thanks to importing it (either from folder ./ or github @).
// In EVM and Solidity decimals do not work, so we make sure we use the correct number of units when we interact with contracts.
// msg.sender and msg.value refer to the sender of the current call and the number of wei in the tx respectively.
// The deployer is eventually able to withdraw the funds (function withdraw will reset the funder array and withdraw all the funds).
// There are 3 ways to withdraw the funds: transfer, send or call.
// Some state variables such as the mentioned above must be placed inside of a function.
// Fallback and receive functions were added later on, which, along with constructor, are considered special functions.

// GENERAL VIEW
// Contracts can import other contracts but also libraries and interfaces (which in turn can also import other files).
// I personally prefer to place the state variables together - just after contract declaration - before the functions (for readability).
// This contract was clearly more complex than SimpleStorage & StorageFactory; has more variables, imports and varied functions.

// 0x22d90b4f061fCcFa4043323544F1F9ec79Cf1454 (Ethereum metamask address)
// 0x39Fff44A550144De0169dda65fA59C0852FB49f2 (sepolia ethereum block explorer - contract address)
// Not possible to deploy into zkSync testnet because of network issues.