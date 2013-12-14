package{
	import flash.geom.Point;
	import flash.display.MovieClip;

	public class Character{
		private var pos:Point;
		private var velocity:Point;//current x speed, max y speed
		private var maxVelocity:Point;//max x speed, max y speed


		private var speed:Number = 7;
		private var mc:MovieClip;

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
			pos.x = pos.x + velocity.x;
			pos.y = pos.y + velocity.y;
			//set the movieclip's position
			mc.x = pos.x;
			mc.y = pos.y;

		}
		//
		public function slowDown():void{
			var slowRate = .7;
			//lower velocity
			velocity.x = velocity.x * slowRate;
			velocity.y = velocity.y * slowRate;
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