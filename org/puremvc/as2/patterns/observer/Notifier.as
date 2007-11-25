﻿/*
 PureMVC AS2 Port originally by Pedr Browne 
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
import org.puremvc.as2.interfaces.*;
import org.puremvc.as2.patterns.observer.Notification;
import org.puremvc.as2.patterns.facade.Facade;

class org.puremvc.as2.patterns.observer.Notifier
{
	
	public function Notifier(){
		facade = Facade.getInstance();
	}

	/**
	 * A Base <code>INotifier</code> implementation.
	 * 
	 * <P>
	 * <code>MacroCommand, Command, Mediator</code> and <code>Proxy</code> 
	 * all have a need to send <code>Notifications</code>. <P>
	 * <P>
	 * The <code>INotifier</code> interface provides a common method called
	 * <code>sendNotification</code> that relieves implementation code of 
	 * the necessity to actually construct <code>Notifications</code>.</P>
	 * 
	 * <P>
	 * The <code>Notifier</code> class, which all of the above mentioned classes
	 * extend, provides an initialized reference to the <code>Facade</code>
	 * Singleton, which is required for the convienience method
	 * for sending <code>Notifications</code>, but also eases implementation as these
	 * classes have frequent <code>Facade</code> interactions and usually require
	 * access to the facade anyway.</P>
	 * 
	 * @see org.puremvc.as2.patterns.facade.Facade Facade
	 * @see org.puremvc.as2.patterns.mediator.Mediator Mediator
	 * @see org.puremvc.as2.patterns.proxy.Proxy Proxy
	 * @see org.puremvc.as2.patterns.command.SimpleCommand SimpleCommand
	 * @see org.puremvc.as2.patterns.command.MacroCommand MacroCommand
	 */
	
		/**
		 * Send an <code>INotification</code>s.
		 * 
		 * <P>
		 * Keeps us from having to construct new notification 
		 * instances in our implementation code.
		 * @param notificationName the name of the notiification to send
		 * @param body the body of the notification (optional)
		 * @param type the type of the notification (optional)
		 */ 
		public function sendNotification( notificationName:String, body:Object, type:String) : Void 
		{
			facade.notifyObservers( new Notification( notificationName, body, type ) );
		}
		
		// Local reference to the Facade Singleton
		private var facade:IFacade;
		
}