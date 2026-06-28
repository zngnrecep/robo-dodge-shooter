extends Control
func _ready() -> void:
	var ship_buttons = ["Ship1", "Ship2", "Ship3", "Ship4", "Ship5"]
	for button_name in ship_buttons:
		var button = get_node(button_name)
		if button:
			button.pivot_offset = button.size / 2
	update_selection_visuals("Ship1")
func _on_ship_1_pressed() -> void:
	Global.selected_ship_name = "player01.png"
	update_selection_visuals("Ship1")
func _on_ship_2_pressed() -> void:
	Global.selected_ship_name = "player02.png"
	update_selection_visuals("Ship2")
func _on_ship_3_pressed() -> void:
	Global.selected_ship_name = "player03.png"
	update_selection_visuals("Ship3")
func _on_ship_4_pressed() -> void:
	Global.selected_ship_name = "player04.png"
	update_selection_visuals("Ship4")
func _on_ship_5_pressed() -> void:
	Global.selected_ship_name = "player05.png"
	update_selection_visuals("Ship5")
func update_selection_visuals(selected_button_name: String) -> void:
	var ship_buttons = ["Ship1", "Ship2", "Ship3", "Ship4", "Ship5"]
	for button_name in ship_buttons:
		var button = get_node(button_name)
		if button:
			if button_name == selected_button_name:
				button.modulate = Color(1, 1, 1, 1)
				button.scale = Vector2(1.1, 1.1)
			else:
				button.modulate = Color(0.4, 0.4, 0.4, 0.7)
				button.scale = Vector2(1.0, 1.0)
func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
