extends Node2D

var Circlelimit : Array = []
var totalcircles = 10
var randomfloats : RandomNumberGenerator = RandomNumberGenerator.new()


func _ready():
	randomfloats.randomize()
	
	
func updatecircleposition():
	for x in Circlelimit : 
		x.updateposition(randompositiongenerator())
		
		
func randompositiongenerator() ->Vector2:
	var randomwidth = randomfloats.randf_range(0.0 , 1000)
	var randomheight = randomfloats.randf_range(0.0 , 500)
	
	return Vector2(randomwidth , randomheight)
	
func makerandomcirclenode():
	var CircleNode : Node2D
	CircleNode = Circle.new(randompositiongenerator())
	return CircleNode
	
	
func makeloadedcircle():
	var CircleNode : Node2D
	CircleNode = Circle.new(position)
	return CircleNode
	
	
func Makenewcircles():
	for i in totalcircles :
		var x : Circle = makerandomcirclenode()
		x.set_name("Circle" + String(i+1))
		Circlelimit.push_back(x)
		self.add_child(x)
	
	
	
	





