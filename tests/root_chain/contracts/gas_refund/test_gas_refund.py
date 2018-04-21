import pytest

@pytest.fixture
def gas_refund(t, get_contract):
    contract = get_contract('GasRefund')
    t.chain.mine()
    return contract

def test_gas_refund(t, gas_refund):
    gas_refund.storeGas(3)
    d1 = t.chain.last_gas_used()
    yo = gas_refund.refundGas(3)
    d2 = t.chain.last_gas_used()
    import pdb; pdb.set_trace() 