# FOCK - Falk's Overstaggered Corne Keyboard


|![Layout](img/layout-v2.png)|![V1 with keys](img/v1wswitches.jpg)|
|---|---|
|ergogen key matrix preview|V1 with keys|

## Status

| Version | Status |
| --- | --- |
| V2 | ready for production |
| V1 | failed due to layout "improvements" with traces on the wrong PCB side |

## Why

[CRKBD](https://github.com/foostan/crkbd) is nice, but could use more stagger, a num row and USB-C

## Features

* fully reversible PCB
* 56 keys
* puchi-c driven, pro-micro compatible
* usb c cable for connection between halves
* battery support for future bluetooth action

Explicitly not planned:

* LEDs (over/under/any glow)
* return to TRRS
* Rotary encoders

## Repo overview

* Readme - this readme
* fock.yaml - generator file for [ergogen](https://github.com/ergogen/ergogen) (requires [my fork](https://github.com/elfalko/ergogen) though, since several footprints have been heavily updated)
* img/ - images for documentation

## TODO or future plans

* [ ] QMK support
* [ ] ZMK support
* [ ] optional num row
* [ ] mouse bites to break off excessive parts
* [ ] good case
* [ ] ZMK config
* [ ] trackball support
* [ ] trackpad support
