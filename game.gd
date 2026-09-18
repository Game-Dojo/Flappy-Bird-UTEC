extends Node2D

@onready var score_points : RichTextLabel = $ScorePoints
@onready var game_over = $CanvasLayer/GameOverPanel

var game_score : int = 0

func _ready():
	game_over.visible = false

func add_score() -> void:
	game_score += 1
	score_points.text = "[wave amp=40 freq=2]" + str(game_score) + "[/wave]"

func _on_death_area_body_entered(body):
	if body is RigidBody2D and body.name == "Plane":
		get_tree().paused = true
		game_over.visible = true

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
