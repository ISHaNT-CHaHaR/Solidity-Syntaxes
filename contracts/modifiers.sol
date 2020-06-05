pragma solidity >=0.4.25;


contract Modifiers {
    uint256 public minimumOffer = 100;

    modifier minimumAmount(uint256 a) {
        if (msg.value >= minimumOffer && a == 10) {
            _;
        } else {
            /** Throw an exception */
            revert("Invalid!");
        }
    }

    function bid(uint256 a) public payable minimumAmount(a) returns (bool) {
        // Code the adding a new bid
        return true;
    }

    //  what i can do for modifiers is ...
    // passing arguments
    // chaining /
    // using for access control.
}
