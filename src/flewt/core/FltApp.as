package flewt.core 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flewt.config.Settings;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltApp extends Sprite
	{		
		public function FltApp() 
		{			
			
		}
		
		public function init():void
		{		
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			//TODO: listen for quit event
		}
		
		public function update():void
		{
			var temp:String = FltSettings.quality;
		}
		
		public function shutDown():void
		{
			//TODO: remove listener for quit event
			
			this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
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