package {
	import flash.display.MovieClip;
	
    public class floor1_tile extends MovieClip {

        public function Map(x:int,y:int,type:int) {
            this.x = x
            this.y = y;
            this.gotoAndStop(type);
        }

    }
}