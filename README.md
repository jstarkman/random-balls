# Random ball picker

This project is an excuse to explore Qt.
It implements the classic "draw colored balls from an urn" probability problem.
It compiles and runs correctly on my Ubuntu 20.04 laptop (KDE Plasma).


## GUI design
Each row represents one class of balls in the urn and has a:
+ Color
+ Name
+ SpinnerBox (non-negative numbers, comes with +/- buttons)
+ Delete button

The top-level interactions are:
+ Action: `Add new row`
	+ Spawns a modal to pick the color and name
+ Button: `Draw` (with a SpinnerBox)
	+ Spawns a modal with the balls that were drawn from the urn
	+ Actions on that modal: `Replace` and `Remove`
+ Not yet implemented: "Delete all" Kirigami.Action


## Known issues
+ Android builds do not run correctly
+ The "Draw" button is misaligned
+ Nothing is persisted between runs
	+ Is this a bug or a feature?
+ Should try using QtCreator to see if that helps


## Android
Documentation is sparse and tends to assume knowledge of Qt and cmake.
Tried adapting from here:
https://github.com/fairdirect/foodrescue-app
