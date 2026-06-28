extends Area2D
@export var speed: float = 700.0
func _process(delta: float) -> void:
	position.y -= speed * delta
	if position.y < -50:
		queue_free()
func _on_area_entered(area: Area2D) -> void:
	if "Enemy" in area.name or area.is_in_group("mobs"):
		var game_manager = get_node("/root/Main")
		if game_manager and game_manager.has_method("add_score"):
			game_manager.add_score(10)
		area.queue_free()
		if has_node("ExplosionSound"):
			$ExplosionSound.play()
		if has_node("Sprite2D"):
			$Sprite2D.hide()
		set_deferred("monitoring", false)
		set_deferred("monitorable", false)
		if has_node("ExplosionSound"):
			await $ExplosionSound.finished
		queue_free()
