pragma solidity >=0.5.11;


interface InterfaceB {
    function Iamgonnacalled() external pure returns (string memory);
}


contract B {
    function Iamgonnacalled() external pure returns (string memory) {
        return "I am called. SHIT!";
    }
}
