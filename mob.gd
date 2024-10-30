extends CharacterBody2D


const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
const SPEED = 100
var health := 5
@onready var player: CharacterBody2D = $"../player"
@onready var slime: Node2D = $Slime


func _ready() -> void:
	slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_collide(delta*velocity)

func take_damage():
	health -= 1
	slime.play_hurt()
	if health <= 0 :
		queue_free()
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
