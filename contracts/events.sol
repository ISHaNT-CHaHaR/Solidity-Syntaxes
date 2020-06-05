pragma solidity >=0.4.24;


contract EvenContract {
    uint256 biddingends = now + 5 days;

    struct HighBidder {
        address bidder;
        string BiiderName;
        uint256 bid;
    }

    HighBidder public highBidder;

    event NewHighBid(address indexed who, string name, uint256 Howmuch);

    event BidFailed(address indexed who, string name, uint256 Howmuch);

    modifier timed {
        if (biddingends < now) {
            _;
        } else {
            revert("Throw an exception");
        }
    }

    constructor() public {
        highBidder.bid = 1 ether;
    }

    function bid(string memory bidName) public payable timed {
        if (msg.value > highBidder.bid) {
            highBidder.bidder = msg.sender;
            highBidder.BiiderName = bidName;
            highBidder.bid = msg.value;
            emit NewHighBid(msg.sender, bidName, msg.value);
        } else {
            emit BidFailed(msg.sender, bidName, msg.value);
            revert("Throw and exception");
        }
    }

    event NewTrade(
        uint256 indexed date,
        address indexed from,
        address indexed to,
        uint256 amount
    );

    //  when outside user is listening to events, they should listen to specific events only
    // so they need to filter from address and INDEXED is used
    // Using indexed and can increase cost so max use 3 indexes

    // to access an event we need to use emit keyword in function
    function trade(address to, uint256 amount) external {
        emit NewTrade(now, msg.sender, to, amount); // events  cannot be read from smart contract
    }
    // gas cost of events is less than storage variables.
}
