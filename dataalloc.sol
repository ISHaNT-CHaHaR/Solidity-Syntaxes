pragma solidity >=0.6.0;


contract data {
    // 1. storage
    // Means I am storing value in a blockchain and later i can find this value. It is persistant
    uint256 a; // it will have a memory location storage.
    // we use storage when we want to store pointer to deeply nested data.
    struct User {
        string name;
    }
    User[] users;

    function point() external {
        users[0].name;
        User storage user = users[0]; // a pointer to user[0]

        user.name = "whatever I want!  pikapoobutt";
    }

    //2. memory.
    // it is not stored inside blockchain and is temoporary. DUH!
    // if i want to copy of user the i will use memzory
    function foo() external {
        users[0].name;
        User memory user = users[0]; // a pointer to user[0]

        user.name = "whatever I want!  pikapoobutt";
        bar(user);
    }

    // passing memory to another function

    function bar(User memory user) internal {}

    //3. callData
    // only avaible for external or public function
    function fab(uint256[] calldata _users) external {
        // complex data is transaction have callDATA location
    }

    //4.stack

    // stack is every simple variablke that is declared inside a fucntion
    function foob() external view {
        uint256 b; // it is a stack variable
        b = a;
    }
}
