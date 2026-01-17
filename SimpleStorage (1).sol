// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract SimpleStorage {

    uint256 public myfavoriteNumber;

    uint256[] listOfFavoriteNumbers;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }
    
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myfavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name) );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// ABOUT THE CONTRACT
// This contract has 2 transactional functions (addPerson, store) and 4 call functions (retrieve, myfavoriteNumber, listOfPeople, nameToFavoriteNumber).
// This contract allows the deployer to add persons with a number assigned to each. 
// You can search for a number and a person when calling listOfPeople and nameToFavoriteNumber.
// This is possible mainly thanks to the mapping and array variables.
// The contract also allows to store a specific number. The latest number shows up in myFavoriteNumber and retrieve when you call those functions.

// GENERAL VIEW
// This is my first ever smart contract in any language. It was written in Remix IDE and deployed in two different testnets (Sepolia mainnet and Sepolia zkSync).
// Before that, I created a MetaMask wallet, got Sepolia ETH from a faucet and bridged half of it into the zkSync network.
// Everything was easy and very familiar to me as I have some XP in the crypto space. However, the coding part was quite complex and almost new to me.
// The most exciting part to me was deploying the contract on chain and triggering the different functions and variables.

// 0x22d90b4f061fCcFa4043323544F1F9ec79Cf1454 (Ethereum metamask address)
// 0x65C7677C91A07e6aD21dC3e732A5FB7e72ef80C8 (sepolia zksync block explorer - contract address)
// 0x22d90b4f061fCcFa4043323544F1F9ec79Cf1454 (sepolia ethereum block explorer - contract address)

