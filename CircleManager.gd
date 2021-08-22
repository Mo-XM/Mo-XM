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
		
		
func savecircles():
	var DataFile : File = File.new()
	DataFile.open("res://CircleFile.txt" , File.WRITE)
	
	for x in Circlelimit : 
		var CircleData : Dictionary = {"position" : var2str(position) , 
		"Circleradius" : var2str(x.radius),
		"Circlecolor" : var2str(x.Circlecolor),
		"name" : x.get_name() , 
		"script" : x.get_script().get_path()}
		
		DataFile.store_line(to_json(CircleData))
		DataFile.close()
		
		
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		self.savecircles()
		get_tree().quit()
		
func loadCircles() -> void:
	var openFile: File = File.new()
	
	if not openFile.file_exists("user://circlesFile.txt"):
		self.Makenewcircles()
		return
	
	openFile.open("user://circlesFile.txt", File.READ)
	
	# don't iterate if file is empty
	if openFile.get_len() <= 0:
		self.Makenewcircles()
		return
	
	while openFile.get_position() < openFile.get_len():
		var data: Dictionary = parse_json(openFile.get_line())
		
		# make sure that the key name 'script' exist
		if not data.has('script'):
			print("script is null")
			continue
		
		var circleLoad: Reference = load(data.script)
		var circleObject = circleLoad.new(str2var(data.position))
		circleObject.set_name(data.name)
		add_child(circleObject)
		Circlelimit.push_back(circleObject)
	
	openFile.close()
	
	return
	
	
	
	
	





