// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint256 uniqueUsersCount;
    mapping(address => uint256) wavesPerUser;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Wave[] waves;

    constructor() {
        console.log("Its's small step for Kajan, but a big step for Solidity!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);

        if (wavesPerUser[msg.sender] > 0) {
            wavesPerUser[msg.sender] = wavesPerUser[msg.sender] + 1;
        } else {
            uniqueUsersCount += 1;
            wavesPerUser[msg.sender] = 1;
        }

        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log(
            "We have %d total waves by %d unique users!",
            totalWaves,
            uniqueUsersCount
        );
        return totalWaves;
    }
}
