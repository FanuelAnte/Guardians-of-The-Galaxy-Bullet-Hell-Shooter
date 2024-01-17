extends KinematicBody2D

var bullet_scene=preload("res://Scenes/Bullet.tscn")

var health = 10
onready var label = $Label
onready var position_2d = $Position2D
var dir = 0
signal killed


func _ready():
	connect("killed", self, "handle_enemy_killed")


func _process(delta):
	if self.position.y < 128:
		self.position.y += 50 * dir * delta
	
	if Input.is_action_just_pressed("ui_focus_prev"):
		fire()
		
	label.text = str(health)
	if health <= 0:
		Globals.score+=50
		self.queue_free()
	

func _on_Area2D_area_entered(area):
	if area.is_in_group("bullets"):
		if area.is_shot_by_player:
			health -= 1
			Globals.score+=10
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
	
	
