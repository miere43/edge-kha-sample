package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

import edge.World;

import components.Position;
import components.Velocity;

import systems.RenderDots;
import systems.UpdateMovement;

class Dots {
	public static inline var width = 200;
	public static inline var height = 200;

	public static var framebuffer: Framebuffer;

	// public var engine: Engine;
	// public var render: Phase;
	// public var physics: Phase;
	// public var frame: Phase;
	// public var running: bool;
	// public var delta: Float;
	// public var renderSystem;

	public var world: GameWorld;

	public function new() {
		world = new GameWorld();

		for (i in 0...300) {
			world.engine.create([
				new Position(
					Math.random() * width,
					Math.random() * height),
				new Velocity(
					Math.random() * 2 - 1,
					Math.random() * 2 - 1)
			]);
		}

		for (i in 0...20) {
			world.engine.create([
				new Position(
					Math.random() * width,
					Math.random() * height)
			]);
		}

		world.updatePhase.add(new UpdateMovement());
		world.renderPhase.add(new RenderDots());
	}
}
