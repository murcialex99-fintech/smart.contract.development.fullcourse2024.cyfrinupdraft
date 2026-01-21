// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
 
    function getPrice() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 price = getPrice(); 
        uint256 ethToUsd = (price * ethAmount) / 1e18;
        return ethToUsd;
    }

    function getVersion() internal view returns (uint256) {
         return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}

ABOUT THE CONTRACT
// This contract is a library that imports a Chainlink price feed interface. 
// The library converts current ETH price into USD.
// The address shown in getPrice and getVersion functions is the ETH/USD sepolia testnet address from Chainlink docs.
// This library was in turn imported into the FundMe contract as well.

GENERAL VIEW
// The contract is basically a library to be imported into the FundMe in order to fetch a reliable current price.
// However, I noticed that testnets are a lot slower and do not give reliable oracle prices.
