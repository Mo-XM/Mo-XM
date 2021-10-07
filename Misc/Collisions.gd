extends Resource

class_name Collisions 

static func pointtopoint(pointA : Vector2 , pointB: Vector2) -> bool:
	return pointA.x == pointB.x and pointA.y == pointB.y
	
static func pointtorectangle(point : Vector2 , rectangle : Rect2) -> bool:
	var Rectleft : float = rectangle.position.x
	var RectRight : float = rectangle.position.x + rectangle.size.x
	var RectTop : float = rectangle.position.y  
	var RectBottom : float = rectangle.position.y + rectangle.size.y
	
	return (Rectleft <= point.x and point.x <= RectRight and
	RectTop <= point.y and point.y <= RectBottom )
