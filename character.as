package{
	import flash.geom.Point;
	import flash.display.MovieClip;

	public class Character{
		var pos:Point;
		var velocity:Point;
		var mc:MovieClip;

		public function Character(){
			
		}

		//updates this Character
		public function update(){
			mc.x = pos.x;
			mc.y = pos.y;
		}
		public function init(){
			pos = new Point();
			velocity = new Point();
			
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