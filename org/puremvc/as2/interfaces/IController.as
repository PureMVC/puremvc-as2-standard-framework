/*
 PureMVC AS2 Port by Pedr Browne <pedr.browne@puremvc.org>
 PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
import org.puremvc.as2.interfaces.*;

/**
 * The interface definition for a PureMVC Controller.
 * 
 * <P>
 * In PureMVC, an <code>IController</code> implementor 
 * follows the 'Command and Controller' strategy, and 
 * assumes these responsibilities:
 * <UL>
 * <LI> Remembering which <code>ICommand</code>s 
 * are intended to handle which <code>INotifications</code>.</LI>
 * <LI> Registering itself as an <code>IObserver</code> with
 * the <code>View</code> for each <code>INotification</code> 
 * that it has an <code>ICommand</code> mapping for.</LI>
 * <LI> Locating the proper <code>ICommand</code> instance
 * to handle a given <code>INotification</code> when notified by the <code>View</code>.</LI>
 * <LI> Calling the <code>ICommand</code>'s <code>execute</code>
 * method, passing in the <code>INotification</code>.</LI> 
 * </UL>
 *
 * @see org.puremvc.as2.interfaces INotification
 * @see org.puremvc.as2.interfaces ICommand
 */
interface org.puremvc.as2.interfaces.IController
{
	
	/**
	 * Register a particular <code>ICommand</code> class as the handler 
	 * for a particular <code>INotification</code>.
	 * 
	 * @param notificationName the name of the <code>INotification</code>
	 * @param command an Instance of an <code>ICommand</code>
	 *
	 * AS2 Note: Unlike the AS3 version, we are passing in an instance of an ICommand rather than a class ref.
	 */
	function registerCommand( notificationName:String, command:ICommand ) : Void;
	
	/**
	 * Execute the <code>ICommand</code> previously registered as the
	 * handler for <code>INotification</code>s with the given notification name.
	 * 
	 * @param notification the <code>INotification</code> to execute the associated <code>ICommand</code> for
	 */
	function executeCommand( notification : INotification ) : Void;

	/**
	 * Remove a previously registered <code>ICommand</code> to <code>INotification</code> mapping.
	 * 
	 * @param notificationName the name of the <code>INotification</code> to remove the <code>ICommand</code> mapping for
	 */
	function removeCommand( notificationName : String ):Void;
	
}