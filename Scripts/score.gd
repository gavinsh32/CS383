extends Label

var _score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_score = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(_score)
	pass

# func _on_enemy_hit():
# 	_score += 1
