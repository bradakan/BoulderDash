package  
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class PlayerClass extends MovieClip 
	{
		private var _player : MovieClip;
		public var direction : String;
		private var _mayMoveTo : String;
		
		public function PlayerClass() 
		{
			super();
			_player = new Player();
			addChild(_player);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, move);
			stage.addEventListener(KeyboardEvent.KEY_UP, stopMoving);
		}
		
		private function stopMoving(e:KeyboardEvent):void 
		{
			_mayMoveTo = "";
		}
		
		private function move(e:KeyboardEvent):void 
		{
			if (e.keyCode == 37 || e.keyCode == 65)
			{
				_mayMoveTo = PublicStatics.LEFT;
			}
			if (e.keyCode == 39 || e.keyCode == 68)
			{
				_mayMoveTo = PublicStatics.RIGHT;
			}
			if (e.keyCode == 38 || e.keyCode == 87)
			{
				_mayMoveTo = PublicStatics.UP;
			}
			if (e.keyCode == 40 || e.keyCode == 83)
			{
				_mayMoveTo = PublicStatics.DOWN;
			}
		}
		
		public function update()
		{
			if (_mayMoveTo == PublicStatics.LEFT)
			{
				if (TileSystem.checkTile(x, y, _mayMoveTo) == 6 || TileSystem.checkTile(x, y, _mayMoveTo) == 0 || TileSystem.checkTile(x, y, _mayMoveTo) == 4)
				{
					direction = PublicStatics.LEFT;
					dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
				}
			}
			if (_mayMoveTo == PublicStatics.RIGHT)
			{
				if (TileSystem.checkTile(x, y, _mayMoveTo) == 6 || TileSystem.checkTile(x, y, _mayMoveTo) == 0 || TileSystem.checkTile(x, y, _mayMoveTo) == 4)
				{
					direction = PublicStatics.RIGHT;
					dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
				}
			}
			if (_mayMoveTo == PublicStatics.UP)
			{
				if (TileSystem.checkTile(x, y, _mayMoveTo) == 6 || TileSystem.checkTile(x, y, _mayMoveTo) == 0 || TileSystem.checkTile(x, y, _mayMoveTo) == 4)
				{
					direction = PublicStatics.UP;
					dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
				}
			}
			if (_mayMoveTo == PublicStatics.DOWN)
			{
				if (TileSystem.checkTile(x, y, _mayMoveTo) == 6 || TileSystem.checkTile(x, y, _mayMoveTo) == 0 || TileSystem.checkTile(x, y, _mayMoveTo) == 4)
				{
					direction = PublicStatics.DOWN;
					dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
				}
			}
			
		}
	}

}