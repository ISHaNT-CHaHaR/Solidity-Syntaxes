pragma solidity >=0.5.0;


contract Fallbacking {
    // Usecase : receive Ether
    // Usecase : "fallback"

    function() external {
        // only external visibility is allowed.
        //
        // It can only pass be used one time in contract.
        //bytes msg.data;
        // rejecting incoming calls.
        // if (msg.data.length > 0) {
        //     revert("");
        // }
    }
}
contract B{
    function foo() external {
        Fallbacking a =  new Fallbacking();
        InterfaceA(address(a)).doesNotExist();
        address payable a_pay= address(uint160(address(a)));// by doing this i will be able to cast address payable.
        a_pay.transfer(100);
    }
}

contract InterfaceA{
    function doesNotExist() external;
    }
}