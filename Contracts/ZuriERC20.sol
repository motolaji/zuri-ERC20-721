// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract ZuriToken is ERC20 {
    

    address public admin;
    uint _totalSupply = 1000000e18;
    constructor() ERC20('ZuriCoin', 'ZUT') {
        _mint(msg.sender, _totalSupply) ; 
        admin = msg.sender;

    }

    function mint(address to, uint amount) external {
        require (msg.sender == admin, 'Not admin');
        _mint(to, amount); 
    } 

    function burn(uint amount) external{
        _burn(msg.sender, amount); 
    } 
    
    

    function buyToken(address receiver) public payable {
        uint256 amount = msg.value;

        uint256 tokenAmount = amount * 1000;
        _mint(receiver, tokenAmount);


    }
}