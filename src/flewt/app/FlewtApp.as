package flewt.app 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FlewtApp extends Sprite
	{
		
		public function FlewtApp() 
		{			
			//TODO: load config file
			
			//TODO: listen for load complete
		}
		
		public function init():void
		{		
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			//TODO: listen for quit event
		}
		
		public function update():void
		{
			
		}
		
		public function shutDown():void
		{
			//TODO: remove listener for quit event
			
			this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		//TODO: handle config file load completion
		
		private function enterFrameHandler(event:Event):void
		{
			update();
		}	
		
		private function quitHandler(event:AppEvent):void
		{
			shutDown();
			
			dispatchEvent(new Event(Event.COMPLETE));
		}		
	}

}