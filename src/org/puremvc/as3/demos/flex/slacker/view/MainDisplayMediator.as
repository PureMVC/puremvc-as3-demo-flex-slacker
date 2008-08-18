package org.puremvc.as3.demos.flex.slacker.view
{
    import flash.events.Event;
    
    import org.puremvc.as3.demos.flex.slacker.ApplicationFacade;
    import org.puremvc.as3.demos.flex.slacker.view.components.MainDisplay;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.mediator.Mediator;

    public class MainDisplayMediator extends Mediator
    {
        public static const NAME:String = 'MainDisplayMediator';
       
        public function MainDisplayMediator( viewComponent:Object )
        {
            super( NAME, viewComponent );   
        }

        override public function onRegister():void
        {
            mainDisplay.addEventListener( MainDisplay.GALLERY_CREATED, onGalleryCreated );
            mainDisplay.addEventListener( MainDisplay.EDITOR_CREATED, onEditorCreated  );
            mainDisplay.addEventListener( MainDisplay.PROFILE_CREATED, onProfileCreated );
        }
       
		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.EDITOR_MODE,
					ApplicationFacade.GALLERY_MODE,
					ApplicationFacade.PROFILE_MODE]
		}
       
       	override public function handleNotification(note:INotification):void
       	{
       		switch (note.getName())
       		{
       			case ApplicationFacade.EDITOR_MODE:
       				mainDisplay.currentViewSelector = MainDisplay.EDITOR;
       				break;
				case ApplicationFacade.GALLERY_MODE:
       				mainDisplay.currentViewSelector = MainDisplay.GALLERY
       				break;
				case ApplicationFacade.PROFILE_MODE:
       				mainDisplay.currentViewSelector = MainDisplay.PROFILE;
       				break;
       		}
       	}

        protected function onEditorCreated( event:Event ):void
        {
			checkForMediator( MainDisplay.EDITOR, mainDisplay.activeView );
        }

        protected function onGalleryCreated( event:Event ):void
        {
			checkForMediator( MainDisplay.GALLERY, mainDisplay.activeView );
        }
 
        protected function onProfileCreated( event:Event ):void
        {
			checkForMediator( MainDisplay.PROFILE, mainDisplay.activeView );
        }


        protected function checkForMediator( childSelector:Number, child:Object ):void
        {
            switch (childSelector)
            {
				 case MainDisplay.PROFILE:
				      if ( ! facade.hasMediator( ProfileViewMediator.NAME ) )
				         facade.registerMediator(new ProfileViewMediator( child ));
				      break;
				 case MainDisplay.GALLERY:
				      if ( ! facade.hasMediator( GalleryViewMediator.NAME ) )
				         facade.registerMediator(new GalleryViewMediator( child ));
				      break;
				 case MainDisplay.EDITOR:
				      if ( ! facade.hasMediator( EditorViewMediator.NAME ) )
				         facade.registerMediator(new EditorViewMediator( child ));
				      break;
              }        
        }

        protected function get mainDisplay():MainDisplay
        {
            return viewComponent as MainDisplay;
        }

    }
}