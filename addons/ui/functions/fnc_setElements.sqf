/*
 * Author: Jonpas
 * Sets basic visible elements of the UI using showHUD setter.
 *
 * Arguments:
 * 0: Force change even when disallowed <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_ui_fnc_setElements
 *
 * Public: No
 */
#include "script_component.hpp"

if (isArray (missionConfigFile >> "showHUD")) exitWith {};

params [ ["_force", false, [true]] ];

["ui", [
    true,
    GVAR(soldierVehicleWeaponInfo),
    GVAR(vehicleRadar),
    GVAR(vehicleCompass),
    true,
    GVAR(commandMenu),
    GVAR(groupBar),
    true
]] call EFUNC(common,showHud);
