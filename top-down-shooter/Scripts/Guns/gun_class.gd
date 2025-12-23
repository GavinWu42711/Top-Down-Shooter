extends Node2D

class_name Gun

var can_shoot:bool = true
var unequipping_gun:bool = false
var	shooting:bool = false

signal just_finished_shooting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.just_finished_shooting.connect(remove)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if unequipping_gun:
		can_shoot = false

func remove() -> void:
	unequipping_gun = true
	if shooting == true:
		pass
	else:
		self.queue_free()
