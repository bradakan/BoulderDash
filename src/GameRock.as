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
			if (TileSystem.checkTile(x,y,PublicStatics.LEFT) == 9)
			{
				if (TileSystem.checkTile(x,y,PublicStatics.DOWN_LEFT) == 9)
				{
					//moveLeft();
				}
			}
			if (TileSystem.checkTile(x,y,PublicStatics.DOWN) == 9)
				{
					//moveDown();
				}
		}
		
		
		
		

		
	}

}