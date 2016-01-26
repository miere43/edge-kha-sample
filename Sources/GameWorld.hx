package;

import edge.*;

import kha.System;
import kha.Scheduler;
import kha.Framebuffer;

import components.*;

class GameWorld {
	public var updatePhase: Phase;
	public var renderPhase: Phase;
	public var engine: Engine;

	public var running = false;

	public var renderStartTime: Float;
	public var renderPreviousTime: Float;

	public var updateStartTime: Float;
	public var updatePreviousTime: Float;

	public function new() {
		this.engine = new Engine();
		
		updatePhase = engine.createPhase();
		renderPhase = engine.createPhase();

		System.notifyOnRender(render);
		renderStartTime = Scheduler.time();
		renderPreviousTime = renderStartTime;

		Scheduler.addTimeTask(update, 0, 1 / 60);
		updateStartTime = Scheduler.time();
		updatePreviousTime = updateStartTime;
	}

	public function start() {
		if (running) return;
		running = true;
	}

	public function update() {
		var temp =  updatePreviousTime;
		updatePreviousTime = Scheduler.time();
		var frameTime = (updatePreviousTime - temp);
		// trace('update in $frameTime');

		updatePhase.update(frameTime);
	}

	public function render(framebuffer: Framebuffer) {
		var temp = renderPreviousTime;
		renderPreviousTime = Scheduler.time();
		var frameTime = (renderPreviousTime - temp);
		// trace('render in $frameTime');
		if (Dots.framebuffer != framebuffer) {
			Dots.framebuffer = framebuffer;
			trace("changed framebuffer");
		}

		renderPhase.update(frameTime);
	}
}