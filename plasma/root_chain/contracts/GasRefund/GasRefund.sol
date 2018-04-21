pragma solidity 0.4.18;

contract GasRefund {

    /*
     *  Storage
     */
    mapping(uint256 => uint256) gasStorage;
    uint256 totalGasStored;


    function storeGas(uint256 slotsToStore)
        public
    {
        for(uint256 i = totalGasStored; i < slotsToStore; i++) {
            gasStorage[i] = i;
        }
        totalGasStored += slotsToStore;
    }

    function refundGas(uint256 slotsToRefund)
        public
        returns(uint256)
    {
        for(uint256 i = totalGasStored; i > slotsToRefund; i--) {
            delete gasStorage[i];
        }
        totalGasStored -= slotsToRefund;
        gasStorage[1] = 1;
        return totalGasStored;
    }
}