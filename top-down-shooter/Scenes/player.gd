extends CharacterBody2D


const SPEED = 150.0

var attack_damage:float = 10.0
#1 indicates looking right; -1 indicated looking left
var direction:int = 1

var flying:bool = false
var attacking:bool = false
var dying:bool = false
var reviving:bool = false
var taking_damage:bool = false
var started_flying:bool = false

@onready var animated_sprite:AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	handle_movement(delta)
	handle_animation()
	
	move_and_slide()

func handle_movement(delta:float) -> void:
	
	var right:bool = Input.is_action_pressed("right")
	var left:bool = Input.is_action_pressed("left")
	var up:bool = Input.is_action_pressed("up")
	var down:bool = Input.is_action_pressed("down")
	
	print("right:" + str(right))
	print("left:" + str(left))
	print("up:" + str(up))
	print("down:" + str(down))

	
	#Check for input to move
	if (right or left or up or down):
		if not flying:
			started_flying = true
			transition_to_fly()
			
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
		flying = false
		started_flying = false
		velocity.y = 0
		velocity.x = 0
	
func handle_animation() -> void:
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
	
	if direction == 1:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	
func take_damage(damage_amount: int) -> void:
	pass
	
func transition_to_fly() -> void:
	#takes half a second to go from idle to fly
	await get_tree().create_timer(0.5).timeout
	flying = true
	started_flying = false
