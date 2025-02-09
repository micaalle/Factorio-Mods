The beacon logic is working the only thing that is missing are the sprites that will be implemented. The goal is to give the player access to a respawn beacon once military has been researched. The beacon will be placeable anywhere and will maintain the player's spawn unless it is mined or destroyed.

Currently accumulator placeholders are being used

In its current state the mod will reposition the new player spawnpoint to slightly under the beacon when it is placed. If for any reason you place a second one it will reset the spawnpoint to the new beacon. If a beacon is destroyed and it is not the most recent instance of a beacon being placed, nothing will happen. However if the instance of the most recent beacon which was placed (aka your current spawnpoint) then it will be reset back to the point of origin (0,0)
