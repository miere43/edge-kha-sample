package systems;

import edge.ISystem;

import components.*;

class UpdateMovement implements ISystem {
	function update(pos: Position, vel: Velocity) {
		var dx = pos.x + vel.vx,
			dy = pos.y + vel.vy;

		if (dx <= 0 && vel.vx < 0 || dx >= Dots.width && vel.vx > 0)
			vel.vx = -vel.vx;
		else
			pos.x = dx;

		if (dy <= 0 && vel.vy < 0 || dy >= Dots.height && vel.vy > 0)
			vel.vy = -vel.vy;
		else
			pos.y = dy;
	}
}