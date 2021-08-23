extends Node2D

class_name Circle

var radius : float  = 5
var circlecolor : Color = Color.white
var circleposition : Vector2 

func _init(position : Vector2):
	circleposition = position
	
	
func _draw():
	self.draw_circle(circleposition , radius , circlecolor)
	
func updateposition():
	circleposition = position
	update()
