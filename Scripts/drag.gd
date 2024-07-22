extends Sprite2D

# Define the status of the sprite: "none", "clicked", "released", or "dragging".
var status = "none"
var tsize = Vector2()
var mpos = Vector2()
var drag_offset = Vector2()

# This is a singleton to keep track of the currently dragged sprite
var dragging_sprite = null

func _ready():
	var texture = get_texture()
	if texture:
		tsize = texture.get_size()
	else:
		print("Error: Sprite texture is not assigned.")
		tsize = Vector2.ZERO  # Default to zero if no texture is assigned

func _process(delta):
	if status == "dragging" and dragging_sprite == self:
		global_position = mpos + drag_offset

func _input(ev):
	if ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed:
			var evpos = ev.global_position
			var gpos = global_position
			var rect = Rect2()
			
			if is_centered():
				rect = Rect2(gpos.x - tsize.x / 2, gpos.y - tsize.y / 2, tsize.x, tsize.y)
			else:
				rect = Rect2(gpos.x, gpos.y, tsize.x, tsize.y)
			
			if rect.has_point(evpos):
				status = "clicked"
				drag_offset = gpos - evpos
				if dragging_sprite == null:  # Only set if no other sprite is being dragged
					dragging_sprite = self
		
		elif not ev.pressed:
			if dragging_sprite == self:
				status = "released"
				dragging_sprite = null  # Stop dragging for this instance
		
	if status == "clicked" and ev is InputEventMouseMotion:
		status = "dragging"

	mpos = ev.global_position
