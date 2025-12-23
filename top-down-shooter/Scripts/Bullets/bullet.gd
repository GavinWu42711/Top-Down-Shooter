extends CharacterBody2D

@onready var bullet_scenes:Dictionary = {
	"assault_rifle":[preload("res://Scenes/Bullets/assault_rifle_bullet_1.tscn"),preload("res://Scenes/Bullets/assault_rifle_bullet_2.tscn")],
	"explosive":[preload("res://Scenes/Bullets/explosive_bullet_1.tscn"),preload("res://Scenes/Bullets/explosive_bullet_2.tscn")],
	"machine_gun":[preload("res://Scenes/Bullets/machine_gun_bullet_1.tscn"),preload("res://Scenes/Bullets/machine_gun_bullet_2.tscn")],
	"pistol":[preload("res://Scenes/Bullets/pistol_bullet_1.tscn"),preload("res://Scenes/Bullets/pistol_bullet_2.tscn")],
	"revolver":[preload("res://Scenes/Bullets/revolver_bullet_1.tscn"),preload("res://Scenes/Bullets/revolver_bullet_2.tscn")],
	"shotgun":[preload("res://Scenes/Bullets/shotgun_bullet_1.tscn"),preload("res://Scenes/Bullets/shotgun_bullet_2.tscn")],
	"smg":[preload("res://Scenes/Bullets/smg_bullet_1.tscn"),preload("res://Scenes/Bullets/smg_bullet_2.tscn")],
	"sniper_rifle":[preload("res://Scenes/Bullets/sniper_rifle_bullet_1.tscn"),preload("res://Scenes/Bullets/sniper_rifle_bullet_2.tscn")]
	}

var bullet_hitbox:Area2D
var bullet_sprite:Sprite2D

var bullet_speed:float = 1
var bullet_damage:float = 1
var bullet_size:float = 1
var bullet_lifespan:float = 2
var bullet_knockback:float = 5
var timer_started:bool = false
var bullet_type:String
var bullet_index:int
var bullet_start_point:Vector2
var bullet_end_point:Vector2
var bullet_perm_effects:Dictionary = {
	"piercing":0,	
}
var bullet_temp_effects:Dictionary = {
	"splitting":0,
}

func _ready() -> void:
	spawn_sprite_and_hitbox(bullet_type,bullet_index)
	self.global_position = bullet_start_point
	self.global_rotation_degrees = 0
	if bullet_type == "shotgun":
		self.look_at(bullet_end_point)
		var randomized_direction:Vector2 = Vector2.RIGHT.rotated(deg_to_rad(rotation_degrees + randi_range(-20,20))) * bullet_speed
		self.velocity = randomized_direction
	else:
		var velocity_angle = self.get_angle_to(bullet_end_point)
		self.look_at(bullet_end_point)
		self.velocity.x = 0
		self.velocity.y = 0
		self.velocity.x = cos(velocity_angle) * bullet_speed
		self.velocity.y = sin(velocity_angle) * bullet_speed
		self.scale.x *= bullet_size
		self.scale.y *= bullet_size
	
		

func _physics_process(delta: float) -> void:	
	
	handle_attack()
	handle_animation()
	
	move_and_slide()
	
	if not timer_started:
		timer_started = true
		timer()

func handle_attack() -> void:
	var enemy_hit:CharacterBody2D = check_enemy_hitbox()
	var terrain_hit:TileMapLayer = check_terrain_hitbox()
	if enemy_hit:
		enemy_hit.take_damage(bullet_damage, bullet_knockback)
		on_hit_enemy_effect()
	if terrain_hit:
		on_hit_object_effect()

	
#Effect to happen when it hits an enemy
func on_hit_enemy_effect() -> void:
	self.queue_free()
	
#Effect to happen when it hits an object
func on_hit_object_effect() -> void:
	self.queue_free()

func handle_animation()-> void:
	pass

func timer() -> void:
	await get_tree().create_timer(bullet_lifespan).timeout
	self.queue_free()

func spawn_sprite_and_hitbox(bullet_type:String, bullet_index:int) -> void:
	var bullet:Node2D = bullet_scenes[bullet_type][bullet_index].instantiate()
	bullet_hitbox = bullet.get_node("Area2D")
	bullet_sprite = bullet.get_node("Sprite2D")
	get_node("BulletHitbox").add_child(bullet)
	
func check_enemy_hitbox() -> CharacterBody2D:
	if bullet_hitbox.has_overlapping_bodies():
		var enemies = bullet_hitbox.get_overlapping_bodies()
		for enemy in enemies:
			if enemy is Enemy:
				return enemy
			#elif enemy is ...:
		return null
	else:
		return null
	
func check_terrain_hitbox() -> TileMapLayer:
	if bullet_hitbox.has_overlapping_bodies():
		var objects = bullet_hitbox.get_overlapping_bodies()
		for object in objects:
			if object is TileMapLayer:
				return object
		return null
	else:
		return null
