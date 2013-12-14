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
		private var roomData:Room;
		private var tileSize:Point = new Point(80,80);//tile width, room heights
		private var roomSize:Point = new Point(3,5);//room width, room height

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

			roomData = new Room(roomSize.x,roomSize.y);
			drawLevel(roomData);
			init();
		}
		public function main_loop(e:Event):void{
			hero.update();
			playerControl.update();
			collisionChecker(hero);

			//trace(getTileFromPosition(hero.getPos()))
		}
		//init
		public function init(){
			hero = spawnChar(new white_char(), getTileCenter(2,2));
			playerControl = new Controls(hero);
			cameraTarget = hero.getPos();
			resetCamera();
		}
		//collision for player
		public function collisionChecker(char:Character):void{
			var tilew = getTileSize().x;
			var tileh = getTileSize().y;
			var charpos = char.getPos();
			var buffer = 10;
			var roomMax = new Point(roomSize.x*tilew, roomSize.y*tileh);
			//var tileCheck = getTileFromPosition(char.getLeft() - buffer, charpos.y));

			if(char.getLeft()<0){//left
				char.setLeftCollision(true);
			}else{
				char.setLeftCollision(false);
			}
			trace(char.getTop())
			if(char.getTop()<0){//up
				char.setUpCollision(true);
			}else{
				char.setUpCollision(false);
			}
			if(char.getRight()>roomMax.x){//right
				char.setRightCollision(true);
			}else{
				char.setRightCollision(false);
			}
			if(char.getBottom()>roomMax.y){//down
				char.setDownCollision(true);
			}else{
				char.setDownCollision(false);
			}

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
		//creates a character
		public function spawnChar(charmc:MovieClip, position:Point):Character{
			var char:Character = new Character();
			char.setMC(charmc);
			char.setPos(new Point(position.x, position.y));
			addChild(char.getMC());
			return char;
		}

		//draws the level
		public function drawLevel(roomData:Room){
			//test to fill up the screen
			for(i=0;i<roomData.roomWidth;i++){
				for(j=0;j<roomData.roomHeight;j++){
					var tileWidth = getTileSize().x;
					var tileHeight = getTileSize().y;
					var x:int = tileWidth*i+tileWidth/2;
					var y:int = tileHeight*j+tileHeight/2;
					var type:int = roomData.getRoomTile(i,j);
					var tile = new floor1_tile(x,y,type);
					mapCanvas.addChild(tile);
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
		//uses x, y positional data to find what tile it is in
		public function getTileFromPosition(positionalPoint:Point):Point{
			var pos = positionalPoint;
			var tileWidth = getTileSize().x;
			var tileHeight = getTileSize().y;
			var tilept = new Point(Math.ceil(pos.x/tileWidth), Math.ceil(pos.y/tileHeight));
			return tilept;
		}
		//returns the x and y center value of tile at horizontal and vertical
		public function getTileCenter(horizontal:int, vertical:int):Point{
			var w = getTileSize().x;
			return new Point(horizontal*w-w/2, vertical*w-w/2);
		}
		//gets the width of a tile, which should be the same as height
		public function getTileSize():Point{
			return tileSize;
		}
	}
}