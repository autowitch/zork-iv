"Zork IV - version 0.0.1" by "autowitch"

[
Whoa there cowboy!


]

[
This is an experiment to try to create a game

There is going to be some weird code here in order to implement some weird bugs.
]

Volume 1 - Initial setup and rules and such

When play begins:
	Say "At last you have found it. A long lost entrance to the Great Underground Empire!"

Book 2 - Rules

Chapter 1 - Pertaining to the bogus east

[
You can carry around "east" (basically a quick link to the Narrow East/West passage room. If "east" has been dropped in a room, we want to add (in a crude, buggy looking fashion) the "and a narrow passage lies to the east." of the room description. This may lead to a situation where there are two east exits from a room.

Bonus fun can be added if you need to use Bogo_East after a place where you can't carry anything.
]

After printing the locale description (this is the dump locale table rule):
	If Bogo_East is in the location and the location is not Room_1:
		Say " and a narrow passage lies to the east."

[
Of course, if bogo_east is in the location, it should completely mess up the player's ability to use that eastern exit.
]
Before going east when Bogo_East is in the location:
	Say "You cannot go east because east is in the way.";
	Stop the action.

[
We should be able to do things with "east", like putting it in a box or something.
]
[Before putting east in something (called target):
	Try putting Bogo_East in target.]

Chapter 2 - Going SE is a pain

[
We are going to create "southeast" as a thing that has to be in a room in order to go southeast, but NOT carried by the player. Which of course makes it tricky if you go SE and then have to go SE.

As with Bogo_East, puzzles where you find yourself needing to carry southeast through an area where you can't carry anything can be fun.

Tying a rope to this and dragging it a long may be a good, weird solution.
]

Bogo_SouthEast is a thing. The printed name is "southeast".

Before going southeast when Bogo_SouthEast is not in the location:
	[ Going se only works when se is in the room ]
	Say "You can't go that way.";
	Stop the action.
Before going southeast when the player holds Bogo_SouthEast:
	[ Going se only works when the player is NOT carrying se ]
	Say "You can't go that way.";
	Stop the action.


Chapter 3 - Going UP is a pain too

[
We're going to make it look like a rule for climbing out of a pt "accidentally" got applied to everywhere. Of course this will make it annoying to climb ladders, stairs, ramps, etc. And lead to odd description of being not being able to climb walls where there are no walls to climb.
]
Before going up:
	Say "The walls are too smooth for you to climb.";
	Stop the action.

Chapter 4 - Fun with error messages

[ It can't be a properly buggy game without throwing in some error messages ]
Every turn:
	If a random chance of 5 in 100 succeeds:
		Let x be a random number between -2147483648 and 2147483647;
		Say "[italic type][one of]Text buffer overflow[or]Store out of dynamic memory[or]Division by zero[or]Illegal object[or]Illegal attribute[or]No such property[or]Stack overflow[or]Call to illegal address[or]Call to non-routine[or]Stack underflow[or]Illegal opcode[or]Bad stack frame[or]Jump to illegal address[or]Nesting stream #3 too deep[or]Illegal window[or]Illegal window property[or]Print at illegal address[or]@jin called with object [x][or]@get_child called with object [x][or]@get_parent called with object [x][or]@get_sibling called with object [x][or]@get_prop_addr called with object [x][or]@get_prop called with object [x][or]@put_prop called with object [x][or]@clear_attr called with object [x][or]@set_attr called with object [x][or]@test_attr called with object [x][or]@move_object called moving object [x][or]@move_object called moving into object [x][or]@remove_object called with object [x][or]@get_next_prop called with object [x][or]*** Run-time problem P47 (at paragraph 2537 in the source text): Phrase applied to an incompatible kind of value.[or]@Attempt to address illegal object [x]. This is normally fatal.[purely at random][roman type]".

Volume 2 - The Map

[ Errors

   "Text buffer overflow",
    "Store out of dynamic memory",
    "Division by zero",
    "Illegal object",
    "Illegal attribute",
    "No such property",
    "Stack overflow",
    "Call to illegal address",
    "Call to non-routine",
    "Stack underflow",
    "Illegal opcode",
    "Bad stack frame",
    "Jump to illegal address",
    "Can't save while in interrupt",
    "Nesting stream #3 too deep",
    "Illegal window",
    "Illegal window property",
    "Print at illegal address",
    "@jin called with object 0",
    "@get_child called with object 0",
    "@get_parent called with object 0",
    "@get_sibling called with object 0",
    "@get_prop_addr called with object 0",
    "@get_prop called with object 0",
    "@put_prop called with object 0",
    "@clear_attr called with object 0",
    "@set_attr called with object 0",
    "@test_attr called with object 0",
    "@move_object called moving object 0",
    "@move_object called moving into object 0",
    "@remove_object called with object 0",
    "@get_next_prop called with object 0"
That option is not yet implemented.


>leave

*** Run-time problem P47 (at paragraph 2537 in the source text): Phrase applied to an incompatible kind of value.

But you aren't in anything at the moment.

]

Book 1 - Region "A"

Part 1 - Room 1

Chapter 1 - Room definition

Room_1 is a room. The description is "[first time][italic type]@Attempt to address illegal object 69105. This is normally fatal.[roman type][line break][only]XXXX A closed door is to the north[if Bogo_East is in Room_1] and a narrow passage lies to the east[end if].".

Chapter 2 - Bogus East

Bogo_East is scenery in Room_1. The printed name is "east". Bogo_East can be entered.
Before going east in Room_1 when Bogo_East is in the location:
	Say "You cannot go east because east is in the way.";
	Stop the action.
Before taking east:
	If Bogo_East is in the location:
		Say "Taken.";
		Now the player has Bogo_East;
	Otherwise:
		Say "You can't see any such thing.";
	Stop the action.
Before going east when the player has Bogo_East:
	Say "You already have that.";
	Stop the action.
Before entering east when the player has Bogo_East:
	Now the player is in Narrow East West Passage;
	Stop the action.
Before dropping east when the player has Bogo_East:
	Now Bogo_East is in the location;
	Say "Dropped.";
	Stop the action.

Chapter 3 - The North door and the Lantern

The lantern is a scenery. It is in Limbo.
Bogo North Door is scenery in Room_1. It is fixed in place. The printed name is "door".
Before going north when the player is in Room_1:
	Say "You can't because the door is in the way.";
	Stop the action.
Before entering bogo north door when the player is in Room_1:
	Say "You can't because the north is in the way.";
	Stop the action.
Before taking the lantern: [ when the player is in Room_1:]
	Say "(first entering the northern door)[line break]Taken.";
	Now the player has the lantern;
	Now the player is in Room_2;
	Stop the action.
Before opening bogo north door:
	Say "It is already open.";
	Stop the action.
Before closing bogo north door:
	Say "It is already closed.";
	Stop the action.
Instead of examining bogo north door:
	Say "Inside is a lantern.";
	Now the lantern is in Room_1.

Part 2 - Room_2

Chapter 1 - Room Definition

Room_2 is a room.

Chapter 2 - Movement issues

Before going south when the player is in Room_2:
	Move the player to Room_1;
	Stop the action.

Part 3 - Narrow East/West Passage

Chapter 1 - Room Definition

Narrow East West Passage is a room.

Chapter 2 - Movement Issues

Before going west when the player is in Narrow East West Passage:
	Move the player to Room_1;
	Stop the action.

Part 4 - Outside

Top of the stairs is a room. It is above Room_1. It is south of Room_1.
The description is "A field with a large. There is a large tree going near the entrance. One of the branches looks like you could easily climb it.".

Part 5 - Top of Tree

[ The tree really only exists so the player will try to go up and receive an inexplicable error ]

Top of Tree is above Top of the stairs. The description is "".

Part 9999 - Limbo

Limbo is a room. The description is "You are in limbo. You has a sad.".
