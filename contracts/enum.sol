pragma solidity >=0.4.24;


contract ExampleEnum {
    enum names {GIGI, Ishant, Maybe, Selena}

    function getEnum(uint8 arg) public pure returns (string memory) {
        if (arg == uint8(names.GIGI)) return "GIGI";
        if (arg == uint8(names.Ishant)) return "Ishant";

        if (arg == uint8(names.Maybe)) return "Maybe";
        if (arg == uint8(names.Selena)) return "Selena";
    }

    // enum are used to show different colours and options
    //it can be a state.
    enum STATE {INACTIVE, ACTIVE, CANCELLED, PROGRESS}
    STATE state;

    //// OR I CAN USE ENUM WITH A STRUCT
        struct User{
            STATE state;
        }



    function setToActive() external {
        state = STATE.ACTIVE;
    }

    function foo() external view {
        if (state == STATE.ACTIVE) {
            // do anything i want
        }
    }

    // or I can use enum asd an argument

    function bat(STATE _state) external view {
        // I can just pass integer it will automatically will be converted into enum
    }
}
