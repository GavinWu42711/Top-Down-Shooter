extends CharacterBody2D


var bullet_speed:float = 1
var bullet_damage:float = 1
var bullet_size:float = 1
var bullet_type:String
var bullet_start_point:Vector2
var bullet_end_point:Vector2
var bullet_perm_effects:Dictionary = {
	"piercing":0,	
}
var bullet_temp_effects:Dictionary = {
	"splitting":0,
}


func _physics_process(delta: float) -> void:	

	move_and_slide()

func handle_attack() -> void:
	pass

func handle_animation()-> void:
	pass
