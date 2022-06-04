// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Argon {
    string public name = "Argon";
    uint256 public counter = 0;

    function greet() public pure returns (string memory) {
        return "HELLO";
    }

    function increment() public returns (uint256) {
        counter = counter + 1;
        return counter;
    }
}