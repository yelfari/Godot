extends Node

func _ready():
	Game.addPokemon("Plinfa")
	Game.addPokemon("Pikachu")
	Game.addPokemon("Schiggy")
	Game.addPokemon("Glumanda")
	Game.addPokemon("Plinfa")
	Game.addPokemon("Glumanda")

var dataBasePokemon = {
	
	0 : {
		"Name": "Plinfa",
		"Health": 100,
		"CurrentHealth" : 80,
		"lvl": 2,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Water"],
		"Description" : "Es stolpert häufig, weil es nicht gut laufen kann. Allerdings ist es sehr stolz, und so rappelt es sich immer wieder unbeirrt auf.",
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
		"CurrentHealth" : 50,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Lightning"],
		"Description" : "Ist es wütend, entlädt sich augenblicklich die Elektrizität, die es in seinen Backentaschen gespeichert hat.",
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
		},
	2 : {
		"Name": "Schiggy",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Water"],
		"Description" : "Nach der Geburt schwillt sein Rücken an und verhärtet sich zu einem Panzer. Es versprüht starken Schaum aus seinem Maul.",
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
		},
	3 : {
		"Name": "Glumanda",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Fire"],
		"Description" : "Die Flamme an seiner Schwanzspitze zeigt seine Lebensenergie an. Geht es ihm nicht gut, wird die Flamme schwächer.",
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
		},
	4 : {
		"Name": "Golbat",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Flight"],
		"Description" : "Das Blut anderer Lebewesen ist seine Leibspeise. Man sagt, dass es das abgesaugte Blut manchmal mit hungrigen Artgenossen teilt.",
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
		},
	5 : {
		"Name": "Pummeluff",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Normal"],
		"Description" : "Wenn seine Kulleraugen zu flackern beginnen, singt es ein mysteriöses, wohlklingendes Lied, das Zuhörer in Schlaf versetzt.",
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
		},
	6 : {
		"Name": "Quapsel",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Water"],
		"Description" : "Die Spirale auf seinem Bauch ist ein Teil seiner Innereien, die durchscheinen. Hat es gefressen, sind diese klarer zu sehen.",
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
		},
	7 : {
		"Name": "Raupy",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Plant"],
		"Description" : "Als Schutz vor Feinden sondert es einen übel riechenden Gestank mit seinen Antennen ab.",
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
		},
	8 : {
		"Name": "Taubsi",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Flight"],
		"Description" : "Ein sanftmütiges Pokémon, welches lieber Sand zum Schutz aufwirbelt, als zurückzuschlagen.",
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
		},
	9 : {
		"Name": "Tragosso",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 5,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Normal"],
		"Description" : "Denkt Tragosso an seine verstorbene Mutter, so weint es. Sein Schluchzen hallt dabei in dem Schädel auf seinem Kopf klagend wider.",
		#"Scene": preload("res://art/tiv5b4bs.bmp"),
		"Attacks": {
			0 : {
				"Name" : "Attack1",
				"Target": "Monster",
				"Damage": 10,
				"Heal": 0,
				"cost" : 2,
				},
			1 : {
				"Name": "Attack2",
				"Target": "Self",
				"Damage": 0,
				"Heal": 10,
				"cost": 4
				},
			2 : {
				"Name": "TragossoSchlägeBUMM",
				"Target": "Self",
				"Damage": 0,
				"Heal": 10,
				"cost": 4
				}
			}
		},
	10 : {
		"Name": "Rattfratz",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Normal"],
		"Description" : "Es knabbert mit seinen zwei Nagezähnen alles und jeden an. Stößt man auf eines, findet man sicherlich 40 weitere in der Gegend.",
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
		},
	11 : {
		"Name": "Serpifeu",
		"Health": 100,
		"CurrentHealth" : 100,
		"lvl": 3,
		"Xp": 0,
		"MaxXp" : 10,
		"Strength": 10,
		"Defense": 15,
		"Type": ["Plant"],
		"Description" : "Wenn es über das Blatt an seinem Schwanz Sonnenlicht aufnimmt und Energie erzeugt, wird es schneller und greift präziser an.",
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
			var random_ID = randi()
			tempDic["ID"] = random_ID
			playerPokeMons[playerPokeMons.size()] = tempDic

func addEXP(amount) -> void:
	for i in playerPokeMons:
		playerPokeMons[i]["Xp"] += amount	
		while amount >= playerPokeMons[i]["MaxXp"]:
			playerPokeMons[i]["lvl"] += 1	
			amount -= playerPokeMons[i]["MaxXp"]
			playerPokeMons[i]["MaxXp"] = playerPokeMons[i]["MaxXp"] + 5
		playerPokeMons[i]["Xp"] = amount	


func getEnemyPokemonEntry(pokemonName):
	#print_debug(playerPokeMons)
	for i in dataBasePokemon:
		if dataBasePokemon[i]["Name"] == pokemonName:
			return dataBasePokemon[i] 
	
	return "No Pokemon with that Name in Database"

func getPlayerPokemonEntry(pokemonName):
	#print_debug(playerPokeMons)
	for i in playerPokeMons:
		return playerPokeMons[i] if playerPokeMons[i]["Name"] == pokemonName else "No such Pokemon found in your Inventory"

func getPlayerPokemonNames(): 
	var playerPokemonNameList = []
	for i in playerPokeMons:
		playerPokemonNameList.append(playerPokeMons[i]["Name"])
	return playerPokemonNameList

func changeSelectedPokemon() -> void:
	pass

var pokemon_levelMap = {
	"Level1": ["Serpifeu"],
	"Level2": ["Geodude", "Onix", "Machop"],
	"Level3": ["Squirtle", "Psyduck", "Magikarp"]
}
