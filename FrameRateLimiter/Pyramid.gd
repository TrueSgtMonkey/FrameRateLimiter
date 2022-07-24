extends Spatial

export (float) var fps = 30.0
export (float) var speed = 2.5
export (float) var radius = 1.5
export (float) var rotationSpeed := 3.5

var interval := 0.0
var intervalMax := 0.0
var add := 0.0
var origPos := Vector3()

func _ready():
	intervalMax = 1.0 / fps
	origPos = transform.origin
	
func _physics_process(delta):
	interval += delta
	if interval >= intervalMax:
		add += interval * speed
		transform.origin.y = origPos.y + sin(add) * radius
		rotate_y(interval * rotationSpeed)
		interval = 0.0
