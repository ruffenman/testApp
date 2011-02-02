package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flewt.core.FltApp;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class Main extends Sprite 
	{		
		public function Main():void
		{
			if (stage)
			{
				init();
			}
			else 
			{
				this.addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//entry point
			
			_app = new TestApp(this);
			
			_app.addEventListener(Event.COMPLETE, app_completeHandler);
		}
		
		private function app_completeHandler(event:Event):void
		{
			this.removeEventListener(Event.COMPLETE, app_completeHandler);
			
			_app = null;
			
			//exit point
		}
		
		private var _app:TestApp;
	}
}