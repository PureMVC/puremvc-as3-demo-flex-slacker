/*
 PureMVC AS3 / Flex Demo - Slacker 
 Copyright (c) 2008 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.puremvc.as3.demos.flex.slacker.view
{
	import flash.events.Event;
	
	import org.puremvc.as3.demos.flex.slacker.ApplicationFacade;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ApplicationMediator extends Mediator
	{
        public static const NAME:String = 'ApplicationMediator';
       
        public function ApplicationMediator( viewComponent:Object )
        {
            super( NAME, viewComponent );   
        }
        
        override public function onRegister():void
        {
			facade.registerMediator(new MainDisplayMediator(app.mainDisplay));
            app.addEventListener( Slacker.SHOW_GALLERY, onShowGallery );
            app.addEventListener( Slacker.SHOW_EDITOR, onShowEditor  );
            app.addEventListener( Slacker.SHOW_PROFILE, onShowProfile );
        } 

        protected function onShowEditor( event:Event ):void
        {
             sendNotification( ApplicationFacade.EDITOR_MODE );
        }

        protected function onShowGallery( event:Event ):void
        {
			 sendNotification( ApplicationFacade.GALLERY_MODE );
        }
 
        protected function onShowProfile( event:Event ):void
        {
            sendNotification( ApplicationFacade.PROFILE_MODE );
        }

        protected function get app():Slacker
        {
            return viewComponent as Slacker;
        }
	}
	
}