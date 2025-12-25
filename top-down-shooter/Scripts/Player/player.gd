extends CharacterBody2D

class_name Player

const SPEED = 150.0

#1 indicates looking right; -1 indicated looking left
var direction:int = 1

var running:bool = false
var attacking:bool = false
var dying:bool = false
var reviving:bool = false
var taking_damage:bool = false
var walking:bool = false

var max_health:float = 9999999
var min_health:float = 0
var current_health:float = max_health

@onready var point_of_rotation:Node2D = $PointOfRotation

@onready var guns = $PointOfRotation/Guns

@onready var camera:Camera2D = $Camera2D

var idk = [
	["assault_rifle",0],
	["assault_rifle",1],
	["explosive",0],
	["explosive",1],
	["machine_gun",0],
	["machine_gun",1],
	["pistol",0],
	["pistol",1],
	["revolver",0],
	["revolver",1],
	["shotgun",0],
	["shotgun",1],
	["smg",0],
	["smg",1],
	["sniper_rifle",0],
	["sniper_rifle",1],
]

var gun_equipped = 0

func _ready() -> void:
	guns.equip_gun(idk[gun_equipped][0],idk[gun_equipped][1])
	
	var camera_limits:Node2D = get_node("/root/Node2D").get_node("CameraLimits")
	
	if camera_limits:
		camera.limit_enabled = true
		camera.limit_left = camera_limits.get_node("LeftLimit").global_position.x
		camera.limit_right = camera_limits.get_node("RightLimit").global_position.x
		camera.limit_bottom = camera_limits.get_node("BottomLimit").global_position.y
		camera.limit_top = camera_limits.get_node("TopLimit").global_position.y
		print("test")
	else:
		camera.limit_enabled = false

func _physics_process(delta: float) -> void:
	
	if Global.player_alive:
		Global.player_position = global_position
		
		#Player movement
		handle_movement(delta)
		
		#Player animation
		handle_animation()
		
		#Player attack
		handle_attack()
		
		move_and_slide()
		
		if Input.is_action_just_pressed("interact"):
			guns.unequip_gun(idk[gun_equipped][0],idk[gun_equipped][1])
			gun_equipped = (gun_equipped + 1) % 16
			guns.equip_gun(idk[gun_equipped][0],idk[gun_equipped][1])
			
		

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
		point_of_rotation.look_at(Global.cursor_position)
	
func take_damage(damage_amount: int) -> void:
	current_health  -= damage_amount
	if current_health <= min_health:
		current_health = min_health
		death()

func handle_attack() -> void:
	if Input.is_action_pressed("shoot"):
		guns.shoot()

func death() -> void:
	Global.player_alive = false
	pass

	
