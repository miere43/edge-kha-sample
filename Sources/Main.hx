package;

import kha.System;
import kha.Framebuffer;

class Main {

	public static function main() {
		System.init("Dots", 200, 200, function () {
			new Dots();
		});

	}
}
