/*
 PureMVC AS3 / Flex Demo - Slacker 
 Copyright (c) 2008 Clifford Hall <clifford.hall@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package org.puremvc.as3.demos.flex.slacker.controller
{
	import org.puremvc.as3.demos.flex.slacker.view.ApplicationMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{
			var app:Slacker = note.getBody() as Slacker;
			facade.registerMediator(new ApplicationMediator(app));
		}
	}
}