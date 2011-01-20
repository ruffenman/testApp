package flewt.app 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class AppEvent extends Event 
	{		
		public function AppEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			
		}

		override public function clone():Event 
		{
			return super.clone();
		}
		
		public static const PAUSE:String = "pause";
		public static const RESUME:String = "resume";
		public static const QUIT:String = "quit";
	}

}