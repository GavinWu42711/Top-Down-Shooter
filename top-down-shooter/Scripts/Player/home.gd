extends Node2D

@onready var trapdoor:Area2D = $Tile_map/Doors/BattlefieldDoor

var transitioning:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not transitioning:
		if trapdoor.has_overlapping_bodies():
			for player in trapdoor.get_overlapping_bodies():
				if player is Player:
					transition_to_battlefield()
	
func transition_to_battlefield() -> void:
	transitioning = true
	Global.current_scene = "battlefield"
	get_tree().change_scene_to_file("res://Scenes/Map Scenes/Battlefield.tscn")
