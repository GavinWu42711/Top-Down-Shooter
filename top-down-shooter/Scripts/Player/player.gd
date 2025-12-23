extends CharacterBody2D

const SPEED = 150.0

#1 indicates looking right; -1 indicated looking left
var direction:int = 1

var running:bool = false
var attacking:bool = false
var dying:bool = false
var reviving:bool = false
var taking_damage:bool = false
var walking:bool = false

@onready var guns = $PointOfRotation/Guns

func _ready() -> void:
	guns.equip_gun("assault_rifle",0)

func _physics_process(delta: float) -> void:
	
	#Player movement
	handle_movement(delta)
	
	#Player animation
	handle_animation()
	
	#Player attack
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
		guns.shoot()

	
