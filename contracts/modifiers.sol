pragma solidity >=0.4.25;


contract Modifiers {
    uint256 public minimumOffer = 100;

    modifier minimumAmount() {
        if (msg.value >= minimumOffer) {
            _;
        } else {
            /** Throw an exception */
            revert("Invalid!");
        }
    }

    function bid() public payable minimumAmount returns (bool) {
        // Code the adding a new bid
        return true;
    }

    //  what i can do for modifiers is ...
    // passing arguments 
    // chaining /
    // using for access control.
    
}
