extends CharacterBody2D


var bullet_speed:float = 1
var bullet_damage:float = 1
var bullet_size:float = 1
var bullet_lifespan:float = 2
var timer_started:bool = false
var bullet_type:String
var bullet_start_point:Vector2
var bullet_end_point:Vector2
var bullet_perm_effects:Dictionary = {
	"piercing":0,	
}
var bullet_temp_effects:Dictionary = {
	"splitting":0,
}

func _ready() -> void:
	#var delta_x:float = bullet_end_point.x - bullet_start_point.x
	#var delta_y:float = bullet_end_point.y - bullet_start_point.y
	self.global_position = bullet_start_point
	self.global_rotation_degrees = 0
	var velocity_angle = self.get_angle_to(bullet_end_point)
	self.look_at(bullet_end_point)
	self.velocity.x = 0
	self.velocity.y = 0
	self.velocity.x = cos(velocity_angle) * bullet_speed
	self.velocity.y = sin(velocity_angle) * bullet_speed
		

func _physics_process(delta: float) -> void:	
	
	handle_attack()
	handle_animation()
	
	move_and_slide()
	
	if not timer_started:
		timer_started = true
		timer()

func handle_attack() -> void:
	pass

func handle_animation()-> void:
	pass

func timer() -> void:
	await get_tree().create_timer(bullet_lifespan).timeout
	self.queue_free()
