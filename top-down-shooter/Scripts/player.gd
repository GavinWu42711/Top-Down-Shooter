extends CharacterBody2D

var gun_equipped:Dictionary = {
	"assault_rifle":[false,false],
	"explosive":[false,false],
	"machine_gun":[false,false],
	"pistol":[false,false],
	"revolver":[false,false],
	"shotgun":[false,false],
	"smg":[false,false],
	"sniper_rifle":[false,false]
}

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

const SPEED = 150.0

var attack_damage:float = 10.0
#1 indicates looking right; -1 indicated looking left
var direction:int = 1

var running:bool = false
var attacking:bool = false
var dying:bool = false
var reviving:bool = false
var taking_damage:bool = false
var walking:bool = false

func _ready() -> void:
	equip_gun("assault_rifle",0)

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	
	handle_movement(delta)
	handle_animation()
	handle_attack()
	
	move_and_slide()

func handle_movement(delta:float) -> void:
	var right:bool = Input.is_action_pressed("right")
	var left:bool = Input.is_action_pressed("left")
	var up:bool = Input.is_action_pressed("up")
	var down:bool = Input.is_action_pressed("down")
	
	#Check for input to move
	if (right or left or up or down):
			
		if right:
			direction = 1
			velocity.x = direction * SPEED
		elif left:
			direction = -1
			velocity.x = direction * SPEED
		else:
			velocity.x = 0
			
		if up:
			velocity.y = -SPEED
		elif down:
			velocity.y = SPEED
		else:
			velocity.y = 0
	else:
		running = false
		walking = false
		velocity.y = 0
		velocity.x = 0
	
func handle_animation() -> void:
	"""
	
	to be added in
	
	if dying:
		animated_sprite.play("death")
	elif reviving:
		animated_sprite.play("revive")
	elif taking_damage:
		animated_sprite.play("hurt")
	elif attacking:
		animated_sprite.play("attack")
	elif flying:
		animated_sprite.play("fly")
	elif started_flying:
		animated_sprite.play("transition_to_fly")
	else:
		animated_sprite.play("idle")
	"""
	
	if Global.cursor_position != null:
		self.look_at(Global.cursor_position)
	
func take_damage(damage_amount: int) -> void:
	pass

func handle_attack() -> void:
	if Input.is_action_pressed("shoot"):
		for gun in get_node("Guns").get_children():
			gun.base_shot(Global.cursor_position)

func equip_gun(gun_type:String, gun_index:int) -> void:
	gun_equipped[gun_type][gun_index] = true
	var gun = gun_scenes[gun_type][gun_index].instantiate()
	get_node("Guns").add_child(gun)
	
	
func un_equip_gun(gun_type:String, gun_index:int) -> void:
	gun_equipped[gun_type][gun_index] = false
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
	
