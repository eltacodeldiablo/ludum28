package  {
	import flash.geom.Point;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	import flash.geom.Rectangle;
	//this is the main class!
	public class main extends MovieClip {
		private var mapCanvas:Sprite;
		private var mapData:Map;
		private var tileWidth:Number = 80;
		private var roomSize:Point = new Point(10,10);//room width, room height

		private var hero:Character;//player character
		private var playerControl:Controls;//controller for player input
		private var cameraTarget:Point;//point where the camera should look at

		private var i:int, j:int;
		public function main(){
			stage.addEventListener(Event.ENTER_FRAME, main_loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(Event.ENTER_FRAME, cameraFollowCharacter);

			mapCanvas = new Sprite();
			addChild(mapCanvas);
			mapCanvas.graphics.clear();

			mapData = new Map(roomSize.x,roomSize.y);
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
			cameraTarget = hero.getPos();
			resetCamera();
		}
		//-- camera --
		public function cameraFollowCharacter(e:Event, cameraMode:String = "normal"){//camera also manages ui
			if(cameraTarget!=null && root.scrollRect!=null){
				var currRect = root.scrollRect;

				//calculate difference in x 
				var xdifference = (currRect.x + (stage.stageWidth/2)) - cameraTarget.x;
				var xmove = 0;
				if(Math.abs(xdifference)>10){
					xmove = Math.sqrt(Math.abs(xdifference));
					if(xdifference > 0){
						xmove *= -1;
					}
				}
				//calculate difference in y
				var ydifference = (currRect.y + (stage.stageHeight/2)) - cameraTarget.y;
				var ymove = 0;
				if(Math.abs(ydifference)>10){
					ymove = Math.sqrt(Math.abs(ydifference));
					if(ydifference > 0){
						ymove *= -1;
					}
				}
				//move camera
				root.scrollRect = new Rectangle(currRect.x + xmove, currRect.y + ymove, stage.stageWidth, stage.stageHeight);	
			}else{
				root.scrollRect = new Rectangle(cameraTarget.x - (stage.stageWidth/2), cameraTarget.y - (stage.stageHeight/2), stage.stageWidth, stage.stageHeight);	
			}
		}
		public function resetCamera(){
			root.scrollRect = new Rectangle(cameraTarget.x - (stage.stageWidth/2), cameraTarget.y - (stage.stageHeight/2), stage.stageWidth, stage.stageHeight);	
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