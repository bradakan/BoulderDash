package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import TileSystem;
	import PublicStatics;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Main extends Sprite 
	{
		private var _backGround : background = new background();
		public static var GAME;
		private var _tileSystem : TileSystem;
		private var gameTimer : Timer = new Timer(250, 1);
		private var isGameActive : Boolean; //deze pas er in zetten wanneer het menu af is
		
		public function Main():void 
		{
			GAME = this;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			addChild(_backGround);
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_tileSystem = new TileSystem();
			_tileSystem.addLvl(PublicStatics.LVL1,40,22);
			//trace(TileSystem.checkTile(150, 50, PublicStatics.DOWN));
			gameTimer.start();
			//addEventListener(Event.ENTER_FRAME, gameLoop);
			gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE,gameLoop);
			addEventListener(PublicStatics.MOVE_ME, moveMe);
			
		}		
		
		private function moveMe(e:Event):void 
		{
			var moveTo = e.target.direction;
			TileSystem.moveTile(e.target.x,e.target.y,moveTo);
			if (moveTo == PublicStatics.DOWN)
			{
				e.target.y += 50;
			}			
			if (moveTo == PublicStatics.UP)
			{
				e.target.y -= 50;
			}
			if (moveTo == PublicStatics.LEFT)
			{
				e.target.x -= 50;
			}
			if (moveTo == PublicStatics.RIGHT)
			{
				e.target.x += 50;
			}
			

		}
		
		private function gameLoop(e:Event):void 
		{
			for (var i : int = PublicStatics.MOVABLE_OBJECT.length - 1; i >= 0; i-- )
			{
				PublicStatics.MOVABLE_OBJECT[i].update();
			}
			gameTimer.start();
		}
		

	}
	
}