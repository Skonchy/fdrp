local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
Config								= {}

--------------------------------------------------------------------------------------------
-- Config
--------------------------------------------------------------------------------------------
-- GENERAL
Config.general = {
	controllers = true,
}
-- Locations
Config.police = {
	x = -259.08557128906,
	y = -974.677734375,
	z = 31.220008850098,
}
Config.comico = {
	x = 430.91763305664,
	y = -980.24694824218,
	z = 31.710563659668,
}
Config.hopital = {
	x = 1150.1,
	y = -1508.12,
	z = 34.6926,
}
Config.dealer = {
	x = -44.385055541992,
	y = -1109.7479248047,
	z = 26.437595367432,
}
-- Open Personal Menu
Config.menuperso = {
	keyboard = Keys["F5"],
	controller1 = Keys["SPACE"],
	controller2 = Keys["TOP"],
}
-- Open Job Menu
Config.menujob = {
	keyboard = Keys["F6"],
	controller1 = Keys["SPACE"],
	controller2 = Keys["DOWN"],
}
-- Teleport on Marker
Config.TPMarker = {
	keyboard1 = Keys["LEFTSHIFT"],
	keyboard2 = Keys["E"],
	controller1 = Keys["LEFTSHIFT"],
	controller2 = Keys["E"],
}
-- Raise Hands
Config.handsUP = {
	keyboard = Keys["~"],
	controller1 = Keys["RIGHT"],
	controller2 = Keys["F2"],
}
-- Hands-On
Config.handsON = {
	keyboard = Keys["G"],
}
-- Point
Config.pointing = {
	keyboard = Keys["B"],
	controller = Keys["B"],
}
-- Crouch
Config.crouch = {
	keyboard = Keys["LEFTCTRL"],
	controller = Keys["LEFTCTRL"],
}