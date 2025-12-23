extends Node2D

class_name assault_rifle_1

@onready var bullet_scene:PackedScene = preload("res://Scenes/Bullets/assault_rifle_bullet_1.tscn")
var can_shoot:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
