pragma solidity >=0.6.0;


//  libraries are uselful whenever we want ot reuse some code
// in order to avoid code duplication.
library My {
    struct player {
        uint256 score;

        //library become more powerful when
    }

    function inc(player storage _player, uint256 points) public {
        _player.score += points;
    }
}


contract libraries {
    // function yeah() external {
    //     uint256 result = My.add10(10);
    // }
    using My for My.player;
    mapping(uint256 => My.player) players;

    function yeah() external {
        // My.inc(players[0], 10);
        players[0].inc(10);
    }
}
