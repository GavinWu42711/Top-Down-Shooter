extends Node2D

class_name Guns_handler

#Gun sprites
@onready var gun_scenes:Dictionary = {
	"assault_rifle":[preload("res://Scenes/Guns/assaullt_rifle_1.tscn"),preload("res://Scenes/Guns/assault_rifle_2.tscn")],
	"explosive":[preload("res://Scenes/Guns/explosive_1.tscn"),preload("res://Scenes/Guns/explosive_2.tscn")],
	"machine_gun":[preload("res://Scenes/Guns/machine_gun_1.tscn"),preload("res://Scenes/Guns/machine_gun_2.tscn")],
	"pistol":[preload("res://Scenes/Guns/pistol_1.tscn"),preload("res://Scenes/Guns/pistol_2.tscn")],
	"revolver":[preload("res://Scenes/Guns/revolver_1.tscn"),preload("res://Scenes/Guns/revolver_2.tscn")],
	"shotgun":[preload("res://Scenes/Guns/shotgun_1.tscn"),preload("res://Scenes/Guns/shotgun_2.tscn")],
	"smg":[preload("res://Scenes/Guns/smg_1.tscn"),preload("res://Scenes/Guns/smg_2.tscn")],
	"sniper_rifle":[preload("res://Scenes/Guns/sniper_rifle_1.tscn"),preload("res://Scenes/Guns/sniper_rifle_2.tscn")]
}

#Parent bullet 
@onready var bullet_scene = preload("res://Scenes/Bullets/Bullet.tscn")

#To allow for the use of for loops
var gun_types:Array = ["assault_rifle", "explosive", "machine_gun", "pistol", "revolver", "shotgun", "smg", "sniper_rifle"]

""" Dictionary of dictionary of gun modifiers
	shoot cooldown: the cooldown before the next time the gun can shoot again
	burst delay: the cooldown between each burst of shot
	burst amount: how many times the gun should release bullets in 1 shot
	shot amount: the amount of bullets release in each burst
	shot spread: a multiplier on the spread of the shots
"""
var gun_modifiers:Dictionary = {
	"assault_rifle":[
	{
		"shoot_cooldown" : 0.5,
		"burst_delay":0.05,
		"burst_amount":3,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 0.5,
		"burst_delay":0.05,
		"burst_amount":3,
		"shot_amount":1,
		"shot_spread":1
	}],
	"explosive":[
	{
		"shoot_cooldown" : 2,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 2,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"machine_gun":[
	{
		"shoot_cooldown" : 0.04,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 0.04,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"pistol":[
	{
		"shoot_cooldown" : 0.25,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 0.25,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"revolver":[
	{
		"shoot_cooldown" : 1.5,
		"burst_delay":0.02,
		"burst_amount":6,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1.5,
		"burst_delay":0.02,
		"burst_amount":6,
		"shot_amount":1,
		"shot_spread":1
	}],
	"shotgun":[
	{
		"shoot_cooldown" : 1.5,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":10,
		"shot_spread":2
	},
	{
		"shoot_cooldown" : 1.5,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":10,
		"shot_spread":2
	}],
	"smg":[
	{
		"shoot_cooldown" : 0.1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 0.1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"sniper_rifle":[
	{
		"shoot_cooldown" : 3,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 3,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}]
}

""" Dictionary of dictionary of bullet modifiers
	bullet speed: base speed at which the bullet travels
	bullet damage: base damage the bullet does to an enemy
	bullet speed multiplier: multipler on bullet speed
	bullet damage multiplier: multiplier on bullet damage
	bullet temp effects: TBD
	bullet perm effects: TBD
	bullet size: multiplier on bullet size
	

"""

var bullet_modifiers:Dictionary = {
	"assault_rifle":[
	{
		"bullet_speed":300,
		"bullet_damage":10,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
		
	},
	{
		"bullet_speed":300,
		"bullet_damage":10,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"explosive":[
	{
		"bullet_speed":75,
		"bullet_damage":20,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":2,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	},
	{
		"bullet_speed":75,
		"bullet_damage":20,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":2,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"machine_gun":[
	{
		"bullet_speed":300,
		"bullet_damage":2.5,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":0.5,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	},
	{
		"bullet_speed":300,
		"bullet_damage":2.5,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":0.5,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"pistol":[
	{
		"bullet_speed":300,
		"bullet_damage":15,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	},
	{
		"bullet_speed":300,
		"bullet_damage":15,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"revolver":[
	{
		"bullet_speed":400,
		"bullet_damage":10,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	},
	{
		"bullet_speed":400,
		"bullet_damage":10,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"shotgun":[
	{
		"bullet_speed":300,
		"bullet_damage":5,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":0.75,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	},
	{
		"bullet_speed":300,
		"bullet_damage":5,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":0.75,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"smg":[
	{
		"bullet_speed":300,
		"bullet_damage":7.5,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	},
	{
		"bullet_speed":300,
		"bullet_damage":7.5,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":5.0
	}],
	"sniper_rifle":[
	{
		"bullet_speed":400,
		"bullet_damage":50,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":20
	},
	{
		"bullet_speed":400,
		"bullet_damage":50,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":{},
		"bullet_perm_effects":{},
		"bullet_size":1,
		"bullet_lifespan":1.5,
		"bullet_knockback":20
	}]
}

signal upgrade_bullet_stat(gun_type:String, gun_index:int, modifier:String, amount:float)
signal upgrade_gun_stat(gun_type:String, gun_index:int, modifier:String, amount:float)
signal upgrade_bullet_temp_effect(gun_type:String, gun_index:int, modifier:String, amount:float)
signal upgrade_bullet_perm_effect(gun_type:String, gun_index:int, modifier:String, amount:float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upgrade_bullet_stat.connect(apply_bullet_stat_upgrade)
	upgrade_gun_stat.connect(apply_gun_stat_upgrade)
	upgrade_bullet_temp_effect.connect(apply_temp_effect_upgrade)
	upgrade_bullet_perm_effect.connect(apply_perm_effect_upgrade)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Handles the animation of the gun
func handle_animation(gun:Node2D) -> void:
	pass
	
#Shoots all guns in slot
func shoot() -> void:
	var children = self.get_children()
	if children:
		for gun in children:
			complete_shot(gun)

#Complete shot from each weapon
func complete_shot(gun:Gun) -> void:
	if not gun.unequipping_gun:
		if gun.can_shoot:
			#Avoid bugs by automatically setting the ability to shoot as false
			gun.can_shoot = false
			var bullet_modifiers_dict:Dictionary
			var gun_modifiers_dict:Dictionary
					
			if gun is assault_rifle_1:
				bullet_modifiers_dict = bullet_modifiers["assault_rifle"][0]
				gun_modifiers_dict = gun_modifiers["assault_rifle"][0]
				
			elif gun is assault_rifle_2:
				bullet_modifiers_dict = bullet_modifiers["assault_rifle"][1]
				gun_modifiers_dict = gun_modifiers["assault_rifle"][1]
				
			elif gun is explosive_1:
				bullet_modifiers_dict = bullet_modifiers["explosive"][0]
				gun_modifiers_dict = gun_modifiers["explosive"][0]
				
			elif gun is explosive_2:
				bullet_modifiers_dict = bullet_modifiers["explosive"][1]
				gun_modifiers_dict = gun_modifiers["explosive"][1]
				
			elif gun is machine_gun_1:
				bullet_modifiers_dict = bullet_modifiers["machine_gun"][0]
				gun_modifiers_dict = gun_modifiers["machine_gun"][0]
				
			elif gun is machine_gun_2:
				bullet_modifiers_dict = bullet_modifiers["machine_gun"][1]
				gun_modifiers_dict = gun_modifiers["machine_gun"][1]
				
			elif gun is pistol_1:
				bullet_modifiers_dict = bullet_modifiers["pistol"][0]
				gun_modifiers_dict = gun_modifiers["pistol"][0]
				
			elif gun is pistol_2:
				bullet_modifiers_dict = bullet_modifiers["pistol"][1]
				gun_modifiers_dict = gun_modifiers["pistol"][1]
				
			elif gun is revolver_1:
				bullet_modifiers_dict = bullet_modifiers["revolver"][0]
				gun_modifiers_dict = gun_modifiers["revolver"][0]
				
			elif gun is revolver_2:
				bullet_modifiers_dict = bullet_modifiers["revolver"][1]
				gun_modifiers_dict = gun_modifiers["revolver"][1]
				
			elif gun is shotgun_1:
				bullet_modifiers_dict = bullet_modifiers["shotgun"][0]
				gun_modifiers_dict = gun_modifiers["shotgun"][0]
				
			elif gun is shotgun_2:
				bullet_modifiers_dict = bullet_modifiers["shotgun"][1]
				gun_modifiers_dict = gun_modifiers["shotgun"][1]
				
			elif gun is smg_1:
				bullet_modifiers_dict = bullet_modifiers["smg"][0]
				gun_modifiers_dict = gun_modifiers["smg"][0]
				
			elif gun is smg_2:
				bullet_modifiers_dict = bullet_modifiers["smg"][1]
				gun_modifiers_dict = gun_modifiers["smg"][1]
				
			elif gun is sniper_rifle_1:
				bullet_modifiers_dict = bullet_modifiers["sniper_rifle"][0]
				gun_modifiers_dict = gun_modifiers["sniper_rifle"][0]
				
			elif gun is sniper_rifle_2:
				bullet_modifiers_dict = bullet_modifiers["sniper_rifle"][1]
				gun_modifiers_dict = gun_modifiers["sniper_rifle"][1]
			
			gun.shooting = true
			for burst in range(gun_modifiers_dict["burst_amount"]):
				if gun:
					handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					if gun:
						base_shot(gun, gun.global_position, Global.cursor_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"], bullet_modifiers_dict["bullet_lifespan"], bullet_modifiers_dict["bullet_knockback"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout
			gun.shooting = false
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			if gun:
				gun.can_shoot = true
			
#Sets up singular shot for each variation of gun
func base_shot(gun:Node2D,bullet_start_point:Vector2, bullet_end_point:Vector2, bullet_damage:float = 1, bullet_speed:float = 1, bullet_size:float = 1, bullet_perm_effects:Dictionary = {}, bullet_temp_effects:Dictionary = {}, bullet_lifespan:float = 1.5, bullet_knockback:float = 5) -> void:
	#Make new bullet node
	var bullet:CharacterBody2D = bullet_scene.instantiate()
	
	#Sets bullet type to instantiate the right sprite
	if gun is assault_rifle_1:
		bullet.bullet_type = "assault_rifle"
		bullet.bullet_index = 0
	elif gun is assault_rifle_2:
		bullet.bullet_type = "assault_rifle"
		bullet.bullet_index = 1
	elif gun is explosive_1:
		bullet.bullet_type = "explosive"
		bullet.bullet_index = 0
	elif gun is explosive_2:
		bullet.bullet_type = "explosive"
		bullet.bullet_index = 1
	elif gun is machine_gun_1:
		bullet.bullet_type = "machine_gun"
		bullet.bullet_index = 0
	elif gun is machine_gun_2:
		bullet.bullet_type = "machine_gun"
		bullet.bullet_index = 1
	elif gun is pistol_1:
		bullet.bullet_type = "pistol"
		bullet.bullet_index = 0
	elif gun is pistol_2:
		bullet.bullet_type = "pistol"
		bullet.bullet_index = 1
	elif gun is revolver_1:
		bullet.bullet_type = "revolver"
		bullet.bullet_index = 0
	elif gun is revolver_2:
		bullet.bullet_type = "revolver"
		bullet.bullet_index = 1
	elif gun is shotgun_1:
		bullet.bullet_type = "shotgun"
		bullet.bullet_index = 0
	elif gun is shotgun_2:
		bullet.bullet_type = "shotgun"
		bullet.bullet_index = 1
	elif gun is smg_1:
		bullet.bullet_type = "smg"
		bullet.bullet_index = 0
	elif gun is smg_2:
		bullet.bullet_type = "smg"
		bullet.bullet_index = 1
	elif gun is sniper_rifle_1:
		bullet.bullet_type = "sniper_rifle"
		bullet.bullet_index = 0
	elif gun is sniper_rifle_2:
		bullet.bullet_type = "sniper_rifle"
		bullet.bullet_index = 1
	
	#Sets variables for the bullet
	bullet.bullet_start_point = bullet_start_point
	bullet.bullet_end_point = bullet_end_point
	bullet.bullet_damage = bullet_damage
	bullet.bullet_speed = bullet_speed
	bullet.bullet_size = bullet_size
	bullet.bullet_lifespan = bullet_lifespan
	bullet.bullet_knockback = bullet_knockback
	
	bullet.bullet_perm_effects = bullet_perm_effects
	
	bullet.bullet_temp_effects = bullet_temp_effects
		
	get_node("/root").add_child(bullet)
	#gun.add_child(bullet)

#When a new gun is equipped
func equip_gun(gun_type:String, gun_index:int) -> void:
	#Instantiates gun sprite
	var gun = gun_scenes[gun_type][gun_index].instantiate()
	self.add_child(gun)

#When a gun is unequipped
"""to be changed to allow the changing of specific guns; need to implement specific id's through a 'guns set' """
func unequip_gun(gun_type:String, gun_index:int) -> void:
	if gun_index == 0:
		if gun_type == "assault_rifle":
			for gun in self.get_children():
				if gun is assault_rifle_1:
						gun.remove()
		if gun_type == "explosive":
			for gun in self.get_children():
				if gun is explosive_1:
						gun.remove()
		if gun_type == "machine_gun":
			for gun in self.get_children():
				if gun is machine_gun_1:
						gun.remove()
		if gun_type == "pistol":
			for gun in self.get_children():
				if gun is pistol_1:
						gun.remove()
		if gun_type == "revolver":
			for gun in self.get_children():
				if gun is revolver_1:
						gun.remove()
		if gun_type == "shotgun":
			for gun in self.get_children():
				if gun is shotgun_1:
						gun.remove()
		if gun_type == "smg":
			for gun in self.get_children():
				if gun is smg_1:
						gun.remove()
		if gun_type == "sniper_rifle":
			for gun in self.get_children():
				if gun is sniper_rifle_1:
						gun.remove()
	elif gun_index == 1:
		if gun_type == "assault_rifle":
			for gun in self.get_children():
				if gun is assault_rifle_2:
						gun.remove()
		if gun_type == "explosive":
			for gun in self.get_children():
				if gun is explosive_2:
						gun.remove()
		if gun_type == "machine_gun":
			for gun in self.get_children():
				if gun is machine_gun_2:
						gun.remove()
		if gun_type == "pistol":
			for gun in self.get_children():
				if gun is pistol_2:
						gun.remove()
		if gun_type == "revolver":
			for gun in self.get_children():
				if gun is revolver_2:
						gun.remove()
		if gun_type == "shotgun":
			for gun in self.get_children():
				if gun is shotgun_2:
						gun.remove()
		if gun_type == "smg":
			for gun in self.get_children():
				if gun is smg_2:
						gun.remove()
		if gun_type == "sniper_rifle":
			for gun in self.get_children():
				if gun is sniper_rifle_2:
						gun.remove()
						
#Applies an upgrade to the bullet with the specified modifier
func apply_bullet_stat_upgrade(gun_type:String, gun_index:int, modifier:String, amount:int) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				bullet_modifiers[gun_type][i][modifier] += amount
	else:
		bullet_modifiers[gun_type][gun_index][modifier] += amount
		
#Applies an upgrade to the gun with the specified modifier
func apply_gun_stat_upgrade(gun_type:String, gun_index:int, modifier:String, amount:int) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				gun_modifiers[gun_type][i][modifier] += amount
	else:
		gun_modifiers[gun_type][gun_index][modifier] += amount
		
#Applies a unique temp effect to the gun with the specified modifier
func apply_temp_effect_upgrade(gun_type:String, gun_index:int, modifier:String, amount:int) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				var m_dict:Dictionary = bullet_modifiers[gun_type][i]["bullet_temp_effects"]
				if m_dict.get(modifier):
					bullet_modifiers[gun_type][i]["bullet_temp_effects"][modifier] += amount
				else:
					bullet_modifiers[gun_type][i]["bullet_temp_effects"][modifier] = amount
	else:
		var m_dict:Dictionary = bullet_modifiers[gun_type][gun_index]["bullet_temp_effects"]
		if m_dict.get(modifier):
			bullet_modifiers[gun_type][gun_index]["bullet_temp_effects"][modifier] += amount
		else:
			bullet_modifiers[gun_type][gun_index]["bullet_temp_effects"][modifier] = amount
	
#Applies a unique perm effect to the gun with the specified modifier
func apply_perm_effect_upgrade(gun_type:String, gun_index:int, modifier:String, amount:int) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				var m_dict:Dictionary = bullet_modifiers[gun_type][i]["bullet_perm_effects"]
				if m_dict.get(modifier):
					bullet_modifiers[gun_type][i]["bullet_perm_effects"][modifier] += amount
				else:
					bullet_modifiers[gun_type][i]["bullet_perm_effects"][modifier] = amount
	else:
		var m_dict:Dictionary = bullet_modifiers[gun_type][gun_index]["bullet_perm_effects"]
		if m_dict.get(modifier):
			bullet_modifiers[gun_type][gun_index]["bullet_perm_effects"][modifier] += amount
		else:
			bullet_modifiers[gun_type][gun_index]["bullet_perm_effects"][modifier] = amount


		

	
