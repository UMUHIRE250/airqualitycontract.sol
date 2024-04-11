// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./airqualitycontract.sol";

contract AirQualityContractFactory {
    address[] public deployedContracts;

    function createAirQualityContract(
        uint256 _pm25Threshold,
        uint256 _pm10Threshold,
        uint256 _o3Threshold,
        uint256 _so2Threshold,
        uint256 _no2Threshold,
        uint256 _co2Threshold,
        uint256 _fineAmount
    ) public {
        address newContract = address(new AirQualityContract(
            _pm25Threshold,
            _pm10Threshold,
            _o3Threshold,
            _so2Threshold,
            _no2Threshold,
            _co2Threshold,
            _fineAmount
        ));
        deployedContracts.push(newContract);
    }

    function getDeployedContracts() public view returns (address[] memory) {
        return deployedContracts;
    }
}
