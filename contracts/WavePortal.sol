// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint256 uniqueUsersCount;
    mapping(address => uint256) wavesPerUser;

    constructor() {
        console.log("Its's small step for Kajan, but a big step for Solidity!");
    }

    function wave() public {
        totalWaves += 1;
        if (wavesPerUser[msg.sender] > 0) {
            wavesPerUser[msg.sender] = wavesPerUser[msg.sender] + 1;
        } else {
            uniqueUsersCount += 1;
            wavesPerUser[msg.sender] = 1;
        }
        console.log("%s has waved!", msg.sender);
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
