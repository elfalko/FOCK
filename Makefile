.PHONY: all

all:
	node ../ergogen/src/cli.js ../fock/fock.yaml -o ../fock/output
route:
	#pkill kicad 
	kicad fock/fock.kicad_pro
zip:
	zip -r output/pcbs/gerber output/pcbs/gerber
