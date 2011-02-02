package flewt.core 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flewt.config.Settings;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltApp
	{		
		public function FltApp(documentClass:DisplayObjectContainer) 
		{			
			FltG.registerApp(this, documentClass, registerCompleteCallback);
		}
		
		public function init():void
		{	
			//TODO: listen for quit event
		}
		
		public function update():void
		{
			trace("update");
		}
		
		public function shutDown():void
		{
			//TODO: remove listener for quit event
		}
		
		private function registerCompleteCallback():void
		{
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