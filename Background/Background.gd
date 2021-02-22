extends ColorRect

onready var HUD = get_node("/root/Game/HUD")
var c = 0
var colors = [
	Color(0, 0, 0),
	Color(0.129412, 0.145098, 0.160784),
	Color(0.203922, 0.227451, 0.25098),
	Color(0.129412, 0.145098, 0.160784)
]

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()

func _on_HUD_changed():
	update_color()

func _on_Timer_timeout():
	if HUD.color_background:
		c = wrapi(c+1, 0, colors.size())
		update_color()


func update_color():
	if HUD.color_background:
		color = colors[c]
	else:
		color = Color(0,0,0,1)
