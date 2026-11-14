extends CanvasLayer

signal restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Upgrades.hide()
	$Title.hide()
	$Restart.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	restart.emit()
