package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;

	//this is the main class!
	public class main extends MovieClip {

	}

	//key down event listener
	public function keyDownHandler(e:KeyboardEvent):void {
		//player one
		if (e.keyCode == 65) {//a 
			charA.setAction(a1, true);
		}else if (e.keyCode == 83) {//s 
			charA.setAction(a2, true);
		}else if (e.keyCode == 68) {//d
			charA.setAction(a3, true);
		}
		
		//player two
		if (e.keyCode == 37) {//left
			charB.setAction(a1, true);
		}else if (e.keyCode == 40) {//down, 38 is up 
			charB.setAction(a2, true);
		}else if (e.keyCode == 39) {//right
			charB.setAction(a3, true);
		}
	}
	//release handler
	public function keyUpHandler(e:KeyboardEvent):void {
		//player one
		if (e.keyCode == 65) {//a 
			charA.setAction(a1, false);
		}else if (e.keyCode == 83) {//s 
			charA.setAction(a2, false);
		}else if (e.keyCode == 68) {//d
			charA.setAction(a3, false);
		}
		
		//player two
		if (e.keyCode == 37) {//left
			charB.setAction(a1, false);
		}else if (e.keyCode == 40) {//up 
			charB.setAction(a2, false);
		}else if (e.keyCode == 39) {//right
			charB.setAction(a3, false);
		}
	}
}