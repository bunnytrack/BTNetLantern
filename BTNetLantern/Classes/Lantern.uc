class Lantern extends Pickup;

/*
	+--------------------------------------------------------------------------+
	| BTNetLantern                                                             |
	| ------------------------------------------------------------------------ |
	| Authors:     Dizzy <dizzy@bunnytrack.net>                                |
	|              Sapphire <sapphire@bunnytrack.net>                          |
	| Description: A pickup which acts as a portable light source for players  |
	| Version:     2017-05-12                                                  |
	| Website:     bunnytrack.net                                              |
	| ------------------------------------------------------------------------ |
	| Released under the Creative Commons Attribution-NonCommercial-ShareAlike |
	| license. See https://creativecommons.org/licenses/by-nc-sa/4.0/          |
	+--------------------------------------------------------------------------+
*/

var config int iBrightness;
var config int iHue;
var config int iSaturation;
var config int iCone;
var config int iPeriod;
var config int iRadius;
var config int iVolumeBrightness;
var config ELightType iType;

function PickupFunction(Pawn ThePlayer) {

	// Make the player emit light
	ThePlayer.LightBrightness  = iBrightness;
	ThePlayer.LightHue         = iHue;
	ThePlayer.LightSaturation  = iSaturation;
	ThePlayer.LightCone        = iCone;
	ThePlayer.LightPeriod      = iPeriod;
	ThePlayer.LightRadius      = iRadius;
	ThePlayer.VolumeBrightness = iVolumeBrightness;
	ThePlayer.LightType        = iType;

	Super.PickupFunction(ThePlayer);

}

event Destroyed() {

	// Snuff out the light
	Pawn(Owner).LightType = LT_None;

	Super.Destroyed();

}

defaultproperties {
	// bAlwaysRelevant=True
	// bNetTemporary=False
	// bHidden=False
	PickupMessage="You picked up a lantern"
	Mesh=LodMesh'UnrealShare.Lantern2M'
    PickupViewMesh=LodMesh'UnrealShare.Lantern2M'
	PickupSound=Sound'UnrealShare.Pickups.GenPickSnd'
	bRotatingPickup=True
	RespawnTime=0.1
	AmbientGlow=96
	bUnlit=False
	ScaleGlow=1
	DrawScale=0.3
	RemoteRole=ROLE_SimulatedProxy
	LightBrightness=96
	LightHue=8
	LightRadius=8
	LightSaturation=32
	LightType=LT_Steady

	iBrightness=64
	iHue=64
	iSaturation=0
	iCone=128
	iPeriod=32
	iRadius=64
	iVolumeBrightness=64
	iType=LT_Steady
}