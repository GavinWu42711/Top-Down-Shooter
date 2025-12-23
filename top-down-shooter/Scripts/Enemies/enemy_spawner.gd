extends Node2D

var enemy_scenes:Array = [preload("res://Scenes/Enemy Scenes/Skeleton.tscn"),preload("res://Scenes/Enemy Scenes/Skull.tscn"),preload("res://Scenes/Enemy Scenes/Vampire.tscn")]
@onready var enemy_spawn_positions:Array = [$LeftDoor.global_position,$RightDoor.global_position,$TopDoor.global_position,$BottomDoor.global_position]

var burst_amount:int = 1
var enemy_per_burst:int = 1
var spawn_cooldown:float = 2
var burst_cooldown:int = 0
var can_spawn:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.player_alive:
		spawn_handler()
	
func spawn_handler() -> void:
	if can_spawn:
		can_spawn = false
		Global.wave += 1
		for burst in range(burst_amount):
			for spawn_amount in range(enemy_per_burst):
				spawn(enemy_scenes[randi_range(0,2)], enemy_spawn_positions[randi_range(0,3)])
			await get_tree().create_timer(burst_cooldown).timeout
		await get_tree().create_timer(spawn_cooldown).timeout
		can_spawn = true
	
func spawn(enemy_scene, enemy_spawn_position):
	var enemy:Enemy = enemy_scene.instantiate()
	enemy.global_position = enemy_spawn_position
	self.add_child(enemy)
