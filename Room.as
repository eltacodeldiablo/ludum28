package {
    public class Room {
        private var _roomArray:Array;
        private var _roomWidth:int;
        private var _roomHeight:int;

        public function Room(width:int,height:int,arr:Array=null) {
            setupRoom(width,height,arr);
        }

        private function setupRoom(width:int,height:int,arr:Array):void {
            _roomWidth = width;
            _roomHeight = height;

            if (arr == null) {
                _roomArray = new Array();
                for (var i:int=0; i<_roomWidth; i++) {
                    _roomArray[i] = new Array();
                    for (var j:int=0; j<_roomHeight; j++) {
                        _roomArray[i][j] = Math.ceil(Math.random()*4);
                    }
                }
                } else {
                    _roomArray = arr;
            }
        }

        public function get roomWidth():int{
            return _roomWidth;
        }
        public function set roomWidth(value:int):void{
            _roomWidth = value;
        }

        public function get roomHeight():int{
            return _roomHeight;
        }
        public function set roomHeight(value:int):void{
            _roomHeight = value;
        }

        public function get roomArray():Array {
            return _roomArray;
        }
        public function set roomArray(value:Array):void {
            _roomArray = value;
        }

        public function getRoomTile(x:int,y:int):int {
            return _roomArray[x][y];
        }
    }
}