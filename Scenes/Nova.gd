extends KinematicBody2D
var bullet_scene=preload("res://Scenes/Bullet.tscn")
var health = 10
onready var label = $Label
onready var position_2d = $Position2D
var dir = 0

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_focus_prev"):
		fire()
		
	label.text = str(health)
	if health <= 0:
		self.queue_free()
	
	self.position.y += 50 * dir * delta

func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		health -= 1
		area.queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()

func _on_Timer_timeout():
	fire()
	
func fire():
	var bullet = bullet_scene.instance()
	get_parent().add_child(bullet)
	bullet.global_position = position_2d.global_position
	bullet.dir = 1
