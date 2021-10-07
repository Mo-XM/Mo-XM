extends Node2D

class_name Ball

var _Ballradius : float = 10.0
var _Ballcolor : Color = Color.yellow

var _Ballpos : Vector2
var _Ballposreset : Vector2 

var _Ballspeed : Vector2 = Vector2(400.0 , - 400.0)
var _ResetSpeed : Vector2 = _Ballspeed

var _PlayerServe : bool

func _init(startingposition : Vector2 , playerserve := true):
	_Ballpos = startingposition
	_Ballposreset = startingposition
	_PlayerServe = playerserve
	_Ballspeed = Vector2(400 , 0.0)
	_Ballspeed = _ResetSpeed
	
func _draw():
	draw_circle(_Ballpos , _Ballradius , _Ballcolor)
	
func Moveball(delta:float):
	_Ballpos += _Ballspeed * delta
	update()
	
func resetball(playerserve = true):
	_Ballpos = _Ballposreset
	_Ballspeed = _ResetSpeed if (playerserve) else -_ResetSpeed
	update()
	
func inverseYspeed():
	_Ballspeed.y = -_Ballspeed.y
	
func inverseXspeed():
	_Ballspeed = Vector2(-_Ballspeed.x , rand_range(400.0 , 0.0))
	
func getposition() -> Vector2:
	return _Ballpos
	
func resetpos():
	_Ballpos = _Ballposreset
	
func TopPoint() -> float:
	return _Ballpos.y - _Ballradius
	
func BottomPoint() -> float:
	return _Ballpos.y + _Ballradius

func ballradius() -> float:
	return _Ballradius



