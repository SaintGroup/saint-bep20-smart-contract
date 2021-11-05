pragma solidity 0.6.12;

import "./AbsMetaverseNFT";

contract MetaverseNFT is AbsMetaverseNFT {

    constructor(address _nftToken) public payable {
        assert(TOKEN_SLOT == bytes32(uint256(keccak256("eip1967.proxy.implementation")) - 1));
        _setMetaverse(_nftToken);
    }

    event Upgraded(address indexed implementation);

    bytes32 internal constant TOKEN_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    function _implementation() internal view override returns (address impl) {
        bytes32 slot = TOKEN_SLOT;
        assembly {
            impl := sload(slot)
        }
    }

    function __0xf2a3a3b1(address _token) internal {
        _setMetaverse(_token);
        emit Upgraded(_token);
    }

    function _setMetaverse(address _token) internal {
        require(Address.isContract(_token), "Cannot set a proxy implementation to a non-contract address");

        bytes32 slot = TOKEN_SLOT;

        assembly {
            sstore(slot, _token)
        }
    }

}
