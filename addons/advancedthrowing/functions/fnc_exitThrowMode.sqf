/*
 * Author: Dslyecxi, Jonpas
 * Exits throw mode.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, "reason"] call ace_advancedthrowing_fnc_exitThrowMode
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(inHand)) exitWith {};

params ["_unit", "_reason"];

#ifdef DEBUG_MODE_FULL
    systemChat format ["Exit Throw Mode: %1", _reason];
#endif

if (!GVAR(primed)) then {
    deleteVehicle GVAR(activeThrowable);
};

GVAR(inHand) = false;
GVAR(primed) = false;
GVAR(activeThrowable) = objNull;
GVAR(throwType) = "normal";
GVAR(dropMode) = false;

// Remove controls hint (check if ever enabled is inside the function)
call EFUNC(interaction,hideMouseHint);

// Remove throw action
[_unit, "DefaultAction", _unit getVariable [QGVAR(throwAction), -1]] call EFUNC(common,removeActionEventHandler);

// Remove throw arc draw
if (!isNil QGVAR(draw3DHandle)) then {
    removeMissionEventHandler ["Draw3D", GVAR(draw3DHandle)];
    GVAR(draw3DHandle) = nil;
};
