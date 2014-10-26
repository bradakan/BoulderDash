package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import TileSystem;

	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class GameRock extends MovieClip 
	{
		private var _rock : Rock;
		public var direction : String;
		public var isMoving : Boolean;
		
		public function GameRock() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			_rock = new Rock();
			addChild(_rock);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
		}
		public function update():void
		{
			if (TileSystem.checkTile(x,y,PublicStatics.DOWN) == 6)
			{
				direction = PublicStatics.DOWN;				
				isMoving = true;
				dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
			}
			else if (TileSystem.checkTile(x,y,PublicStatics.DOWN) == 3)
			{
				if (TileSystem.checkTile(x,y,PublicStatics.LEFT) == 6)
				{
					if (TileSystem.checkTile(x,y,PublicStatics.DOWN_LEFT) == 6)
					{
						direction = PublicStatics.LEFT;
						isMoving = true;
						dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
					}
				}
				if (TileSystem.checkTile(x,y,PublicStatics.RIGHT) == 6)
				{
					if (TileSystem.checkTile(x,y,PublicStatics.DOWN_RIGHT) == 6)
					{
						direction = PublicStatics.RIGHT;
						isMoving = true;
						dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
					}
				}
			}
			else if (isMoving == true && TileSystem.checkTile(x,y,PublicStatics.DOWN) == 5)
			{
				trace("dispatch PlayerExplode");
			}
			else 
			{
				isMoving = false;
			}
			
				
		}
		
		
		
		

		
	}

}