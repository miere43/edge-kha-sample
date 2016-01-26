package systems;

import edge.ISystem;

import kha.Color;
import kha.Framebuffer;
import kha.graphics2.Graphics;

import components.*;

class RenderDots implements ISystem {
	public function new() {
	}

	public function before() {
		var g = Dots.framebuffer.g2;

		g.begin(true, Color.White);
	}

	public function update(pos: Position) {
		var g = Dots.framebuffer.g2;

		g.color = Color.Black;
		g.fillRect(pos.x+1, pos.y+1, 3, 3);
	}

	public function after() {
		var g = Dots.framebuffer.g2;

		g.end();
	}
}