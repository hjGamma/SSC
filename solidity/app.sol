// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./age_zkp.sol"; // 确保正确路径

contract Verify {
    Groth16Verifier public verifier;

    constructor(address AgezkpAddress) {
        verifier = Groth16Verifier(AgezkpAddress);
    }
    function Ageverify(
        uint[2] calldata _pA, 
        uint[2][2] calldata _pB, 
        uint[2] calldata _pC, 
        uint[2] calldata _pubSignals
    ) external view returns (bool isValid) {
        isValid = verifier.verifyProof(_pA, _pB, _pC, _pubSignals);
        return isValid;
    }
}
