import pytest
import fonctions_entier_flottant as f 

def test_1(): #test pour voir si tout fonctionne bien normalement 
	assert f.puissance2(2,3) == 8 
	assert f.puissance2(2,2) == 4

def test_2(): #test avec des valeurs négatifs 
	assert f.puissance2(-1,2) == 1 
	assert f.puissance2(-1,3) == -1
	assert f.puissance2(-1,-1) == -1 
	assert f.puissance2(-1,-2) == 1
	assert f.puissance2(-2,-1) == -0.5

def test_3(): #test pour les cas limite si x>0
	assert f.puissance2(0,1.1) == 0
	assert f.puissance2(0,1) == 0
	assert f.puissance2(0,10) == 0
	assert f.puissance2(0,100) == 0


def test_4(): #test pour les cas limite si x<0
    with pytest.raises(ZeroDivisionError):
        assert f.puissance2(0,-1.1) == 0
        assert f.puissance2(0,-1)
        assert f.puissance2(0,-10)
        assert f.puissance2(0,-100)

def test_exec_1():  #test rajouter pour completer le 6
	with pytest.raises(Exception):
		f.puissance2(0,-1)
