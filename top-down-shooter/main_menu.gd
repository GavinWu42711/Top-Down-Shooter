extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_settings_button_button_down() -> void:
	Global.current_scene = "settings"
	get_tree().change_scene_to_file("res://settings.tscn")

func _on_credits_button_button_down() -> void:
	Global.current_scene = "credits"
	get_tree().change_scene_to_file("res://credits.tscn")

func _on_tutorial_button_button_down() -> void:
	Global.current_scene = "tutorial"
	get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_play_button_button_down() -> void:
	Global.current_scene = "home"
	get_tree().change_scene_to_file("res://Scenes/Map Scenes/Home.tscn")
