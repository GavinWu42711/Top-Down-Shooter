extends Node2D

class_name Upgrade

var gun_type:String
var gun_index:int
var upgrades_to_gun_stats:Dictionary = {}
var upgrades_to_bullet_stats:Dictionary = {}
var upgrades_to_bullet_temp_effects:Dictionary = {}
var upgrades_to_bullet_perm_effects:Dictionary = {}
var player_guns_handler:Guns_handler

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func apply_upgrades() -> void:
	for key in upgrades_to_bullet_stats.keys():
		player_guns_handler.upgrade_bullet_stat.emit()
		
	player_guns_handler.upgrade_gun_stat.emit()
	player_guns_handler.upgrade_bullet_temp_effect.emit()
	player_guns_handler.upgrade_bullet_perm_effect.emit()
