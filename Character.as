package{
	import flash.geom.Point;
	import flash.display.MovieClip;

	public class Character{

		private var mc:MovieClip;
		private var pos:Point;
		private var velocity:Point;//current x speed, max y speed
		private var maxVelocity:Point;//max x speed, max y speed

		private var speed:Number = 5;
		private var friction:Number = .7;

		private var leftHasCollision:Boolean = false,
					upHasCollision:Boolean = false,
					rightHasCollision:Boolean = false,
					downHasCollision:Boolean = false;

		public function Character(){
			init();
		}
		public function init():void{
			pos = new Point(1,1);
			velocity = new Point(0,0);
			maxVelocity = new Point(10,10);
		}
		//updates this Character
		public function update(){
			//don't go above or below max velocity
			velocity.x = velocity.x > maxVelocity.x ? maxVelocity.x:velocity.x;
			velocity.x = velocity.x < -maxVelocity.x ? -maxVelocity.x:velocity.x;
			velocity.y = velocity.y > maxVelocity.y ? maxVelocity.y:velocity.y;
			velocity.y = velocity.y < -maxVelocity.y ? -maxVelocity.y:velocity.y;
			//move Character
			if(leftHasCollision && velocity.x < 0){
			}else if(rightHasCollision && velocity.x > 0){
			}else{
				pos.x = pos.x + velocity.x;
			}
			if(upHasCollision && velocity.y < 0){
			}else if(downHasCollision && velocity.y > 0){
			}else{
				pos.y = pos.y + velocity.y;
			}
			//set the movieclip's position
			mc.x = pos.x;
			mc.y = pos.y;

		}
		//
		public function setLeftCollision(boo:Boolean):Boolean{
			leftHasCollision = boo;
			return leftHasCollision;
		}
		public function setUpCollision(boo:Boolean):Boolean{
			upHasCollision = boo;
			return upHasCollision;
		}
		public function setRightCollision(boo:Boolean):Boolean{
			rightHasCollision = boo;
			return rightHasCollision;
		}
		public function setDownCollision(boo:Boolean):Boolean{
			downHasCollision = boo;
			return downHasCollision;
		}
		//
		public function flipXVelocity():void{
			velocity.x = -velocity.x;
		}
		public function flipYVelocity():void{
			velocity.y = -velocity.y;
		}
		//slow down
		public function horizontalSlow():void{
			velocity.x = velocity.x * friction;
		}
		public function verticalSlow():void{
			velocity.y = velocity.y * friction;
		}
		//movement
		public function moveLeft():void{
			velocity.x = velocity.x - speed;
		}
		public function moveUp():void{
			velocity.y = velocity.y - speed;
		}
		public function moveRight():void{
			velocity.x = velocity.x + speed;
		}
		public function moveDown():void{
			velocity.y = velocity.y + speed;
		}
		//gets the extreme position of this thing
		public function getLeft():Number{
			return pos.x - mc.width/2;
		}
		public function getTop():Number{
			return pos.y - mc.height/2;
		}
		public function getRight():Number{
			return pos.x + mc.width/2;
		}
		public function getBottom():Number{
			return pos.y + mc.height/2;
		}
		//movieclip
		public function setMC(newMC:MovieClip):MovieClip{
			mc = newMC;
			return mc;
		}
		public function getMC():MovieClip{
			return mc;
		}
		//position
		public function setPos(newPos:Point):Point{
			pos = newPos;
			return pos;
		}
		public function getPos():Point{
			return pos;
		}
	}
}