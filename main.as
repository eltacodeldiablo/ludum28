package  {
	import flash.geom.Point;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.display.Sprite;
	//this is the main class!
	public class main extends MovieClip {
		private var mapCanvas:Sprite;
		private var mapData:Map;
		private var tileWidth:Number = 80;

		private var hero:Character;//player character
		private var i:int, j:int;

		public function main(){
			stage.addEventListener(Event.ENTER_FRAME, main_loop);

			mapCanvas = new Sprite();
			addChild(mapCanvas);
			mapCanvas.graphics.clear();

			mapData = new Map(10,10);
			drawLevel(mapData);
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
		public function spawnChar(charmc:MovieClip, position:Point):Character{
			var char:Character = new Character();
			char.setMC(charmc);
			char.setPos(new Point(position.x, position.y));
			addChild(char.getMC());
			return char;
		}

		//draws the level
		public function drawLevel(mapData:Map){
		//test to fill up the screen
		for(i=0;i<mapData.mapWidth;i++){
			for(j=0;j<mapData.mapHeight;j++){
				var x:int = tileWidth*j+tileWidth/2;
				var x:int = y;
				var type:int = Math.ceil(Math.random()*4);
				var tile = new floor1_tile(x,y,type);
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