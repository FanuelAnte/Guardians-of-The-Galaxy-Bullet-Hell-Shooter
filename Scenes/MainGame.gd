extends Node2D

var enemy_scene = preload("res://Scenes/Nova.tscn")
onready var position_2d = $Position2D
onready var parallax_background = $ParallaxBackground

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _process(delta):
	parallax_background.scroll_offset.y += 100 * delta

func _on_Timer_timeout():
	randomize()
	position_2d.global_position.x = rng.randi_range(64, 300) 
	add_enemy()


func add_enemy():
	var enemy = enemy_scene.instance()
	self.add_child(enemy)
	enemy.global_position = position_2d.global_position
	enemy.dir = 1
