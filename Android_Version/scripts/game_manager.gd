extends Node2D
@export var enemy_scene: PackedScene
var is_game_active: bool = true
var score: float = 0.0
var last_score_milestone: int = 0
var base_spawn_time: float = 1.0
var min_spawn_time: float = 0.25
var difficulty_multiplier: float = 0.02
@onready var score_label: Label = $UI/ScoreLabel
@onready var game_over_panel: Panel = $UI/GameOverPanel
func _ready() -> void:
	is_game_active = true
	score = 0.0
	last_score_milestone = 0
	score_label.text = "SCORE: 0"
	game_over_panel.hide()
	$Timer.wait_time = base_spawn_time
	$Timer.start()
func _process(delta: float) -> void:
	if is_game_active:
		score += delta * 0.25
		score_label.text = "SCORE: " + str(int(score))
		check_score_milestone()
	if not is_game_active and Input.is_key_pressed(KEY_R):
		restart_game()
func _on_timer_timeout() -> void:
	if not is_game_active:
		return
	var enemy_instance = enemy_scene.instantiate()
	var random_x = randf_range(50, 1230)
	enemy_instance.position = Vector2(random_x, -50)
	add_child(enemy_instance)
	if $Timer.wait_time > min_spawn_time:
		$Timer.wait_time = max(min_spawn_time, $Timer.wait_time - difficulty_multiplier)
func add_score(amount: int) -> void:
	if is_game_active:
		score += amount
		score_label.text = "SCORE: " + str(int(score))
		check_score_milestone()
func check_score_milestone() -> void:
	var current_milestone = int(score) / 100
	if current_milestone > last_score_milestone:
		if has_node("ScoreSound"):
			$ScoreSound.play()
		last_score_milestone = current_milestone
func game_over() -> void:
	is_game_active = false
	$Timer.stop()
	MusicController.stop()
	if has_node("GameOverSound"):
		$GameOverSound.play()
	game_over_panel.show()
	$UI/GameOverPanel/GameOverText.text = "GAME OVER\n\nSCORE: " + str(int(score))
func restart_game() -> void:
	MusicController.play()
	get_tree().reload_current_scene()
func _on_restart_button_pressed() -> void:
	restart_game()
