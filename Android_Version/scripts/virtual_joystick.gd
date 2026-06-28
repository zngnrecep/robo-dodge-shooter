extends Control
@onready var base: TextureRect = $Base
@onready var stick: TextureRect = $Base/Stick
@onready var player: CharacterBody2D = $"/root/Main/Player"
var max_distance: float = 75.0
var touch_id: int = -1
var is_right_joystick: bool = false
func _ready() -> void:
	if name == "RightJoystick":
		is_right_joystick = true
	stick.pivot_offset = stick.size / 2
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and touch_id == -1:
			if base.get_global_rect().has_point(event.position):
				touch_id = event.index
				update_joystick(event.position)
		elif not event.pressed and event.index == touch_id:
			touch_id = -1
			stick.position = (base.size / 2) - (stick.size / 2)
			if is_instance_valid(player):
				if is_right_joystick:
					player.joystick_fire_vector = Vector2.ZERO
				else:
					player.joystick_move_vector = Vector2.ZERO
	elif event is InputEventScreenDrag and event.index == touch_id:
		update_joystick(event.position)
func update_joystick(touch_pos: Vector2) -> void:
	var base_center = base.global_position + (base.size / 2)
	var direction = touch_pos - base_center
	if direction.length() > max_distance:
		direction = direction.normalized() * max_distance
	stick.global_position = base_center + direction - (stick.size / 2)
	if is_instance_valid(player):
		if is_right_joystick:
			player.joystick_fire_vector = direction
		else:
			player.joystick_move_vector = direction.normalized()
