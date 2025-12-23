extends Node2D

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
		"shoot_cooldown" : 1,
		"burst_delay":1,
		"burst_amount":3,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":1,
		"burst_amount":3,
		"shot_amount":1,
		"shot_spread":1
	}],
	"explosive":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"machine_gun":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"pistol":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"revolver":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":1,
		"burst_amount":6,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":1,
		"burst_amount":6,
		"shot_amount":1,
		"shot_spread":1
	}],
	"shotgun":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":10,
		"shot_spread":2
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":10,
		"shot_spread":2
	}],
	"smg":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	}],
	"sniper_rifle":[
	{
		"shoot_cooldown" : 1,
		"burst_delay":0,
		"burst_amount":1,
		"shot_amount":1,
		"shot_spread":1
	},
	{
		"shoot_cooldown" : 1,
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
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
		
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"explosive":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"machine_gun":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"pistol":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"revolver":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"shotgun":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"smg":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}],
	"sniper_rifle":[
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	},
	{
		"bullet_speed":1,
		"bullet_damage":1,
		"bullet_speed_multiplier":1,
		"bullet_damage_multiplier":1,
		"bullet_temp_effects":[],
		"bullet_perm_effects":[],
		"bullet_size":1
	}]
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Handles the animation of the gun
func handle_animation(gun:Node2D) -> void:
	print("animation")

#Shoots all guns in slot
func shoot(gun_global_position:Vector2) -> void:
	var children = self.get_children()
	if children:
		for gun in children:
			complete_shot(gun,gun_global_position,Global.cursor_position)

#Complete shot from each weapon
func complete_shot(gun:Node2D, gun_global_position:Vector2, cursor_global_position:Vector2) -> void:
	if gun.can_shoot:
		#Avoid bugs by automatically setting the ability to shoot as false
		gun.can_shoot = false
		
		if gun is assault_rifle_1:
			var bullet_modifiers_dict = bullet_modifiers["assault_rifle"][0]
			var gun_modifiers_dict = gun_modifiers["assault_rifle"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is assault_rifle_2:
			var bullet_modifiers_dict = bullet_modifiers["assault_rifle"][1]
			var gun_modifiers_dict = gun_modifiers["assault_rifle"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is explosive_1:
			var bullet_modifiers_dict = bullet_modifiers["explosive"][0]
			var gun_modifiers_dict = gun_modifiers["explosive"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is explosive_2:
			var bullet_modifiers_dict = bullet_modifiers["explosive"][1]
			var gun_modifiers_dict = gun_modifiers["explosive"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is machine_gun_1:
			var bullet_modifiers_dict = bullet_modifiers["machine_gun"][0]
			var gun_modifiers_dict = gun_modifiers["machine_gun"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is machine_gun_2:
			var bullet_modifiers_dict = bullet_modifiers["machine_gun"][1]
			var gun_modifiers_dict = gun_modifiers["machine_gun"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is pistol_1:
			var bullet_modifiers_dict = bullet_modifiers["pistol"][0]
			var gun_modifiers_dict = gun_modifiers["pistol"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is pistol_2:
			var bullet_modifiers_dict = bullet_modifiers["pistol"][1]
			var gun_modifiers_dict = gun_modifiers["pistol"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is revolver_1:
			var bullet_modifiers_dict = bullet_modifiers["revolver"][0]
			var gun_modifiers_dict = gun_modifiers["revolver"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is revolver_2:
			var bullet_modifiers_dict = bullet_modifiers["revolver"][1]
			var gun_modifiers_dict = gun_modifiers["revolver"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is shotgun_1:
			var bullet_modifiers_dict = bullet_modifiers["shotgun"][0]
			var gun_modifiers_dict = gun_modifiers["shotgun"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is shotgun_2:
			var bullet_modifiers_dict = bullet_modifiers["shotgun"][1]
			var gun_modifiers_dict = gun_modifiers["shotgun"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is smg_1:
			var bullet_modifiers_dict = bullet_modifiers["smg"][0]
			var gun_modifiers_dict = gun_modifiers["smg"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout				
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is smg_2:
			var bullet_modifiers_dict = bullet_modifiers["smg"][1]
			var gun_modifiers_dict = gun_modifiers["smg"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is sniper_rifle_1:
			var bullet_modifiers_dict = bullet_modifiers["sniper_rifle"][0]
			var gun_modifiers_dict = gun_modifiers["sniper_rifle"][0]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true
			
		elif gun is sniper_rifle_2:
			var bullet_modifiers_dict = bullet_modifiers["sniper_rifle"][1]
			var gun_modifiers_dict = gun_modifiers["sniper_rifle"][1]
			for burst in range(gun_modifiers_dict["burst_amount"]):
				handle_animation(gun)
				for shot in range(gun_modifiers_dict["shot_amount"]):
					base_shot(gun, gun_global_position, cursor_global_position, bullet_modifiers_dict["bullet_damage"] * bullet_modifiers_dict["bullet_damage_multiplier"],  bullet_modifiers_dict["bullet_speed"] * bullet_modifiers_dict["bullet_speed_multiplier"], bullet_modifiers_dict["bullet_size"], bullet_modifiers_dict["bullet_perm_effects"], bullet_modifiers_dict["bullet_temp_effects"] )
				await get_tree().create_timer(gun_modifiers_dict["burst_delay"]).timeout
			await get_tree().create_timer(gun_modifiers_dict["shoot_cooldown"]).timeout
			gun.can_shoot = true

#Sets up singular shot for each variation of gun
#Bullet_effect expects an array of an array; second array should begin with the bullet modifier and then the number of times to be applied
func base_shot(gun:Node2D,bullet_start_point:Vector2, bullet_end_point:Vector2, bullet_damage:float = 1, bullet_speed:float = 1, bullet_size:float = 1, bullet_perm_effects:Array = [], bullet_temp_effects:Array = []) -> void:
	#Make new bullet node
	var bullet = bullet_scene.instantiate()
	
	#Sets bullet type to instantiate the right sprite
	if gun is assault_rifle_1:
		bullet.bullet_type = "assault_rife_1"
	elif gun is assault_rifle_2:
		bullet.bullet_type = "assault_rifle_2"
	elif gun is explosive_1:
		bullet.bullet_type = "explosive_1"
	elif gun is explosive_2:
		bullet.bullet_type = "explosive_2"
	elif gun is machine_gun_1:
		bullet.bullet_type = "machine_gun_1"
	elif gun is machine_gun_2:
		bullet.bullet_type = "machine_gun_2"
	elif gun is pistol_1:
		bullet.bullet_type = "pistol_1"
	elif gun is pistol_2:
		bullet.bullet_type = "pistol_2"
	elif gun is revolver_1:
		bullet.bullet_type = "revolver_1"
	elif gun is revolver_2:
		bullet.bullet_type = "revolver_2"
	elif gun is shotgun_1:
		bullet.bullet_type = "shotgun_1"
	elif gun is shotgun_2:
		bullet.bullet_type = "shotgun_2"
	elif gun is smg_1:
		bullet.bullet_type = "smg_1"
	elif gun is smg_2:
		bullet.bullet_type = "smg_2"
	elif gun is sniper_rifle_1:
		bullet.bullet_type = "sniper_rifle_1"
	elif gun is sniper_rifle_2:
		bullet.bullet_type = "sniper_rifle_2"
	
	#Sets variables for the bullet
	bullet.bullet_start_point = bullet_start_point
	bullet.bullet_end_point - bullet_end_point
	bullet.bullet_damage = bullet_damage
	bullet.bullet_speed = bullet_speed
	bullet.bullet_size = bullet_size
	
	for bullet_effect in bullet_perm_effects:
		bullet.bullet_perm_effects[bullet_effect[0]] = bullet_effect[1]
	
	for bullet_effect in bullet_temp_effects:
		bullet.bullet_temp_effects[bullet_effect[0]] = bullet_effect[1]
	
	gun.add_child(bullet)

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
			for gun in get_node("Guns").get_children():
				if gun is assault_rifle_1:
					gun.queue_free()
		if gun_type == "explosive":
			for gun in get_node("Guns").get_children():
				if gun is explosive_1:
					gun.queue_free()
		if gun_type == "machine_gun":
			for gun in get_node("Guns").get_children():
				if gun is machine_gun_1:
					gun.queue_free()
		if gun_type == "pistol":
			for gun in get_node("Guns").get_children():
				if gun is pistol_1:
					gun.queue_free()
		if gun_type == "revolver":
			for gun in get_node("Guns").get_children():
				if gun is revolver_1:
					gun.queue_free()
		if gun_type == "shotgun":
			for gun in get_node("Guns").get_children():
				if gun is shotgun_1:
					gun.queue_free()
		if gun_type == "smg":
			for gun in get_node("Guns").get_children():
				if gun is smg_1:
					gun.queue_free()
		if gun_type == "sniper_rifle":
			for gun in get_node("Guns").get_children():
				if gun is sniper_rifle_1:
					gun.queue_free()
	elif gun_index == 1:
		if gun_type == "assault_rifle":
			for gun in get_node("Guns").get_children():
				if gun is assault_rifle_2:
					gun.queue_free()
		if gun_type == "explosive":
			for gun in get_node("Guns").get_children():
				if gun is explosive_2:
					gun.queue_free()
		if gun_type == "machine_gun":
			for gun in get_node("Guns").get_children():
				if gun is machine_gun_2:
					gun.queue_free()
		if gun_type == "pistol":
			for gun in get_node("Guns").get_children():
				if gun is pistol_2:
					gun.queue_free()
		if gun_type == "revolver":
			for gun in get_node("Guns").get_children():
				if gun is revolver_2:
					gun.queue_free()
		if gun_type == "shotgun":
			for gun in get_node("Guns").get_children():
				if gun is shotgun_2:
					gun.queue_free()
		if gun_type == "smg":
			for gun in get_node("Guns").get_children():
				if gun is smg_2:
					gun.queue_free()
		if gun_type == "sniper_rifle":
			for gun in get_node("Guns").get_children():
				if gun is sniper_rifle_2:
					gun.queue_free()

#Increase speed of each bullet by a certain percentage. Use "all" to apply effect to all guns
func add_bullet_speed(gun_type:String, gun_index:int, percent_increase:float) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				bullet_modifiers[gun_type][i]["bullet_speed_multiplier"] += (percent_increase / 100)
	else:
		bullet_modifiers[gun_type][gun_index]["bullet_speed_multiplier"] += (percent_increase / 100)

#Increase the damage of each shot by a certain percentage. Use "all" to apply effect to all guns
func add_damage(gun_type:String, gun_index:int, percent_increase:float) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				bullet_modifiers[gun_type][i]["bullet_damage_multiplier"] += (percent_increase / 100)
	else:
		bullet_modifiers[gun_type][gun_index]["bullet_damage_multiplier"] += (percent_increase / 100)

#Decrease the interval between each shot by a certain percentage. Use "all" to apply effect to all guns
func decrease_shoot_cooldown(gun_type:String, gun_index:int, percent_decrease:float) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				bullet_modifiers[gun_type][i]["shot_cooldown"] -= (percent_decrease / 100)
	else:
		bullet_modifiers[gun_type][gun_index]["shot_cooldown"] -= (percent_decrease / 100)

#Adds a special effect to the gun. Use "all" to apply effect to all guns
func add_gun_effect(gun_type:String, gun_index:int, effect:String, amount:int) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				bullet_modifiers[gun_type][i][effect] += amount
	else:
		bullet_modifiers[gun_type][gun_index][effect] += amount

#Adds a special effect to the bullet of the gun. Use "all" to apply effect to all guns.
func add_bullet_effect(gun_type:String, gun_index:int, effect:String, amount:int) -> void:
	if gun_type == "all":
		for gun in gun_types:
			for i in range(2):
				bullet_modifiers[gun_type][i][effect] += amount
	else:
		bullet_modifiers[gun_type][gun_index][effect] += amount
