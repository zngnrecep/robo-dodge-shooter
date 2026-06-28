extends CharacterBody2D
@export var speed: float = 500.0
@export var laser_scene: PackedScene = preload("res://scenes/laser.tscn")
func _ready() -> void:
	var ship_path = "res://assets/sprites/player/" + Global.selected_ship_name
	$Sprite2D.texture = load(ship_path)
func _physics_process(_delta: float) -> void:
	var input_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_vector * speed
	move_and_slide()
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
func shoot() -> void:
	var laser_instance = laser_scene.instantiate()
	laser_instance.position = position + Vector2(0, -30)
	get_node("/root/Main").add_child(laser_instance)
	if has_node("ShootSound"):
		$ShootSound.play()
