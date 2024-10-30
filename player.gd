extends CharacterBody2D

signal health_depleted
var health = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right",
										"move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
		
	const DAMAGE_RATE = 500.0
	var overlapping_mob = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mob.size() > 0:
		health -= DAMAGE_RATE * overlapping_mob.size() * delta
		if health <= 0.0:
			health_depleted.emit()
	 
