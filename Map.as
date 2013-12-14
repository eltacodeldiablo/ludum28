package {
    public class Map {
        private var _mapArray:Array;
        private var _mapWidth:int;
        private var _mapHeight:int;

        public function Map(width:int,height:int) {
            setupMap(width,height);
        }

        private function setupMap(width:int,height:int):void {
            _mapWidth = width;
            _mapHeight = height;

            _mapArray = new Array();
            for (var i:int=0; i<_mapWidth; i++) {
                _mapArray[i] = new Array();
                for (var j:int=0; j<_mapHeight; j++) {
                    _mapArray[i][j] = Math.ceil(Math.random()*4);
                }
            }
        }

        public function get mapWidth():int{
            return _mapWidth;
        }
        public function set mapWidth(value:int):void{
            _mapWidth = value;
        }

        public function get mapHeight():int{
            return _mapHeight;
        }
        public function set mapHeight(value:int):void{
            _mapHeight = value;
        }

        public function get mapArray():Array {
            return _mapArray;
        }
        public function set mapArray(value:Array):void {
            _mapArray = value;
        }

        public function getMapTile(x:int,y:int):int {
            return _mapArray[x][y];
        }
    }
}