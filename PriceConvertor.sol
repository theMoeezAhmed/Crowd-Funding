// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor{
    function getprice() internal  view returns(uint256){
   AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price,,,) = pricefeed.latestRoundData();
    return  uint256(price * 1e10);
}
function getconversionrate(uint256 ethAmount) internal  view returns(uint256){
    uint256 ethPrice = getprice();
    uint256 ethAmountinUsd = (ethPrice * ethAmount) / 1e18 ;
    return ethAmountinUsd;
}

    function getVersion() internal  view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
