package flewt.core 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
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
			_renderSurfaces = new Vector.<DisplayObjectContainer>();
			_postLoadCallbacks = new Vector.<Function>();
			_initialized = false;
		}
		
		/**
		 * Registers a FltApp. The first time this is called FlxG is intialized and loads 
		 * 	fltSettings. This should only be called internally by the FltApp base class.
		 * @param	app The FltApp to register with the framework
		 * @param	initCompleteHandler The handler which should be called when registration is 
		 * 	complete. This will be called immediately if a second app is being registered and FltG
		 * 	has already been initialized.
		 */
		internal static function registerApp(app:FltApp, documentClass:DisplayObjectContainer,
			registerCompleteCallback:Function):void
		{
			//store reference to app
			instance._apps.push(app);
			
			//store reference to app's render surface (DisplayObjectContainer)
			instance._renderSurfaces.push(documentClass);
			
			//if FltG has not yet finished intializing
			if (!instance._initialized)
			{
				//store the callback until loading is done
				instance._postLoadCallbacks.push(registerCompleteCallback);
			}
			//otherwise loading was finished
			else
			{
				//callback immediately
				registerCompleteCallback();
			}
		}
		
		private static function get instance():FltG
		{
			if (!s_instance)
			{
				s_instance = new FltG();
				s_instance.init();
			}
			
			return s_instance;
		}
		
		private function init():void
		{
			//load the Flewt settings file
			var settings:Settings = Settings.init(FltSettings);
			
			//wait for load completion
			settings.addEventListener(settings.configName, settings_readyHandler);
		}
		
		private function settings_readyHandler(event:Event):void
		{
			var settings:Settings = event.target as Settings;
			settings.removeEventListener(settings.configName, settings_readyHandler);			
			
			//TODO: initialize based on settings
			
			//initialization complete
			_initialized = true;
			
			//call any after registration callbacks for any waiting apps
			for each(var registerCompleteCallback:Function in _postLoadCallbacks)
			{
				registerCompleteCallback();
			}
			
			//clear list of callbacks
			_postLoadCallbacks.splice(0, _postLoadCallbacks.length);
			
			//set up update loop
			//there will always be an app and render surface stored by now
			_renderSurfaces[0].addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(event:Event):void
		{
			//TODO: update the game time
			
			//update all of the apps
			var numApps:int = _apps.length;
			
			for (var i:int = 0; i < numApps; i++)
			{
				_apps[i].update();
			}
			
			for (i = 0; i < numApps; i++)
			{
				//TODO: render final app frame in some kind of display object that is nested or 
				//	already nested in the correlating render surface DisplayObjectContainer
			}
		}
		
		private static var s_instance:FltG;
		
		private var _apps:Vector.<FltApp>;
		private var _renderSurfaces:Vector.<DisplayObjectContainer>;
		private var _postLoadCallbacks:Vector.<Function>;
		private var _initialized:Boolean;
	}

}