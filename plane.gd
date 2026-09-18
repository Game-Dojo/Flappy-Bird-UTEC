extends RigidBody2D

@onready var puff_animated = $PuffAnimated
@onready var puff_timer = $PuffTimer

const JUMP_FORCE = 400
var can_jump := false

func _ready():
	puff_animated.visible = false
	puff_timer.connect("timeout", _on_puff_timer_timeout)

func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		can_jump = true
		puff_animated.visible = true
		puff_timer.start()

func _physics_process(_delta):
	if can_jump:
		linear_velocity = Vector2.ZERO
		linear_velocity.y = -JUMP_FORCE
		can_jump = false

func _on_puff_timer_timeout():
	puff_animated.visible = false
