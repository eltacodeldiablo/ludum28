package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	//this is the main class!
	public class main extends MovieClip {
		public var i:int, j:int;
		public var tileWidth:Number = 80;

		public function main(){
			drawLevel();
		}
		public function drawLevel(){
			//test to fill up the screen
			for(i=0;i<10;i++){
				for(j=0;j<10;j++){
					var tile = new floor1_tile();
					tile.x = 80*i+40;
					tile.y = 80*j+40;
					tile.gotoAndStop(Math.ceil(Math.random()*4));
					addChild(tile);
				}
			}
		}
		//key down event listener
		public function keyDownHandler(e:KeyboardEvent):void {
			//player one
			/*if (e.keyCode == 65) {//a 
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
			}*/
		}
		//release handler
		public function keyUpHandler(e:KeyboardEvent):void {

		}
		public function getTileWidth(){
			return tileWidth;
		}
	}

}