extends Upgrade

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gun_type = "all"
	gun_index = 0
	upgrades_to_gun_stats = {"burst_amount":1}
	upgrades_to_bullet_stats = {}
	upgrades_to_bullet_temp_effects = {}
	upgrades_to_bullet_perm_effects = {}
	player_guns_handler = player.guns
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_button_down() -> void:
	apply_upgrades()
