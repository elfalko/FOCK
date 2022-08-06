.PHONY: all

all:
	node ../ergogen/src/cli.js ../fock/fock.yaml -o ../fock/output
route:
	#pkill kicad 
	kicad fock/fock.kicad_pro
