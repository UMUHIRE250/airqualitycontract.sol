// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AirQualityContract {
    address public owner;
    
    uint256 public pm25Threshold;
    uint256 public pm10Threshold;
    uint256 public o3Threshold;
    uint256 public so2Threshold;
    uint256 public no2Threshold;
    uint256 public co2Threshold;
    
    uint256 public fineAmount;

    constructor(
        uint256 _pm25Threshold,
        uint256 _pm10Threshold,
        uint256 _o3Threshold,
        uint256 _so2Threshold,
        uint256 _no2Threshold,
        uint256 _co2Threshold,
        uint256 _fineAmount
    ) {
        owner = msg.sender;
        pm25Threshold = _pm25Threshold;
        pm10Threshold = _pm10Threshold;
        o3Threshold = _o3Threshold;
        so2Threshold = _so2Threshold;
        no2Threshold = _no2Threshold;
        co2Threshold = _co2Threshold;
        fineAmount = _fineAmount;
    }

    function checkAirQuality(
        uint256 pm25,
        uint256 pm10,
        uint256 o3,
        uint256 so2,
        uint256 no2,
        uint256 co2
    ) public view returns (bool) {
        if (
            pm25 > pm25Threshold ||
            pm10 > pm10Threshold ||
            o3 > o3Threshold ||
            so2 > so2Threshold ||
            no2 > no2Threshold ||
            co2 > co2Threshold
        ) {
            return false;
        }
        return true;
    }
    
    function issueFine(address offender) public {
        require(msg.sender == owner, "Only the contract owner can issue fines");
        // Send the fine amount to the offender
        payable(offender).transfer(fineAmount);
    }
}
