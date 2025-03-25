/// @self
/// @description Configures the object's extended hitbox by setting its size and offset from the object's centre.
/// @param {Real} radius_x The horizontal radius of the extended hitbox.
/// @param {Real} radius_y The vertical radius of the extended hitbox.
/// @param {Real} [offset_x] The horizontal offset for the extended hitbox from the object's centre (optional, defaults to 0).
/// @param {Real} [offset_y] The vertical offset for the extended hitbox from the object's centre (optional, defaults to 0).
function obj_set_hitbox_ext(_radius_x, _radius_y, _offset_x = 0, _offset_y = 0)
{
	var _data_interact = data_interact;
	
	_data_interact.radius_x_ext = _radius_x;
	_data_interact.radius_y_ext = _radius_y;
	_data_interact.offset_x_ext = _offset_x;
	_data_interact.offset_y_ext = _offset_y;
}