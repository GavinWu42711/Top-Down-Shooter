extends TileMapLayer

@onready var trapdoor:Area2D = $BattlefieldDoor

var transitioning:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not transitioning:
		if trapdoor.has_overlapping_bodies():
			for player in trapdoor.get_overlapping_bodies():
				if player is Player:
					transition_to_battlefield()
	
func transition_to_battlefield() -> void:
	transitioning = true
	print("test")
	
