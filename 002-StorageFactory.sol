// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newsimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newsimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}

// ABOUT THE CONTRACT
// This contract imports the SimpleStorage contract and allows anyone to deploy SimpleStorage contracts.
// All contracts created are indexed into a list. Calling listOfSimpleStorageContracts function shows the address for each contract.
// The contract also allows to assign a number to each indexed contract with the function sfStore.
// Then the sfGet function returns the assigned number when you call it by introducing a contract's indexed number.
// Imported contracts have to be in the same folder of the importer contract, and can be specified with "{} from ./".

// GENERAL VIEW
// The contracts interact "seamlessly" (as we say in the course) with each other and with wallet addresses.
// The ABI from Remix IDE is fast and simple, and it also has an AI chatbot.
// The contracts are easy to structure: License + Version > Imports, (if any) > Declaration (State variables > Functions).
