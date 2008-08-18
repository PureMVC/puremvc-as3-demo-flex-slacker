package org.puremvc.as3.demos.flex.slacker
{
	import org.puremvc.as3.demos.flex.slacker.controller.StartupCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade
	{
		public static const STARTUP:String = "startup";
		
		public static const EDITOR_MODE:String = "editorMode";
		public static const GALLERY_MODE:String = "galleryMode";
		public static const PROFILE_MODE:String = "profileMode";
		
		/**
		 * Factory Method
		 */
		public static function getInstance() : ApplicationFacade {
			if ( instance == null ) instance = new ApplicationFacade( );
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
		
		public function startup(app:Slacker):void
		{
			sendNotification(STARTUP,app);
		}
		
	}
}