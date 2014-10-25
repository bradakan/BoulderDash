package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import TileSystem;
	import PublicStatics;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Main extends Sprite 
	{
		public static var GAME;
		private var _tileSystem : TileSystem;
		
		public function Main():void 
		{
			GAME = this;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_tileSystem = new TileSystem();
			_tileSystem.addLvl(PublicStatics.LVL1,40,22);
			trace(TileSystem.checkTile(150,50,PublicStatics.LEFT));
		}
		

	}
	
}