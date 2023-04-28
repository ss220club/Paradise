GLOBAL_LIST_EMPTY(fortniters_spawn)
GLOBAL_LIST_EMPTY(battleroyale_loot_spawn)

#define MINIMUM_PLAYERS_SPAWN_DISTANCE 8

#define DROPS_ZONE_SIZE 5

/**
 * 1) zone size in percents from max size
 * 2) time zone stays inactive before shrinking
 * 3) time zone shrinks into next zone
 * 4) /datum/battleroyale_loadout/spawnable type (or weighted list) that can spawn during this period
 */
#define BATTLEROYALE_ZONES_SETTINGS list(\
										list(100, 0 MINUTES,  2 MINUTES, /datum/battleroyale_loadout/spawnable/tier1),\
										list(75,  1 MINUTES,  1 MINUTES, /datum/battleroyale_loadout/spawnable/tier1),\
										list(50,  2 MINUTES,  1 MINUTES, list(/datum/battleroyale_loadout/spawnable/tier1 = 25, /datum/battleroyale_loadout/spawnable/tier2 = 75)),\
										list(25,  1 MINUTES,  30 SECONDS, /datum/battleroyale_loadout/spawnable/tier2),\
										list(10,  45 SECONDS, 15 SECONDS, list(/datum/battleroyale_loadout/spawnable/tier2 = 50, /datum/battleroyale_loadout/spawnable/tier3 = 50)),\
										list(5,   15 SECONDS, 15 SECONDS, /datum/battleroyale_loadout/spawnable/tier3),\
										list(0,   1 HOURS,     1 HOURS, /datum/battleroyale_loadout/spawnable/tier3),\
									)

#define BATTLEROYALE_STARTEQUIPMENT /datum/battleroyale_loadout/start_equipment/tier1

//damage the player will recieve each 2 seconds outside the zone
#define ZONE_DAMAGE_AMOUNT 10
#define ZONE_DAMAGE_TYPE BURN

#define ZONE_SIZE 1
#define ZONE_WAIT_TIME 2
#define ZONE_SHRINK_TIME 3
#define ZONE_DROP_TYPE 4

#define ZONE_STATE_INIT 0
#define ZONE_STATE_WAIT 1
#define ZONE_STATE_SHRINK 2

#define ZONE_COLOR "#33d2e7"

#define BATTLEROYALE_RESTRICTED_OBJECTS_TYPES list(\
												/obj/machinery/porta_turret,\
												/obj/machinery/computer,\
												/obj/machinery/clonepod,\
												/obj/machinery/flasher,\
												/obj/machinery/teleport,\
												/obj/machinery/autolathe,\
												/obj/machinery/vending,\
												/obj/machinery/disposal,\
												/obj/machinery/photocopier,\
												/obj/machinery/recharge_station,\
												/obj/machinery/mineral,\
												/obj/machinery/cooker,\
												/obj/machinery/hydroponics,\
												/obj/machinery/portable_atmospherics/canister,\
												/obj/machinery/suit_storage_unit,\
												/obj/machinery/chem_dispenser,\
												/obj/machinery/chem_master,\
												/obj/machinery/smartfridge,\
												/obj/machinery/sleeper,\
												/obj/machinery/bodyscanner,\
												/obj/machinery/atmospherics/unary/cryo_cell,\
												/obj/machinery/shieldwallgen,\
												/obj/machinery/gateway/centerstation,\
												/obj/machinery/door/airlock/vault,\
												/obj/machinery/nuclearbomb,\
												/obj/machinery/power/supermatter_shard,\
												/obj/structure/closet,\
												/obj/structure/filingcabinet,\
												/obj/structure/reagent_dispensers,\
												/obj/structure/displaycase,\
												/obj/structure/barricade/wooden,\
												/obj/item,\
												/mob/living/simple_animal/bot,\
												/mob/living/simple_animal/slime,\
												/obj/spacepod,\
												)

