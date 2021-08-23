extends Node2D

var randomfloats : RandomNumberGenerator = RandomNumberGenerator.new()
var circlelimit = 10
var circlepool : Array = []




func _ready() -> void:
	randomfloats.randomize()
	
	LoadCircles()
	var ButtonNode : Button = self.get_child(0)
	ButtonNode.connect("pressed" , self , "updatecircleposition")
	
	
	
func RandomPositionGenerator() -> Vector2:
	var RandomHeight = randomfloats.randf_range(0.0 , 100)
	var RandomWidth = randomfloats.randf_range(0.0 , 100)
	
	return Vector2(RandomWidth , RandomHeight)
	
func updatecircleposition():
	for x in circlepool : 
		x.updateposition(RandomPositionGenerator())
		
		
func MakeRandomCircleNode():
	var CircleNode : Node2D
	CircleNode = Circle.new(RandomPositionGenerator())
	return CircleNode
	
func MakeLoadedCircleNode():
	var CircleNode : Node2D
	CircleNode = Circle.new(RandomPositionGenerator())
	return CircleNode
	
func MakeNewCircle():
	for i in circlelimit :
		var x : Circle = MakeRandomCircleNode()
		x.set_name("circle" + String(i+1))
		circlepool.push_back(x)
		self.add_child(x)
		
func SaveCircles():
	var circlefile : File = File.new()
	circlefile.open("res://circlefile.txt", File.WRITE)
	
	for x in circlepool : 
		var Data : Dictionary = {"position" : var2str(x.circleposition) , 
		"color" : var2str(x.Circlecolor) , 
		"Name" : x.get_name() , 
		"radius" : x.radius , 
		"script" : x.get_script().get_path()}
		circlefile.store_line(to_json(Data))
		circlefile.close()
		
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST : 
		self.SaveCircles()
		get_tree().quit()
		
		
func LoadCircles():
	var OpenFile : File = File.new()
	
	if not OpenFile.file_exists("res://circlefile.txt") : 
		self.MakeNewCircle()
		
		
		OpenFile.open("res://circlefile.txt" , File.READ)
		if OpenFile.get_len() <= 0 :
			self.MakeNewCircle()
			print(OpenFile)
			return
			
	while OpenFile.get_position() < OpenFile.get_len() : 
		var Data : Dictionary = parse_json(OpenFile.get_line())
		if not Data.has("script"):
			print("script is null")
			continue
			
		var CircleLoad : Reference = load(Data.script)
		var CircleObject = CircleLoad.new(str2var(Data.position))
		CircleObject.set_name(Data.name)
		add_child(CircleObject)
		circlepool.push_back(CircleObject)
	OpenFile.close()
	


