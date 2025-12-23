extends Enemy

class_name Skull

func _ready() -> void:
	attack_hitbox = $Area2D
	max_health = 100
	min_health = 0
	speed = 50
	attack_damage = 10
	current_health = 100
	
func _physics_process(delta: float) -> void:
	
	move_and_slide()
	
