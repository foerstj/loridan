# Loridan remaster

The original 3rd-party Loridan map, remastered.

## What I did (remaster)

This map is re-buildable and editable. I opened & saved every region in Siege Editor v1.7. The dsmap file can be rebuilt using the batch scripts, provided you have the folder structure of Dungeon Siege, TankCreator and gaspy.
- SE saves the "required_level" attributes for multiplayer start positions with an "i" in front, which however breaks the level requirement.\
  This is fixed during build by a gaspy script.
- Renamed the map so there are no conflicts with the original map.\
  The internal name is *world/maps/loridan*.\
  The generated file name is *Dungeon Siege/DSLOA/Loridan.dsmap*.\
  The ingame name is *Loridan (remastered)*.
- The veteran & elite world levels are auto-generated. Siege Editor cannot handle them and deletes them when opening & saving a region anyway.
- Fixed umlaut in conversation id
- Renamed internal names of regions, conversation ids, world locations & start positions in English

## What I did (revisit)

The "revisited" map variant is based on the remaster, with these changes applied:
- Translated German names, conversations etc. to English
- Added dsres for German re-translation (fixing typos along the way)
- Made world-location triggers multiplayer-only
- Fixed required levels not being applied to start positions in regular mode
- Fixed teleport platforms not fitting well, and positioning of the teleport effects
- Brushed up plants (randomize size & orientation where not set)
- Added sign pointing directly at the walk-thru wall
- Removed a few cam-block flags from nodes
- Re-used unused conversation item in the small cave
- Replaced veteran & test containers with normal ones, configured a mana shrine, positioned a door, and more mini fixes
- Fixed North vector in Old Pathway
- Fixed overlapping terrain in Small Cave
- Fixed a few terrain texture borders
- Fixed asymmetric fading bug of Old Cellar

## How to build

GasPy repo: https://github.com/foerstj/gaspy

- Put TankCreator and gaspy on the same folder level as your Dungeon Siege installation. Basically in the upper folder, you should have a "Dungeon Siege" folder, a "TankCreator" folder, and a "gaspy" folder.
- Put this repo as "Bits" into your personal Dungeon Siege LoA folder (where the savegames & screenshots are).
- Go into your Dungeon Siege installation folder and open CMD there.
- %USERPROFILE%\Documents\Dungeon Siege LoA\Bits\build.bat

## Attribution

This map was created by one "Minotaurus", not me. I'm just doing minor changes here.
