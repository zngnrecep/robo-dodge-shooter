extends Area2D
@export var speed: float = 350.0
var enemy_sprites = [
	"res://assets/sprites/enemies/enemy_purple01.png",
	"res://assets/sprites/enemies/enemy_purple02.png",
	"res://assets/sprites/enemies/enemy_purple03.png",
	"res://assets/sprites/enemies/enemy_purple04.png",
	"res://assets/sprites/enemies/enemy_purple05.png",
	"res://assets/sprites/enemies/enemy_red01.png",
	"res://assets/sprites/enemies/enemy_red02.png",
	"res://assets/sprites/enemies/enemy_red03.png",
	"res://assets/sprites/enemies/enemy_red04.png",
	"res://assets/sprites/enemies/enemy_red05.png",
	"res://assets/sprites/enemies/enemy_yellow01.png",
	"res://assets/sprites/enemies/enemy_yellow02.png",
	"res://assets/sprites/enemies/enemy_yellow03.png",
	"res://assets/sprites/enemies/enemy_yellow04.png",
	"res://assets/sprites/enemies/enemy_yellow05.png"
]
func _ready() -> void:
	var random_sprite_path = enemy_sprites[randi() % enemy_sprites.size()]
	$Sprite2D.texture = load(random_sprite_path)
func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y > 800:
		queue_free()
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var main_node = get_node("/root/Main")
		if main_node:
			main_node.game_over()
		body.queue_free()
		queue_free()
