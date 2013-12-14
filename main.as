package  {
	import flash.geom.Point;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	//this is the main class!
	public class main extends MovieClip {
		private var mapCanvas:Sprite;
		private var mapData:Map;
		private var tileWidth:Number = 80;

		private var hero:Character;//player character
		private var playerControl:Controls
		private var controlDict:Dictionary;


		private var i:int, j:int;
		public function main(){
			stage.addEventListener(Event.ENTER_FRAME, main_loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			//stage.addEventListener(Event.ENTER_FRAME, cameraFollowCharacter);

			mapCanvas = new Sprite();
			addChild(mapCanvas);
			mapCanvas.graphics.clear();

			mapData = new Map(10,10);
			drawLevel(mapData);
			init();
		}
		public function main_loop(e:Event):void{
			hero.update();
			playerControl.update();
		}
		//init
		public function init(){
			hero = spawnChar(new white_char(), getTileCenter(5,5));
			playerControl = new Controls(hero);
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
					var x:int = tileWidth*i+tileWidth/2;
					var y:int = tileWidth*j+tileWidth/2;
					var type:int = Math.ceil(Math.random()*4);
					var tile = new floor1_tile(x,y,type);
					addChild(tile);
				}
			}
		}
		//key down event listener
		public function keyDownHandler(e:KeyboardEvent):void {
			var controls = playerControl.getControls();
			if (e.keyCode == controls["left"]) {
				playerControl.setLeft(true);
			}else if (e.keyCode == controls["up"]) {
				playerControl.setUp(true);
			}else if (e.keyCode == controls["right"]) {
				playerControl.setRight(true);
			}else if (e.keyCode == controls["down"]) {
				playerControl.setDown(true);
			}
		}
		//key up event listener
		public function keyUpHandler(e:KeyboardEvent):void {
			var controls = playerControl.getControls();
			if (e.keyCode == controls["left"]) {
				playerControl.setLeft(false);
			}else if (e.keyCode == controls["up"]) {
				playerControl.setUp(false);
			}else if (e.keyCode == controls["right"]) {
				playerControl.setRight(false);
			}else if (e.keyCode == controls["down"]) {
				playerControl.setDown(false);
			}
		}
		//returns the x and y center value of tile at horizontal and vertical
		public function getTileCenter(horizontal:int, vertical:int):Point{
			var w = getTileWidth();
			return new Point(horizontal*w-w/2, vertical*w-w/2);
		}
		//gets the width of a tile, which should be the same as height
		public function getTileWidth():Number{
			return tileWidth;
		}
	}
}