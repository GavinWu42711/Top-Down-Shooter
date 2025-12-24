extends Node2D

var enemy_scenes:Array = [preload("res://Scenes/Enemy Scenes/Skeleton.tscn"),preload("res://Scenes/Enemy Scenes/Skull.tscn"),preload("res://Scenes/Enemy Scenes/Vampire.tscn")]
@onready var enemy_spawn_positions:Array = [$LeftDoor.global_position,$RightDoor.global_position,$TopDoor.global_position,$BottomDoor.global_position]

var spawning_enemies:bool = false

var check_enemy_count:bool = false
var enemies_alive:int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if check_enemy_count:
		enemies_alive = self.get_child_count()
		if enemies_alive == 0:
			check_enemy_count = false
			Global.all_enemies_dead.emit()
	
func random_spawn(waves:int, enemies_per_wave:int, wave_cooldown:float) -> void:
	spawning_enemies = true
	check_enemy_count = true
	for wave in range(waves):
		Global.wave_started.emit()
		for enemy in range(enemies_per_wave):
			spawn(enemy_scenes[randi_range(0,2)], enemy_spawn_positions[randi_range(0,3)])
		await get_tree().create_timer(wave_cooldown).timeout
	spawning_enemies = false
	Global.spawner_finished.emit()
	
func spawn(enemy_scene, enemy_spawn_position):
	var enemy:Enemy = enemy_scene.instantiate()
	enemy.global_position = enemy_spawn_position
	self.add_child(enemy)
