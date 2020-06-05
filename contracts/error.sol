pragma solidity >=0.4.24;


contract ExceptionsContract {
    // Public variable lastCaller, with a value of none
    string public lastCaller = "none";

    // Function revertBehavior that takes in a name as an argument,
    //and sets the lastCaller variable to this argument received
    function revertBehavior(string memory name) public returns (bool) {
        lastCaller = name;

        // Check if length of the string is zero
        // If the argument received has zero length, it throws an exception...
        // Once an exception is thrown, the variable lastCaller rolls back to its initial value
        if (bytes(name).length == 0) {
            revert("The length of the string is zero");
        }
        // This is the same thing...just using require to check the length of the input string.
        // The code will only be exceuted if the length is greater than 0
        // The above lines of code may be replaced with this
        require(bytes(name).length > 0, "The length of the string is zero");

        return true;
    }
}


// So, what is going on is that in the function revertBehavior
// lastCaller is being changed to the input argument
// and then an exception is thrown, and the lastCaller reverts back
// to its orginial value, thus nullifying the effect

contract Error {
    //1.  What happen when there is an error.

    //2. throw

    //3. revert()

    //4. require()

    //5. assert()

    //6. error in other contracts.

    uint256 a;

    function any() external view {
        if (a == 10) {
            revert("that idk");
        }
        require(a != 10, "this idk again!");
        // with require u can handle error which occurs in life cycle of smart contracts.
        assert(a != 10);
        // for the error thaT Should never happen like for bebugging.
    }

    function wilThrow() external pure {
        //   revert("idk because i want to");
        // require(1 == 0, "because agaiin i want to.");
        assert(1 == 0);
    }
    function INBContract() external{
        B b = new B();
        //b.bar();/////////////////////////////////
// by this method the state in the smart contract will return as well in other contract also it will revert
// it is all or nothing.
      
      // using a better method..
      address(b).call(abi.encodePacked("bar()"));
      // this will return a boolean to false and if there is an error called it will not reflect back.



    }
}


contract B{
    function Bar() external {
        revert('again REasons..')
    }
}