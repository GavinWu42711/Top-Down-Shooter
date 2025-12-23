extends Node2D

class_name Gun

var can_shoot:bool = true
var unequipping_gun:bool = false
var	shooting:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func remove() -> void:
	unequipping_gun = true
	if shooting:
		pass
	else:
		self.queue_free()

func check_status() -> void:
	if unequipping_gun:
		self.remove()
