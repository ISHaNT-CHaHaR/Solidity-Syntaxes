pragma solidity >=0.4.24;


contract ERC20Interface {
    string public constant name = "Udacity Token";
    string public constant symbol = "UDC";
    uint8 public constant decimals = 18; // 18 is the most common number of decimal places

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint256 tokens
    );

    function totalSupply() public view returns (uint256);

    function balanceOf(address tokenOwner)
        public
        view
        returns (uint256 balance);

    function transfer(address to, uint256 tokens) public returns (bool success);

    function transferFrom(address from, address to, uint256 tokens)
        public
        returns (bool success);

    function approve(address spender, uint256 tokens)
        public
        returns (bool success);

    function allowance(address tokenOwner, address spender)
        public
        pure
        returns (uint256 remaining);
}
