# Assembling a FOCK

This manual outlines the best practice way I found to assemble a FOCK, both for future me and to inspire anyone else in similar situations.

In general, this guide will place the most complex components (most importantly the USB-C port) first to ensure that they are easily accesible when soldering and resoldering.

## Preparations

Grab two PCBs. Lay them out as you would layout the final keyboard. Ensure you do NOT have two left side alignments or similar. If you use the original silkscreen, you should see two hawks facing each other.

Stick some painters' tape on each and write `TOP` or something similar on it. This is to prevent you from soldering parts on the wrong side.

Following sections will be marked with `TOP` or `BOTTOM` side to indicate on which side I intended components to be placed.

## SMD components

### USB-C port and pullups (optional)

`TOP SIDE`

If you need a USB-C port to connect the keyboard halves, best place it first.
Should you use nice!nanos or similar with ZMK, the halves will communicate via bluetooth, so you can just skip to the next section. 

1. Solder one outer leg
2. Ensure the connector pins are properly aligned
3. Solder the opposite outer leg.
4. Double check pin alignment
5. Solder all other connections
6. Verify connectivity with a beep tester

Go watch some youtube videos on placing many legged SMD components if necessary. 
I had good results with a big soldering iron tip, lots of flux, and a cut-up USB-C cable to test if my connections were solid.

If you are happy with the USB-C connector, place and solder in the pullups.
**They are only necessary on one side of the keyboard**

### Mill-Max sockets

`TOP SIDE`

I highly recommend socketing your microcontroller.

Solder the outermost legs first, then progress inwards. If you switch from one end to the other between each pin, you avoid overheating the plastic.

### Connecting the Microcontroller

(It is highy recommended to do this step **after** the mill-max sockets to avoid accidentally blocking any vias for the sockets. Not that anyone, especially me, would be that clumsy...

The footprint enables any pro-micro like microcontroller in any orientation on the board.
Depending on your configuration, connect the correct solder jumpers by touching the soldering iron to both sides and adding solder until they connect.

| Controller orientation | Solder jumpers to connect | Notes |
| --- | --- | --- |
| SMD components visible | `TOP SIDE` | less clean, but 3.7V Li-battery fits below controller on `TOP SIDE` |
| SMD components towards PCB | `BOTTOM SIDE` | cleaner, battery goes on `BOTTOM` |

### Reset buttons

`TOP SIDE`

The reset buttons are simple. Start with any leg and push it in place,
Then fix the opposite leg before proceeding with the rest.

### Components for wireless operation (optional)

The components in this section are only necessary when operating from battery power.
They can be added later if you are still waiting on batteries.
Just remove some thumb keys from their sockets for easier access.

#### Power switch

`TOP SIDE` 

Just like the reset button.

#### JST connector

`BOTTOM SIDE`

I put the battery on the bottom side, but if you flip your nice!nanos, you could also place batteries on the top side. Adjust the position accordingly.

#### Battery assembly 

1. Use a multimeter to verify the cable colors match polarity on the battery. You do not want to mess up this and fry your controller.
2. Crimp on the JST connector. Crimp tutorials for microfit connectors help. A self-closing soldering tweezer can be used to grab the lead at the right distance to ensure it is not pushed to far in the crimping tool. 
3. Put crimps into connector.
I suggest prepping all batteries exactly the same way, an adjusting connections on the PCB so you can exchange batteries without thinking about it.
Conventions seems to be the following:
Plastic clip facing you, leads coming in from the bottom. Positive red wire goes to the right.
4. Hold finished connector next to PCB. Check which side is positive.
Connect the correct solder jumpers on the `TOP SIDE` (or where your power switch is).
For `+` on the red side and `-` on the black side. 
You should never connect two solder jumpers on a single side.
5. Test connectivity from the JST contacts to `RAW` and `GND`. You might need to flip the power switch for `RAW`

This should be all components for battery-powered operation.

### Diodes

`BOTTOM SIDE`

Choose between SMD and THT diodes.
If you go for THT, invest in a good flush cutter.
Pre-cutting the leads to be short enough not to extend to far and hinder plugging in switches is annoying. 
Don't ask me how I know.

### Switch sockets

`BOTTOM SIDE`

Make sure to place them correctly.
Use enough solder as they need a lot.

### Nice!Nanos

`TOP SIDE`

Place the N!N in the correct orientation to fit your connected solder jumpers.
The top two N!N pin holes are for battery connection and should not be connected.

Some people like to put painters' or electrical tape over the sockets before soldering them, to prevent spillover and fusing the controller to the socket. 
I never had this problem, so I don't do it, but if you feel cautious, you might want to invest in this low-cost countermeasure.

Stick the connection pins (or cut offs from THT components) in each mill-max socket.
Ensure each connection pin is really properly seated.
Solder them all in place.

### Switches

`TOP SIDE`

Just push in the switches. 
I recommend lighter switches thumb and pinky, but that's personal preference.

### Keycaps

`TOP SIDE`

Just go nuts with these.

## Testing

Now is the time to flash your microcontrollers and test all keys.
Check the readme for valid ZMK/QMK configs.
On linux, I recommend `xev` for this, as it easily show pressed keys.
If a key does not work, check the Debugging section and fix it now.

### Plug in battery (optional)

I would do this step only after verifying everything else works on cable power.

Double check polarity and connectivity from the battery plug to the controller. 

Ensure the battery is insulated and will not short anything.
Secure it on the board - below the microcontroller or on the opposite side of the PCB with double sided tapes are my favorites.

Then plug the battery in.

Turn on both keyboard halves and enjoy.

## Case/Tenting/Rubber feet (optional)

Add whatever external parts you have to make the keyboard more comfortable and comfortable.
To attach cases, 7 extra mounting holes are present in the PCB:

* next to the reset button
* in the num rom between index and middle finger columns
* in the num rom between ring and pinky finger columns
* between thumb cluster and pinky cluster
* between the 4 top keys of the index cluster
* between the 4 top keys of the pinky cluster
* between the 4 bottom keys of the pinky cluster

The rubber feet are only optional if you have a way better solutions, otherwise they are essetinal. I recommend sticking them on the plastic part of switch sockets.


## Send me a picture.

This step is optional, but if you got this far, I would really get a kick out of it if you send me a pic of your creation.

## Removing microcontrollers

If you used tape below the microcontroller or want to place a battery below, you can use tweezers or similar tools to carefully lever the controller out of the socket again. 
Just be careful not to knock of SMD components or bend any pins. 
If you do, grab a tweezer and bend them back.

You can then remove the tape or place a battery.

Take care not to bend more legs when socketing the controller again.

## Debugging / Troubleshooting

### Key does not work
If a key does not work, check if the entire row or column is affected.
If so, check row or column connections accordingly.

If it is just the key, check the diode direction.

Check you soldered the socket correctly.

Pull the key and check if you accidently missed the socket and one leg was bent.
If it is, grab a tweezer and gently straighten it out before putting it back in.

### Multiple key activations on single key
Should you get double or triple key presses in later operation, check for bad connections on the sockets first.

### Mod tab behaviour activates tap behaviour before hold
Check socket for bad connections.
If that does not help, try replacing the switch.

### One row and column does not work an the rest are shifted
Did you leave the bottom two pins of the N!N disconnected rather than the top two?

### My problem isn't listed
I just listed everything I encountered so far. Feel free to write an issue for anything else.




