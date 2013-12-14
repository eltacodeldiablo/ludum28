package  {
	import flash.geom.Point;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.display.Sprite;
    import flash.utils.Dictionary;
	//this is the main class!
	public class main extends MovieClip {
		private var mapCanvas:Sprite;
		private var mapData:Map;
		private var tileWidth:Number = 80;

		private var hero:Character;//player character
        private var controlDict:Dictionary;
        private var leftPressed:Boolean = false,
                    upPressed:Boolean = false,
                    rightPressed:Boolean = false,
                    downPressed:Boolean = false;

        private var i:int, j:int;
		public function main(){
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
            stage.addEventListener(Event.ENTER_FRAME, main_loop);
            //stage.addEventListener(Event.ENTER_FRAME, cameraFollowCharacter);

			mapCanvas = new Sprite();
			addChild(mapCanvas);
			mapCanvas.graphics.clear();

			mapData = new Map(10,10);
			drawLevel(mapData);
			init();
		}
		public function main_loop(e:Event):void{
            playerControl();
			hero.update();
		}
        public function playerControl():void{
            trace("\nleft: "+leftPressed +"\nright: "+rightPressed+"\nup: "+upPressed+"\ndown: "+downPressed)
            if(leftPressed){
                hero.moveLeft();
            }
            if(upPressed){
                hero.moveUp();
            }
            if(rightPressed){
                hero.moveRight();
            }
            if(downPressed){
                hero.moveDown();
            }
            //stop moving
            if(noButtonsPressed()){
                hero.slowDown();
            }
        }
		//init
		public function init(){
            initControls();
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
    				var x:int = tileWidth*i+tileWidth/2;
    				var y:int = tileWidth*j+tileWidth/2;
    				var type:int = Math.ceil(Math.random()*4);
    				var tile = new floor1_tile(x,y,type);
    				addChild(tile);
    			}
    		}
		}
        //control dictionary
        public function initControls():Dictionary{
            controlDict = new Dictionary();
            controlDict["left"] = 37;
            controlDict["up"] = 38;
            controlDict["right"] = 39;
            controlDict["down"] = 40;

            controlDict["action1"] = 65;
            controlDict["action1"] = 83;


            return controlDict;
        }
        public function getControls():Dictionary{
            return controlDict;
        }
		//key down event listener
		public function keyDownHandler(e:KeyboardEvent):void {
            var controls = getControls();
			if (e.keyCode == controls["left"]) {
				leftPressed = true;
			}else if (e.keyCode == controls["up"]) {
				upPressed = true;
			}else if (e.keyCode == controls["right"]) {
				rightPressed = true;
			}else if (e.keyCode == controls["down"]) {
                downPressed = true;
            }
		}
		//release handler
		public function keyUpHandler(e:KeyboardEvent):void {
            var controls = getControls();
            if (e.keyCode == controls["left"]) {
                leftPressed = false;
            }else if (e.keyCode == controls["up"]) {
                upPressed = false;
            }else if (e.keyCode == controls["right"]) {
                rightPressed = false;
            }else if (e.keyCode == controls["down"]) {
                downPressed = false;
            }
		}
        public function noButtonsPressed():Boolean{
            if(!leftPressed && !upPressed && !rightPressed && !downPressed){
                return true;
            }else{
                return false;
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