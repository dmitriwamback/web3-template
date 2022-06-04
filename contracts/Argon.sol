// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Argon {
    string public name = "Argon";

    function greet() public pure returns (string memory) {
        return "Hello world";
    }
}