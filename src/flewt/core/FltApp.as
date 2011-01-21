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
			var settings:Settings = Settings.init(FltSettings);
			
			settings.addEventListener(settings.configName, settings_readyHandler);
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
		
		private function settings_readyHandler(event:Event):void
		{
			var settings:Settings = event.target as Settings;
			settings.removeEventListener(settings.configName, settings_readyHandler);
			
			init();
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