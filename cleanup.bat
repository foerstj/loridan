:: name of map, case-sensitive
set map_cs=Loridan
:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup build files so as not to confuse Siege Editor
del "%ds%\DSLOA\%map_cs%.de.dsres"
del "%ds%\DSLOA\%map_cs%.dsmap"
