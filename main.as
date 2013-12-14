package  {
    import flash.display.MovieClip;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import flash.display.Sprite;

    //this is the main class!
    public class main extends MovieClip {
        private var i:int, j:int;
        private var tileWidth:Number = 80;

        private var mapCanvas:Sprite;
        private var mapData:Map;

        public function main(){
            mapCanvas = new Sprite();
                    addChild(mapCanvas);
                    mapCanvas.graphics.clear();

            mapData = new Map(10,10);
            drawLevel(mapData);
        }
        public function drawLevel(mapData:Map){
            //test to fill up the screen
            for(i=0;i<mapData.mapWidth;i++){
                for(j=0;j<mapData.mapHeight;j++){
                    var tile = new floor1_tile();
                    tile.x = tileWidth*i+tileWidth/2;
                    tile.y = tileWidth*j+tileWidth/2;
                    tile.gotoAndStop(Math.ceil(Math.random()*4));
                    addChild(tile);
                }
            }
        }
        //key down event listener
        public function keyDownHandler(e:KeyboardEvent):void {
            //player one
            /*if (e.keyCode == 65) {//a
                charA.setAction(a1, true);
            }else if (e.keyCode == 83) {//s
                charA.setAction(a2, true);
            }else if (e.keyCode == 68) {//d
                charA.setAction(a3, true);
            }

            //player two
            if (e.keyCode == 37) {//left
                charB.setAction(a1, true);
            }else if (e.keyCode == 40) {//down, 38 is up
                charB.setAction(a2, true);
            }else if (e.keyCode == 39) {//right
                charB.setAction(a3, true);
            }*/
        }
        //release handler
        public function keyUpHandler(e:KeyboardEvent):void {

        }
        public function getTileWidth(){
            return tileWidth;
        }
    }

}