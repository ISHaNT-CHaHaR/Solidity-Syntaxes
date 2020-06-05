pragma solidity >=0.6.0;

import "./ANOHERONE.sol";


contract A {
    // call function of other contract.

    // interface and address of B must be needed.
    address addressB;

    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }

    function CallfromB() external view returns (string memory) {
        //        B b = B(addressB); // created a pointer. an interface
        InterfaceB b = InterfaceB(addressB); // Interface

        return b.Iamgonnacalled();
    }

    // import keyword

    // contract interface

    // error propogation.
}
