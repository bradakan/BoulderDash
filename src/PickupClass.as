package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class PickupClass extends MovieClip 
	{
		private var _pickup : MovieClip;
		public var direction : String;
		public var isMoving : Boolean;

		
		public function PickupClass() 
		{
			super();
			_pickup = new Pickup();
			//_pickup.mask = new PickupMask();
			addChild(_pickup);
		}
		
		public function update():void
		{
			if (TileSystem.checkTile(x,y,PublicStatics.DOWN) == 9)
			{
				direction = PublicStatics.DOWN;				
				isMoving = true;
				dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
			}
			else if (TileSystem.checkTile(x,y,PublicStatics.DOWN) == 2)
			{
				if (TileSystem.checkTile(x,y,PublicStatics.LEFT) == 9)
				{
					if (TileSystem.checkTile(x,y,PublicStatics.DOWN_LEFT) == 9)
					{
						direction = PublicStatics.LEFT;
						isMoving = true;
						dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
					}
				}
				if (TileSystem.checkTile(x,y,PublicStatics.RIGHT) == 9)
				{
					if (TileSystem.checkTile(x,y,PublicStatics.DOWN_RIGHT) == 9)
					{
						direction = PublicStatics.RIGHT;
						isMoving = true;
						dispatchEvent(new Event(PublicStatics.MOVE_ME,true));
					}
				}
			}
			else if (isMoving == true && TileSystem.checkTile(x,y,PublicStatics.DOWN) == 3)
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