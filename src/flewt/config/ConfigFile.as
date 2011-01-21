package flewt.config 
{
	/**
	 * ...
	 * @author ruffenman
	 */
	public class ConfigFile
	{		
		public function ConfigFile(value:*) 
		{
			_xml = new XML(value);
		}		
		
		public function get xml():XML
		{
			return _xml;
		}
		
		private var _xml:XML;
	}

}