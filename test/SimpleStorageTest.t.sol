// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { DeploySimpleStorage } from "../script/DeploySimpleStorage.s.sol";
import { SimpleStorage } from "../src/SimpleStorage.sol";
import { Test } from "forge-std/Test.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() external {
        DeploySimpleStorage deployer = new DeploySimpleStorage();
        simpleStorage = deployer.run();
    }

    function testStoreNumber() public {
        // Arrange
        uint256 expectedFavouriteNumber = 69;
        // Act
        simpleStorage.store(expectedFavouriteNumber);
        // Assert
        assert(expectedFavouriteNumber == simpleStorage.retrieve());
    }

    function testCreatePerson() public {
        // Arrange
        string memory name = "Anagha";
        uint256 expectedNumber = 69;
        // Act
        simpleStorage.addPerson(name, expectedNumber);
        // Assert
        uint256 retrievedNumber = simpleStorage.nameToFavoriteNumber(name);
        assert(retrievedNumber == expectedNumber);
    }
}
