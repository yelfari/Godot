extends Node

func _ready():
	Game.addPokemon("Plimfa")
	Game.addPokemon("Pikachu")


	
	
var dataBasePokemon = {
	0 : {
		"Name": "Plimfa",
		"Health": 100,
		"lvl": 2,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		#"Scene": preload("res://enemies/slime.tscn"),
		"Attacks": {
			0 : {
				"Name" : "Hydropumpe",
				"Target": "Monster",
				"Damage": 12,
				"Heal": 0,
				"cost" : 2,
				},
			1 : {
				"Name": "HydroHeal",
				"Target": "Self",
				"Damage": 0,
				"Heal": 10,
				"cost": 4
				}
			}
		},
	1 : {
		"Name": "Pikachu",
		"Health": 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		#"Scene": preload("res://art/tiv5b4bs.bmp"),
		"Attacks": {
			0 : {
				"Name" : "BlitzBlasttt",
				"Target": "Monster",
				"Damage": 10,
				"Heal": 0,
				"cost" : 2,
				},
			1 : {
				"Name": "Blitzheal",
				"Target": "Self",
				"Damage": 0,
				"Heal": 10,
				"cost": 4
				},
			2 : {
				"Name": "BlitzAngst",
				"Target": "Self",
				"Damage": 0,
				"Heal": 10,
				"cost": 4
				}
			}
		}

}

	



var playerPokeMons = {
	
}

func addPokemon(Name):
	for i in dataBasePokemon:
		if dataBasePokemon[i]["Name"] == Name:
			var tempDic = dataBasePokemon[i].duplicate(true)
			playerPokeMons[playerPokeMons.size()] = tempDic
func addEXP(amount):
	for i in playerPokeMons:
		playerPokeMons[i]["Xp"] += amount	
		while amount >= playerPokeMons[i]["MaxXp"]:
			playerPokeMons[i]["lvl"] += 1	
			amount -= playerPokeMons[i]["MaxXp"]
			playerPokeMons[i]["MaxXp"] = playerPokeMons[i]["MaxXp"] + 5
		playerPokeMons[i]["Xp"] = amount	

	
