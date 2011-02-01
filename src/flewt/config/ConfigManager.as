package flewt.config 
{
	import flash.automation.Configuration;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class ConfigManager extends EventDispatcher 
	{		
		/**
		 * Loads a config file from the provided path and creates a ConfigFile object for it.
		 * @param	filePath The path to the xml config file
		 * @return The URLLoader that loads the file data. This will dispatch an Event.COMPLETE
		 * 	event when the ConfigFile object has been created.
		 */
		public static function loadConfigFile(filePath:String):URLLoader
		{
			var request:URLRequest = new URLRequest(filePath);
			
			var xmlLoader:URLLoader = new URLLoader(request);
			
			xmlLoader.addEventListener(Event.COMPLETE, instance.loader_completeHandler);
			
			return xmlLoader;
		}
		
		public static function getConfig(configName:String):ConfigFile
		{
			return instance._configList[configName] as ConfigFile;
		}
		
		public function ConfigManager() 
		{
			super();			
			
			_configList = new Object();
		}
		
		private static function get instance():ConfigManager
		{
			if (!s_instance)
			{
				s_instance = new ConfigManager();
			}
			
			return s_instance;
		}
		
		private function loader_completeHandler(event:Event):void
		{
			event.stopImmediatePropagation();
			
			var xmlLoader:URLLoader = event.target as URLLoader;
			
			xmlLoader.removeEventListener(Event.COMPLETE, loader_completeHandler);
			
			var newConfig:ConfigFile = new ConfigFile(xmlLoader.data);
			
			_configList[newConfig.xml.name().localName] = newConfig;
			
			xmlLoader.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private static var s_instance:ConfigManager;
		
		private var _configList:Object;
	}

}