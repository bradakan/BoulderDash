package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import PublicStatics;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class TileSystem extends MovieClip 
	{
		public var _lvl1 : Array;
		public var _lvl2 : Array;
		private var _currentArray : Array;
		private var _enemy : Enemy;
		private var _player : Player;
		private var _goal : Goal;
		private var _outerWall : OuterWall;
		private var _rock : Rock;
		private var _tilesWidth : Number;
		private var _tilesHeigth : Number;
		private var _currentArrayLength : Number;
		private var _tile : MovieClip;
		
		
		public function TileSystem() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			
		}
		
		public function addLvl (lvlLayout : Array, width : Number, heigth :Number):void
		{
			
			/*var _lvlLayout : Array = lvlLayout;
			for (var j :uint = 0; j < _lvlLayout.length; j++) 
			{
				_currentArray.push(lvlLayout.length[j]);
			}
			_currentArray = new _lvlLayout;*/
			PublicStatics.CURRENT_LVL_LAYOUT = lvlLayout;
			PublicStatics.LVLWIDTH = width;
			_tilesHeigth = heigth;
			_tilesWidth = width;
			_currentArrayLength = lvlLayout.length;
			for (var i : uint = 0; i <  _currentArrayLength; i++) 
			{
				if (lvlLayout[i] != 9)
				{
					addTile(lvlLayout[i], i, _tilesWidth);
				}
			}
		}
		
		private function addTile(tileNum:Number, i:uint, width:Number):void
		{
			if (tileNum == 1)
			{
				_tile = new OuterWall();
			}
			else if (tileNum == 2)
			{
				_tile = new GameRock();
				//PublicStatics.MOVABLE_OBJECT.push(_tile);

			}			
			else
			{
				//0 == dirt
				_tile = new Dirt();
			}
			
			_tile.x = i % width * _tile.width; 
			_tile.y = Math.floor(i / width) * _tile.height;
			//PublicStatics.CURRENT_LVL_OBJECTS.push(_tile);
			Main.GAME.addChild(_tile);
		}
		
		public static function checkTile (tileX:Number, tileY:Number, checkWhere : String = "this"):Number
		{
			if (checkWhere = "this")
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH);
			}
			if (checkWhere == PublicStatics.DOWN)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + PublicStatics.LVLWIDTH;
				
			}
			else if (checkWhere == PublicStatics.UP)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - PublicStatics.LVLWIDTH;
			}
			else if (checkWhere == PublicStatics.LEFT)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - 1;
			}
			else if (checkWhere == PublicStatics.RIGHT)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + 1;
			}
			else if (checkWhere == PublicStatics.UP_RIGHT)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - PublicStatics.LVLWIDTH + 1;
			}
			else if (checkWhere == PublicStatics.UP_LEFT)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - PublicStatics.LVLWIDTH - 1;
			}
			else if (checkWhere == PublicStatics.DOWN_LEFT)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + PublicStatics.LVLWIDTH - 1;
			}
			else if (checkWhere == PublicStatics.DOWN_RIGHT)
			{
				var arrayNum : Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + PublicStatics.LVLWIDTH + 1;
			}
			//return arrayNum;
			return PublicStatics.CURRENT_LVL_LAYOUT[arrayNum]
		}
		
		public static function moveTile(movingTile:Class,tileX:Number,tileY:Number,moveWhere:String)
		{
			var currentType:Number = checkTile(tileX,tileY);
			var arrayNum:Number = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH);
			var targetArrayNum:Number;
			
			
			if (moveWhere == PublicStatics.UP)
			{
				targetArrayNum = arrayNum - PublicStatics.LVLWIDTH;
			}
			if (moveWhere == PublicStatics.LEFT)
			{
				targetArrayNum = arrayNum - 1;
			}
			if (moveWhere == PublicStatics.RIGHT)
			{
				targetArrayNum = arrayNum + 1;
			}
			if (moveWhere == PublicStatics.DOWN)
			{
				targetArrayNum = arrayNum + PublicStatics.LVLWIDTH;
			}
			
			PublicStatics.CURRENT_LVL_LAYOUT[targetArrayNum] = currentType;
			PublicStatics.CURRENT_LVL_LAYOUT[arrayNum] = 9;
		}
	}

}