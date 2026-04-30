//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract MoodNftTest is Test {
    MoodNft public moodNft;

    string public constant SAD_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDI1NiAyNTYiPjxyZWN0IHdpZHRoPSIyNTYiIGhlaWdodD0iMjU2IiBmaWxsPSIjRkYwMDAwIiByeD0iNCIgcnk9IjQiLz48Y2lyY2xlIGN4PSI4MCIgY3k9Ijg1IiByPSIyMCIgZmlsbD0iI0ZGRiIvPjxyZWN0IHg9IjE1MCIgeT0iODAiIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgZmlsbD0iI0ZGRiIvPjxyZWN0IHg9IjkwIiB5PSIxNDAiIHdpZHRoPSI4MCIgaGVpZ2h0PSIyMCIgZmlsbD0iI0ZGRiIvPjxyZWN0IHg9IjkwIiB5PSIxNDAiIHdpZHRoPSI4MCIgaGVpZ2h0PSIyMCIgZmlsbD0iI0ZGRiIvPjxyZWN0IHg9IjkwIiB5PSIxNDAiIHdpZHRoPSI4MCIgaGVpZ2h0PSIyMCIgZmlsbD0iI0ZGRiIvPjwvc3ZnPg==";
    string public constant HAPPY_SVG_IMAGE_URI =
        "data:image/svg+xml;base64,PHN2ZwogIHZpZXdCb3g9IjAgMCAyMDAgMjAwIgogIHdpZHRoPSI0MDAiCiAgaGVpZ2h0PSI0MDAiCiAgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIgo+CiAgPGNpcmNsZQogICAgY3g9IjEwMCIKICAgIGN5PSIxMDAiCiAgICBmaWxsPSJ5ZWxsb3ciCiAgICByPSI3OCIKICAgIHN0cm9rZT0iYmxhY2siCiAgICBzdHJva2Utd2lkdGg9IjMiCiAgLz4KICA8ZyBjbGFzcz0iZXllcyI+CiAgICA8Y2lyY2xlIGN4PSI2MSIgY3k9IjgyIiByPSIxMiIgLz4KICAgIDxjaXJjbGUgY3g9IjEyNyIgY3k9IjgyIiByPSIxMiIgLz4KICA8L2c+CiAgPHBhdGgKICAgIGQ9Im0xMzYuODEgMTE2LjUzYy42OSAyNi4xNy02NC4xMSA0Mi04MS41Mi0uNzMiCiAgICBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6IGJsYWNrOyBzdHJva2Utd2lkdGg6IDM7IgogIC8+Cjwvc3ZnPg==";

    address USER = makeAddr("user");

    function setUp() public {
        moodNft = new MoodNft(SAD_SVG_IMAGE_URI, HAPPY_SVG_IMAGE_URI);
    }

    function testViewTokenURI() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }
}
