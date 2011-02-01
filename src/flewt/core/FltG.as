package flewt.core 
{
	import flash.display.BitmapData;
	import flewt.config.Settings;
	
	/**
	 * ...
	 * @author jcapote
	 */
	public class FltG 
	{		
		public function FltG() 
		{
			_apps = new Vector.<FltApp>();
		}
		
		/**
		 * Registers a FltApp. The first time this is called FlxG is intialized and loads 
		 * 	fltSettings. This should only be called internally by the FltApp base class.
		 * @param	app The FltApp to register with the framework
		 * @param	initCompleteHandler The handler which should be called when registration is 
		 * 	complete. This will be called immediately if a second app is being registered and FltG
		 * 	has already been initialized.
		 */
		internal static function registerApp(app:FltApp, initCompleteHandler:Function):void
		{
			
		}
		
		private static function get instance():FltG
		{
			if (!s_instance)
			{
				s_instance = new FltG();
			}
			
			return s_instance;
		}
		
		private function init():void
		{
			var settings:Settings = Settings.init(FltSettings);
			
			settings.addEventListener(settings.configName, settings_readyHandler);
		}
		
		private function settings_readyHandler(event:Event):void
		{
			var settings:Settings = event.target as Settings;
			settings.removeEventListener(settings.configName, settings_readyHandler);
			
			
		}
		
		private static var s_instance:FltG;
		
		private var _backBuffer:BitmapData;
		private var _apps:Vector.<FltApp>;
		private var _initialized:Boolean;
	}

}