//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./KuicToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vendor is Ownable {
    KuicToken kuicToken;
    // token price foe ETH
    uint256 public tokensPerEth = 1000;

    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

    constructor(address tokenAddress) {
        kuicToken = KuicToken(tokenAddress);
    }

    function buyTokens() public payable returns (uint256 tokenAmount) {
        require(msg.value > 0, "Send ETH to buy some tokens");
        uint256 amountToBuy = msg.value * tokensPerEth;
        uint256 vendorBalance = kuicToken.balanceOf(address(this));
        require(
            vendorBalance >= amountToBuy,
            "Vendor contract has not enough tokens in its balance"
        );
        // transfer token to the msg.sender
        (bool sent) = kuicToken.transfer(msg.sender, amountToBuy);
        require(sent, 'Failed to transfer token to user');

        emit BuyTokens(msg.sender, msg.value, amountToBuy);

        return amountToBuy;

    }
        function withdraw() public onlyOwner {
            uint256 ownerBalance = address(this).balance;
            require(ownerBalance > 0, 'Owner has not balance to withdraw');
            (bool sent,) = msg.sender.call{value: address(this).balance}('');
            require(sent, 'Failed to send user balance back to the owner');
        }
}
