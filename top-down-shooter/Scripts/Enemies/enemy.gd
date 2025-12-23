class_name Enemy extends CharacterBody2D

var max_health:float = 1
var min_health:float = 0
var speed:float = 50
var current_health:float = max_health
var attack_damage:float = 1
var attack_hitbox:Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#Setting up enemy collisions
	for i in range(1,9):
		self.set_collision_layer_value(i,false)
		self.set_collision_mask_value(i,false)
	self.set_collision_layer_value(1, true)
	self.set_collision_layer_value(9,true)
	self.set_collision_mask_value(1,true)
	self.set_collision_mask_value(9,true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_alive:
		handle_attack()
		handle_movement()
		handle_animation()
		move_and_slide()

#Animations
func handle_animation() -> void:
	pass

#Moving to player
func handle_movement() -> void:
	self.look_at(Global.player_position)
	self.velocity = Vector2.RIGHT.rotated(rotation) * speed 

#Attacking player
func handle_attack() -> void:
	var player:CharacterBody2D = check_player_hitbox()
	if player:
		player.take_damage(attack_damage)

#Taking damge from player
func take_damage(damage:float = 1, knockback:float = 1) -> void:
	current_health -= damage
	take_knockback(knockback)
	if current_health <= min_health:
		current_health = min_health
		die()

#dying
func die() -> void:
	self.queue_free()

func check_player_hitbox() -> CharacterBody2D:
	if attack_hitbox.has_overlapping_bodies():
		var players = attack_hitbox.get_overlapping_bodies()
		for player in players:
			if player is Player:
				return player
		return null
	else:
		return null

func take_knockback(knockback_amount:float) -> void:
	var motion:Vector2 = Vector2.RIGHT.rotated(rotation) * knockback_amount
	position -= motion
