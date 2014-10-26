package  
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class WallClass extends MovieClip 
	{
		private var _wall : MovieClip;
		public function WallClass() 
		{
			super();
			_wall = new Wall();
			addChild(_wall);
			
		}
		
	}

}