extends CharacterBody2D



@onready var player: CharacterBody2D = $"../player"


func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 30
	move_and_slide()
	
