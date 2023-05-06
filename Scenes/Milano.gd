extends KinematicBody2D

var bullet_scene = preload("res://Scenes/Bullet.tscn")

var health = 10

onready var position_2d = $Position2D
onready var position_2_d_2 = $Position2D2

var speed = Vector2(100, 100)
var vel = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	if health <= 0:
		self.queue_free()
	if Input.is_action_pressed("ui_left"):
		vel.x = speed.x * -1
	elif Input.is_action_pressed("ui_right"):
		vel.x = speed.x * 1
	else:
		vel.x = 0
	
	if Input.is_action_pressed("ui_up"):
		vel.y = speed.y * -1
	elif Input.is_action_pressed("ui_down"):
		vel.y = speed.y * 1
	else:
		vel.y = 0
	
	if Input.is_action_just_pressed("ui_select"):
		fire()
	
	vel = move_and_slide(vel)

func fire():
	var bullet1 = bullet_scene.instance()
	var bullet2 = bullet_scene.instance()
	
	get_parent().add_child(bullet1)
	get_parent().add_child(bullet2)

	bullet1.global_position = position_2d.global_position
	bullet2.global_position = position_2_d_2.global_position
	
	bullet1.dir = -1
	bullet2.dir = -1
	


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		health -= 1
		area.queue_free()
