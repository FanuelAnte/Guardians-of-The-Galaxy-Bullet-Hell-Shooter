extends Control

onready var health_bar = $HealthBar


func _ready():
	pass # Replace with function body.


func _process(delta):
	health_bar.value = Globals.health
