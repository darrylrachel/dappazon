// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9; // Remove for security purposes before final commit

contract Dappazon {
    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
                    Are written to the blockchain itself.              
    //////////////////////////////////////////////////////////////*/

    // Used to test setup, can delete afterwards
    // string public name;

    address public owner;

    // Structs lets you create your own custom data types
    // This struct "defines" what the struct will look like, it does not create one.
    // The one below creates the struct
    struct Item {
        uint256 id;
        string name;
        string category;
        string image;
        uint256 cost;
        uint256 rating;
        uint256 stock;
    }

    /*//////////////////////////////////////////////////////////////
                                MAPPINGS

    Let's us treat the blockchain like a database
    mappings are key-value pairs
    This mapping create a new mapping with the key data type uint256 and the Item struc as it's value
    This allows for saving this Item to the blockchain using this mapping with a unique id(key)
    It is saved to a public state variable called items so it can be accessed such as displaying the product on a website
    //////////////////////////////////////////////////////////////*/
    mapping(uint256 => Item) public items;

    /*//////////////////////////////////////////////////////////////
                                 EVENTS

    Benefits of events
      1. Anytime function is called someone can subscribe and get notified ex. push notification
      2. You can see every time the function was called on the blockchain by fetching the event stream
    //////////////////////////////////////////////////////////////*/
    event List(string name, uint256 cost, uint256 quantity);

    /*//////////////////////////////////////////////////////////////
                              CONSTRUCTOR

    The constructor function is called only once when the smart contract is deployed to the blockchain 
    and is charged a gas fee
    //////////////////////////////////////////////////////////////*/
    constructor() {
        // Used to test setup, can delete afterwards
        // name = "Dappazon";

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
    ) public {
        // Restrict listing to only the owner of the contract / marketplace
        // Has to evaluate to true or false
        require();

        // Create Item struct, "item" creates a new variable called item
        Item memory item = Item(
            _id,
            _name,
            _category,
            _image,
            _cost,
            _rating,
            _stock
        );

        // Save Item struct to blockchain using mapping
        // items is accessed from the mapping above and is grapping the _id, it is then saving it to the item variable from creating the Item struct
        items[_id] = item;

        // Emitting an event
        // Benefits
        // 1. Anytime function is called someone can subscribe and get notified ex. push notification
        // 2. You can see every time the function was called on the blockchain by fetching the event stream
        emit List(_name, _cost, _stock);
    }

    /*//////////////////////////////////////////////////////////////
                             BUY PRODUCTS
  //////////////////////////////////////////////////////////////*/

    /*//////////////////////////////////////////////////////////////
                             WITHDRAW FUNDS
  //////////////////////////////////////////////////////////////*/
}
