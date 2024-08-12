// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9; // Remove for security purposes before final commit

contract Dappazon {
    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
                    Are written to the blockchain itself.              
    //////////////////////////////////////////////////////////////*/
    string public name; // Used to test setup, can delete afterwards
    address public owner;

    // The constructor function is called only once when the smart contract is deployed to the blockchain and is charged a gas fee
    constructor() {
        name = "Dappazon"; // Used to test setup, can delete afterwards

        // Owner of smart contract who receives the funds
        owner = msg.sender; // msg.sender is the person deploying the smart contract
    }

    /*//////////////////////////////////////////////////////////////
                             LIST PRODUCTS
  //////////////////////////////////////////////////////////////*/
    function list(
        uint256 _id, // Unique identifier [number]
        string memory _name, // Name of product
        string memory _category, // Product category
        string memory _image, // Product image
        uint256 _cost, // Product cost
        uint256 _rating, // Customer ratings
        uint256 _stock // # of units in stock
    ) public {}

    /*//////////////////////////////////////////////////////////////
                             BUY PRODUCTS
  //////////////////////////////////////////////////////////////*/

    /*//////////////////////////////////////////////////////////////
                             WITHDRAW FUNDS
  //////////////////////////////////////////////////////////////*/
}
