extends Node2D

class_name Circle

var radius : float = 5
var Circlecolor : Color = Color.green
var Circleposition : Vector2


func _init(position : Vector2):
	Circleposition = position
	self.draw_circle(Circleposition, radius, Circlecolor)
	
func _draw():
	self.draw_circle(Circleposition , radius , Circlecolor)
	
func updateposition(position : Vector2):
	Circleposition = position
	update()




