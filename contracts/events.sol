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
}
