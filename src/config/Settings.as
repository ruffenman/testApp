package flewt.config 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.utils.getQualifiedSuperclassName;
	/**
	 * ...
	 * @author ruffenman
	 */
	public class Settings extends EventDispatcher
	{	
		/**
		 * Static function that can be called to set up a settings file with a corresponding
		 * 	class derived from this one.
		 * @param	settingsClass The settings class that is derived from Settings
		 * @return The temporary instance used for initialization. This object dispatches an Event
		 * 	of a type matching the configName of the file when set up is complete.
		 */
		public static function init(settingsClass:Class):Settings
		{
			if (!/.*Settings/.test(getQualifiedSuperclassName(settingsClass)))
			{
				throw new Error("Tried to load invalid Settings class");
			}
			
			var initializer:Settings = new settingsClass();
			
			return initializer;
		}
		
		public function Settings()
		{
			super();
			
			var loader:URLLoader = ConfigManager.loadConfigFile(filePath);
			
			loader.addEventListener(Event.COMPLETE, loader_completeHandler);
		}
		
		public function get configName():String
		{
			return "default"
		}
		
		protected function get filePath():String
		{
			return "./default.xml";
		}
		
		private function loader_completeHandler(event:Event):void
		{
			(event.target as URLLoader).removeEventListener(Event.COMPLETE, loader_completeHandler);
			
			dispatchEvent(new Event(configName));
		}	
	}

}