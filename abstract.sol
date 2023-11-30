// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Abstract contract
abstract contract MyAbstractContract {
    uint256 public abstractValue;

    function abstractFunction(uint256 x) external virtual returns (uint256);
}

// Interface
interface MyInterface {
    function interfaceFunction(uint256 y) external view returns (string memory);
}

// Contract that implements both the abstract contract and the interface
contract MyContract is MyAbstractContract, MyInterface {
    uint256 public override abstractValue;

    function abstractFunction(uint256 x) external override returns (uint256) {
        // Implementation of the abstract function
        abstractValue = x * 2;
        return abstractValue;
    }

    function interfaceFunction(uint256 y) external view override returns (string memory) {
        // Implementation of the interface function
        return string(abi.encodePacked("Value from interfaceFunction: ", uint2str(y)));
    }

    // Helper function to convert uint to string
    function uint2str(uint256 num) internal pure returns (string memory) {
        if (num == 0) {
            return "0";
        }
        uint256 j = num;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;
        while (num != 0) {
            bstr[k--] = bytes1(uint8(48 + num % 10));
            num /= 10;
        }
        return string(bstr);
    }
}
