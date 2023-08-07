extends Node2D

var enemy_scene = preload("res://Scenes/Nova.tscn")
onready var background = $Background
onready var enemy_swaner = $EnemySwaner

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _process(delta):
	background.scroll_offset.y += 900 * delta

func add_enemy():
	var enemy = enemy_scene.instance()
	self.add_child(enemy)
	enemy.global_position = enemy_swaner.global_position
	enemy.dir = 1

func _on_SpanwTimer_timeout():
	randomize()
	enemy_swaner.global_position.x = rng.randi_range(64, 300) 
	add_enemy()
