#define MINIMUM_PLAYERS_SPAWN_DISTANCE 8

#define MAXIMUM_BATTLEROYALE_TIME 10 MINUTES
							// zone size in percents, time zone stays inactive, time zone shrinks into next zone
#define BATTLEROYALE_ZONES_SETTINGS list(\
										list(100, 0 MINUTES,  2 MINUTES),\
										list(75,  1 MINUTES,  1 MINUTES),\
										list(50,  2 MINUTES,  1 MINUTES),\
										list(25,  1 MINUTES,  30 SECONDS),\
										list(10,  45 SECONDS, 15 SECONDS),\
										list(1,   15 SECONDS, 15 SECONDS),\
										list(0,   1 HOURS,     1 HOURS),\
									)

#define BATTLEROYALE_STARTEQUIPMENT_TIER1 /datum/battleroyale_loadout/start_equipment/tier1

#define ZONE_SIZE 1
#define ZONE_WAIT_TIME 2
#define ZONE_SHRINK_TIME 3

#define ZONE_STATE_INIT 0
#define ZONE_STATE_WAIT 1
#define ZONE_STATE_SHRINK 2
