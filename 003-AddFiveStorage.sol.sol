// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    function store(uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber + 5;
    }
}

// ABOUT THE CONTRACT
// This contract imports SimpleStorage and inherits its functionality.
// However, it adds 5 to the store function. 
// The reason behind is the override keyword in the store function of the contract. 
// In order to work properly, I also added the virtual keyword in the SimpleStorage store function, which opens the instance.

// GENERAL VIEW
// This contract looks like a sort of appendix for SimpleStorage, that can be used when needed.
// The contract is exactly the same but the change in logic allows for a different outcome.

// 0x22d90b4f061fCcFa4043323544F1F9ec79Cf1454 (Ethereum metamask address)
// 0x6a781160f5F2cd00e34f84b85634066744c92C2b (sepolia zksync block explorer - contract address) 
// 0xc70B383A02e691D0E57aE268d525FbA1145C0bCD (sepolia ethereum block explorer - contract address)
