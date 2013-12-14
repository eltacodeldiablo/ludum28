package {
	import flash.utils.Dictionary;

	public class Controls {

		private var stage
		private var char:Character;
		private var controlDict:Dictionary;
		private var leftPressed:Boolean = false,
					upPressed:Boolean = false,
					rightPressed:Boolean = false,
					downPressed:Boolean = false;


		public function Controls(controlledChar:Character){


			char = controlledChar;
			initControls();
		}
		public function update():void{
			//trace("\nleft: "+leftPressed +"\nright: "+rightPressed+"\nup: "+upPressed+"\ndown: "+downPressed)
			if(leftPressed){
				char.moveLeft();
			}
			if(upPressed){
				char.moveUp();
			}
			if(rightPressed){
				char.moveRight();
			}
			if(downPressed){
				char.moveDown();
			}
			//stop moving
			if(noButtonsPressed()){
				char.slowDown();
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
		//returns the dictionary
		public function getControls():Dictionary{
			return controlDict;
		}
		public function setLeft(boo:Boolean):Boolean{
			leftPressed = boo;
			return leftPressed;
		}
		public function setUp(boo:Boolean):Boolean{
			upPressed = boo;
			return upPressed;
		}
		public function setRight(boo:Boolean):Boolean{
			rightPressed = boo;
			return rightPressed;
		}
		public function setDown(boo:Boolean):Boolean{
			downPressed = boo;
			return downPressed;
		}
		//returns true if no buttons are pressed
		public function noButtonsPressed():Boolean{
			if(!leftPressed && !upPressed && !rightPressed && !downPressed){
				return true;
			}else{
				return false;
			}
		}
	}
}