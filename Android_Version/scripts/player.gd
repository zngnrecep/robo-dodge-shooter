extends CharacterBody2D
@export var speed: float = 500.0
@export var laser_scene: PackedScene = preload("res://scenes/laser.tscn")
var joystick_move_vector: Vector2 = Vector2.ZERO
var joystick_fire_vector: Vector2 = Vector2.ZERO
var fire_rate: float = 0.15
var fire_timer: float = 0.0
func _ready() -> void:
	var ship_path = "res://assets/sprites/player/" + Global.selected_ship_name
	$Sprite2D.texture = load(ship_path)
func _physics_process(delta: float) -> void:
	var keyboard_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if keyboard_vector != Vector2.ZERO:
		velocity = keyboard_vector * speed
	else:
		velocity = joystick_move_vector * speed
	move_and_slide()
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	fire_timer += delta
	if joystick_fire_vector.length() > 0.2:
		if fire_timer >= fire_rate:
			shoot()
			fire_timer = 0.0
	elif Input.is_action_pressed("ui_accept"):
		if fire_timer >= fire_rate:
			shoot()
			fire_timer = 0.0
func shoot() -> void:
	var laser_instance = laser_scene.instantiate()
	laser_instance.position = position + Vector2(0, -30)
	get_node("/root/Main").add_child(laser_instance)
	if has_node("ShootSound"):
		$ShootSound.play()
