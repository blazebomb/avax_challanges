// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract CryptoEvent{
    event mess(address indexed sender, string message,string message1);
    event mess2();

    function crypto() public {

        emit mess(msg.sender, "GM","metacrafters");
        emit mess(msg.sender, "bitcoin","ethereum");

        emit mess2();
    }
}
