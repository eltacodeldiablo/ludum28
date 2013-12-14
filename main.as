package  {
	import flash.geom.Point;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	//this is the main class!
	public class main extends MovieClip {

		var tileWidth:Number = 80;
		//
		var hero:character;//player character

		public var i:int, j:int;
		public function main(){
			stage.addEventListener(Event.ENTER_FRAME, main_loop);

			drawLevel();
			init();
		}
		public function main_loop(e:Event){
			hero.update();
		}

		//init
		public function init(){
			hero = spawnChar(new white_char(), getTileCenter(5,5));
		}
		//
		public function spawnChar(charmc:MovieClip, position:Point):character{
			var char:character = new character();
			char.setMC(charmc);
			char.setPos(new Point(position.x, position.y));
			addChild(char.getMC());
			return char;
		}

		//draws the level
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

		//returns the x and y center value of tile at horizontal and vertical
		public function getTileCenter(horizontal:int, vertical:int):Point{
			var w = getTileWidth();
			return new Point(horizontal*w-w/2, vertical*w-w/2);
		}
		//gets the width of a tile, which should be the same as height
		public function getTileWidth(){
			return tileWidth;
		}
	}

}