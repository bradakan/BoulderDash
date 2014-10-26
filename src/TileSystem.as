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
		private var _player : PlayerClass;
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
				if (lvlLayout[i] != 6)
				{
					addTile(lvlLayout[i], i, _tilesWidth);
				}
				else
				{
					PublicStatics.LVL_OBJECTS.push(null);
				}
			}
		}
		
		private function addTile(tileNum:Number, i:uint, width:Number):void
		{
			if (tileNum == 1)
			{
				_tile = new OuterWall();
			}
			else if (tileNum == 3)
			{
				_tile = new GameRock();
				PublicStatics.MOVABLE_OBJECT.push(_tile);
			}			
			else if (tileNum == 5)
			{
				_tile = new PlayerClass();
				PublicStatics.MOVABLE_OBJECT.push(_tile);
			}
			else if (tileNum == 4)
			{
				_tile = new PickupClass();
				PublicStatics.MOVABLE_OBJECT.push(_tile);
			}
			else if (tileNum == 2)
			{
				_tile = new WallClass();
			}
			else
			{
				//0 == dirt
				_tile = new Dirt();
			}
			
			_tile.x = i % width * _tile.width; 
			_tile.y = Math.floor(i / width) * _tile.height;
			PublicStatics.LVL_OBJECTS.push(_tile);
			Main.GAME.addChild(_tile);
		}
		
		public static function checkTile (tileX:Number, tileY:Number, checkWhere : String = "this"):Number
		{
			var arrayNum :Number;
			if (checkWhere == "this")
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH);
			}
			if (checkWhere == PublicStatics.DOWN)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + PublicStatics.LVLWIDTH;
				
			}
			else if (checkWhere == PublicStatics.UP)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - PublicStatics.LVLWIDTH;
			}
			else if (checkWhere == PublicStatics.LEFT)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - 1;
			}
			else if (checkWhere == PublicStatics.RIGHT)
			{
				arrayNum  = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + 1;
			}
			else if (checkWhere == PublicStatics.UP_RIGHT)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - PublicStatics.LVLWIDTH + 1;
			}
			else if (checkWhere == PublicStatics.UP_LEFT)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) - PublicStatics.LVLWIDTH - 1;
			}
			else if (checkWhere == PublicStatics.DOWN_LEFT)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + PublicStatics.LVLWIDTH - 1;
			}
			else if (checkWhere == PublicStatics.DOWN_RIGHT)
			{
				arrayNum = (tileX / PublicStatics.TILE_WIDTH) + (tileY / PublicStatics.TILE_HEIGTH * PublicStatics.LVLWIDTH) + PublicStatics.LVLWIDTH + 1;
			}
			//return arrayNum;
			return PublicStatics.CURRENT_LVL_LAYOUT[arrayNum];
		}
		
		public static function moveTile(tileX:Number,tileY:Number,moveWhere:String):void
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
			if (PublicStatics.CURRENT_LVL_LAYOUT[arrayNum] == 5)
			{
				if (PublicStatics.LVL_OBJECTS[targetArrayNum] != null)
				{
					Main.GAME.removeChild(PublicStatics.LVL_OBJECTS[targetArrayNum]);
					PublicStatics.LVL_OBJECTS[targetArrayNum] = PublicStatics.LVL_OBJECTS[arrayNum];
					PublicStatics.LVL_OBJECTS[arrayNum] = null;
				}
			}
			if (PublicStatics.CURRENT_LVL_LAYOUT[targetArrayNum] == 4)
			{
				trace("points++");
				//points + score per pickup
				//pickups till exit --
			}
			PublicStatics.CURRENT_LVL_LAYOUT[targetArrayNum] = currentType;
			PublicStatics.CURRENT_LVL_LAYOUT[arrayNum] = 6;
		}
	}

}