/*
 PureMVC AS2 Port originally by Pedr Browne 
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
import org.puremvc.as2.interfaces.*;
import org.puremvc.as2.patterns.observer.Notifier;

class org.puremvc.as2.patterns.command.SimpleCommand extends Notifier implements ICommand, INotifier 
{
	/**
	 * A base <code>ICommand</code> implementation.
	 * 
	 * <P>
	 * Your subclass should override the <code>execute</code> 
	 * method where your business logic will handle the <code>INotification</code>. </P>
	 *
	 * <P>
	 * It is important to remember in this port of PureMVC that commands should
	 * be stateless. A single instance of each command will be used throughout 
	 * the runtime of the application. Therefore, be sure to remove any listeners 
	 * that a command sets, as this can cause garbage collection problems. 
	 * 
	 * 
	 * @see org.puremvc.as2.core.controller.Controller Controller
	 * @see org.puremvc.as2.patterns.observer.Notification Notification
	 * @see org.puremvc.as2.patterns.command.MacroCommand MacroCommand
	 */
		/**
		 * Fulfill the use-case initiated by the given <code>INotification</code>.
		 * 
		 * <P>
		 * In the Command Pattern, an application use-case typically
		 * begins with some user action, which results in an <code>INotification</code> being broadcast, which 
		 * is handled by business logic in the <code>execute</code> method of an
		 * <code>ICommand</code>.</P>
		 * 
		 * @param notification the <code>INotification</code> to handle.
		 */
		public function execute( notification:INotification ) : Void
		{
			
		}

}