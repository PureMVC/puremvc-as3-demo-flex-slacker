package org.puremvc.as3.demos.flex.slacker.view
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	import org.puremvc.as3.demos.flex.slacker.view.components.ProfileView;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ProfileViewMediator extends Mediator
	{
        public static const NAME:String = 'ProfileViewMediator';
       
        public function ProfileViewMediator( viewComponent:Object )
        {
            super( NAME, viewComponent );   
        }

		override public function onRegister():void
		{
			profileView.message.text = "Hello from the newly registered "+NAME;
			profileView.addEventListener(FlexEvent.HIDE, onHide);
		}
		
		protected function onHide(event:Event):void
		{
			profileView.message.text = "Hi there, its your old friend "+NAME;
			profileView.removeEventListener(FlexEvent.HIDE, onHide);
		}   
		    
        protected function get profileView():ProfileView
        {
            return viewComponent as ProfileView;
        }
	}
	
}