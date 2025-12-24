extends Node

var cursor_position:Vector2
var player_position:Vector2

var wave:int = 0
var player_alive:bool = true
var current_scene:String = "main_menu"
var enemy_spawner_finished:bool = false

signal wave_started
signal spawner_finished
signal all_enemies_dead


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wave_started.connect(increase_wave)
	spawner_finished.connect(finished_spawning)
	all_enemies_dead.connect(full_wave_finished)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func increase_wave() -> void:
	wave += 1
	
func finished_spawning() -> void:
	enemy_spawner_finished = true
	
func full_wave_finished() -> void:
	pass
