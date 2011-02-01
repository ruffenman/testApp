package flewt.core 
{
	import flewt.config.ConfigFile;
	import flewt.config.ConfigManager;
	import flewt.config.Settings;
	
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltSettings extends Settings
	{		
		public static function get quality():String
		{
			var config:ConfigFile = ConfigManager.getConfig(CONFIG_NAME);
			
			return config.xml.display.quality.@value;
		}
		
		public function FltSettings() 
		{
			super();
		}
		
		override public function get configName():String 
		{			
			return CONFIG_NAME;
		}
		
		override protected function get filePath():String 
		{
			return "./" + CONFIG_NAME + ".xml";
		}
		
		private static const CONFIG_NAME:String = "fltSettings";
	}

}