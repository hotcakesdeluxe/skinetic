function collide_none(_entity, _resolved_position)
{
	return _resolved_position;	
}

#region Solid (box shaped)

	function collide_right_solid(_entity, _resolved_x)
	{
		// Collision occured to the right of the entity, so return the minimum (leftmost) x value
		return min(_resolved_x, bbox_left + _entity.x - _entity.bbox_right);
	}

	function collide_left_solid(_entity, _resolved_x)
	{
		// Collision occured to the left of the entity, so return the maximum (rightmost) x value
		return max(_resolved_x, bbox_right + _entity.x - _entity.bbox_left); 
	}

	function collide_top_solid(_entity, _resolved_y)
	{
		// Collision occured above the entity, so return the maximum (downmost) y value
		return max(_resolved_y, bbox_bottom + _entity.y - _entity.bbox_top);
	}

	function collide_bottom_solid(_entity, _resolved_y)
	{
		// Collision occured below the entity, so return the minimum (upmost) y value
		return min(_resolved_y, bbox_top + _entity.y - _entity.bbox_bottom);	
	}

#endregion