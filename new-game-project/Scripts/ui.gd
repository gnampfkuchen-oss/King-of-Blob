extends CanvasLayer

signal restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("upgrades"):
	#	if visible:
	#		hide()
	#		get_tree().paused = false
	#	else:
	#		show()
	#		get_tree().paused = true


func _on_restart_pressed() -> void:
	restart.emit()
