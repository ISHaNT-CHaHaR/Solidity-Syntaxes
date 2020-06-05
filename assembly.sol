pragma solidity >=0.6.0;


contract assemble {
    // Ok, assembly manipulates directly memory. so use it when u have no choice at all
    //

    // always write assembly inside a function and wrap in an assembly block;

    function yeah() external {
        uint256 c;

        assembly {
            c := add(1, 2)
        }
    }
}
