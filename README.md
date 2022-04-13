# Random ball picker

GUI:
Each row has:
+ a color (background?)
+ a name (Kirigami.Label's text)
+ a Spinner (non-negative numbers, comes with +/- buttons)
+ Spillover menu
	+ Edit
	+ Delete

Top-level actions:
+ Add new row
+ Start over
+ Draw
	+ Spawns modal to ask how many
		+ Remember value from last time, in Spinner
		+ Or embed in Draw button
	+ Kills that modal and spawns another with result
		+ Actions: `Replace` and `Remove`
