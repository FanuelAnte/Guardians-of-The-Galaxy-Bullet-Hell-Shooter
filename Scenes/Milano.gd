extends KinematicBody2D

var bullet_scene = preload("res://Scenes/Bullet.tscn")

var health = 10

onready var position_2d = $Position2D
onready var position_2_d_2 = $Position2D2
onready var shottimer = $shottimer
onready var cooldown = $cooldown

var speed = Vector2(150, 150)
var vel = Vector2.ZERO

var over_heated = false

var heat_value = 0

func _ready():
	pass

func _process(delta):
	Globals.health = health
	Globals.blaster_heat = heat_value
	
	if !over_heated:
		if heat_value >= 10:
			over_heated = true
			if cooldown.time_left == 0:
				cooldown.start()
		else:
			heat_value -= 1 * delta
		
	if health <= 0:
		self.queue_free()
		
	if Input.is_action_pressed("left"):
		vel.x = speed.x * -1
	elif Input.is_action_pressed("right"):
		vel.x = speed.x * 1
	else:
		vel.x = 0
	
	if Input.is_action_pressed("up"):
		vel.y = speed.y * -1
	elif Input.is_action_pressed("down"):
		vel.y = speed.y * 1
	else:
		vel.y = 0
	
	if Input.is_action_just_pressed("a") and !over_heated:
		fire()
	
	vel = move_and_slide(vel)

func fire():
	if shottimer.time_left > 0:
		heat_value += 1
		
	if heat_value > 0:
		heat_value += 0.5
	
	shottimer.start()
	
	var bullet1 = bullet_scene.instance()
	var bullet2 = bullet_scene.instance()
	
	get_parent().add_child(bullet1)
	get_parent().add_child(bullet2)

	bullet1.global_position = position_2d.global_position
	bullet2.global_position = position_2_d_2.global_position
	
	bullet1.dir = -1
	bullet2.dir = -1
	
	bullet1.is_shot_by_player = true
	bullet2.is_shot_by_player = true
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		health -= 1
		Globals.score -= 10
		area.queue_free()

func _on_cooldown_timeout():
	var tween = create_tween()
	tween.tween_property(self, "heat_value", 0.0, 0.5)
	over_heated = false
