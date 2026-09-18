extends StaticBody2D

const LEFT_SCREEN_LIMIT := -80
const SPAWN_SCREEN_RIGHT := 1000

@export var speed: float = 200.0
@onready var flappy = $"../.."

# Esto procesa las fisicas del juego una vez por frame
func _physics_process(delta):
	if position.x < LEFT_SCREEN_LIMIT:
		position.x = SPAWN_SCREEN_RIGHT
		position.y += randf_range(-10,10)
	
	position.x -= speed * delta

# Al ingresar un cuerpo al Area2D
func _on_score_area_body_entered(body:Node2D) -> void:
	if body is RigidBody2D and body.name == "Plane":
		flappy.add_score()
