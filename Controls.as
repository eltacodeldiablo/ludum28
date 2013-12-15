package {
	import flash.utils.Dictionary;

	public class Controls {

		private var stage
		private var char:Character;
		private var controlDict:Dictionary;
		private var leftPressed:Boolean = false,
					upPressed:Boolean = false,
					rightPressed:Boolean = false,
					downPressed:Boolean = false,
					action1Pressed:Boolean = false,
					action2Pressed:Boolean = false;


		public function Controls(controlledChar:Character){

			char = controlledChar;
			initControls();
		}
		public function update():void{
			if(action1Pressed){
				char.incrementColor();
				setAction1(false);
			}
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
			if(noVerticalButtons()){
				char.verticalSlow();
			}
			if(noHorizontalButtons()){
				char.horizontalSlow();
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
			controlDict["action2"] = 83;


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
		public function setAction1(boo:Boolean):Boolean{
			action1Pressed = boo;
			return action1Pressed;
		}
		public function setAction2(boo:Boolean):Boolean{
			action2Pressed = boo;
			return action2Pressed;
		}
		
		//true if no vertical buttons are pressed
		public function noVerticalButtons():Boolean{
			if(!upPressed && !downPressed){
				return true;
			}else{
				return false;
			}
		}
		//true if no horizontal buttons are pressed
		public function noHorizontalButtons():Boolean{
			if(!leftPressed && !rightPressed){
				return true;
			}else{
				return false;
			}
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