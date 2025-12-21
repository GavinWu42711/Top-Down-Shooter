extends Node2D

class_name assault_rifle_1

@onready var bullet_scene:PackedScene = preload("res://Scenes/Bullets/assault_rifle_bullet_1.tscn")
var burst_delay:float = 0.2
var shoot_delay:float = 0.5
var attack_damage: float = 10
var bullet_speed:float = 300
var bullet_timeout:float = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Shots including innate weapon traits and other modifiers
func shoot(bullet_direction:Vector2, attack_multiplier:float = 1,bullet_speed_multiplier:float = 1,shoot_delay_multiplier:float = 1, bullet_timeout_multiplier:float = 1, burst_delay_multiplier:float = 1):
	pass

#Single shot with weapon without modifiers
func base_shot(direction:Vector2, attack_damage:float = attack_damage,bullet_speed:float = bullet_speed, bullet_timeout:float = bullet_timeout):
	var bullet:CharacterBody2D = bullet_scene.instantiate()
	bullet.damage = attack_damage
	bullet.speed = bullet_speed
	bullet.timeout = bullet_timeout
	bullet.global_position = self.global_position
	bullet.global_rotation = self.global_rotation
	bullet.look_at(direction)
	
	var x_weight = abs(direction.x)
	var y_weight = abs(direction.y)
	
	var h_direction:int = 1
	var v_direction:int = 1
	
	if direction.x > self.global_position.x:
		h_direction = 1
	elif direction.x < self.global_position.x:
		h_direction = -1
		
	if direction.y > self.global_position.y:
		v_direction = 1
	elif direction.y < self.global_position.y:
		v_direction = -1
		
	bullet.velocity.x = (x_weight/(x_weight + y_weight)) * bullet_speed * h_direction
	bullet.velocity.y = (y_weight/(x_weight + y_weight)) * bullet_speed * v_direction
	get_node("/root").add_child(bullet)
