/*
 PureMVC AS2 Port by Pedr Browne <pedr.browne@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
import org.puremvc.as2.interfaces.*;

interface org.puremvc.as2.interfaces.ICommand
{
	/**
	 * The interface definition for a PureMVC Command.
	 *
	 * @see org.puremvc.as2.interfaces INotification
	 */
	
		/**
		 * Execute the <code>ICommand</code>'s logic to handle a given <code>INotification</code>.
		 * 
		 * @param note an <code>INotification</code> to handle.
		 */
		function execute( notification:INotification ) : Void
	
}