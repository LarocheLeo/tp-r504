import pytest
import fonctions as f

def test_1 () :
	assert f.puissance(2,3)==8
	assert f.puissance(2,2)==4
	
def test_2 () :
	assert f.puissance(-2,3)==-8
	assert f.puissance(2,-2)==0.25
	
def test_3():
    with pytest.raises(ZeroDivisionError):
        f.puissance(0,-2)
        f.puissance(0,-5)
        f.puissance(0,-9)

