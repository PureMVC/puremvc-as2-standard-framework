/*
 PureMVC AS2 Port by Pedr Browne <pedr.browne@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
import org.puremvc.as2.interfaces.*;

/**
 * The interface definition for a PureMVC Mediator.
 *
 * <P>
 * In PureMVC, <code>IMediator</code> implementors assume these responsibilities:</P>
 * <UL>
 * <LI>Implement a common method which returns a list of all <code>INotification</code>s 
 * the <code>IMediator</code> has interest in.</LI>
 * <LI>Implement a common notification (callback) method.</LI>
 * </UL>
 * <P>
 * Additionally, <code>IMediator</code>s typically:
 * <UL>
 * <LI>Act as an intermediary between one or more view components such as text boxes or 
 * list controls, maintaining references and coordinating their behavior.</LI>
 * <LI>In Flash-based apps, this is often the place where event listeners are
 * added to view components, and their handlers implemented.</LI>
 * <LI>Respond to and generate <code>INotifications</code>, interacting with of 
 * the rest of the PureMVC app.
 * </UL></P>
 * <P>
 * When an <code>IMediator</code> is registered with the <code>IView</code>, 
 * the <code>IView</code> will call the <code>IMediator</code>'s 
 * <code>listNotificationInterests</code> method. The <code>IMediator</code> will 
 * return an <code>Array</code> of <code>INotification</code> names which 
 * it wishes to be notified about.</P>
 * 
 * <P>
 * The <code>IView</code> will then create an <code>Observer</code> object 
 * encapsulating that <code>IMediator</code>'s (<code>handleNotification</code>) method
 * and register it as an Observer for each <code>INotification</code> name returned by 
 * <code>listNotificationInterests</code>.</P>
 * 
 * <P>
 * A concrete IMediator implementor usually looks something like this:</P>
 * 
 * <listing>
 *	import org.puremvc.as2.patterns.mediator.~~;
 *	import org.puremvc.as2.patterns.observer.~~;
 *	import org.puremvc.as2.core.view.~~;
 * 
 *	import com.me.myapp.model.~~;
 *	import com.me.myapp.view.~~;
 *	import com.me.myapp.controller.~~;
 * 		
 *	import mx.controls.ComboBox;
 *	import mx.events.ListEvent;
 * 
 * public class MyMediator extends Mediator implements IMediator {
 * 
 * 		public function MyComboMediator( viewComponent:Object ) {
 * 			super( viewComponent );
 * 			combo.addEventListener( Event.CHANGE, onChange );
 * 		}
 * 		
 * 		public function listNotificationInterests():Array {
 * 				return [ MyFacade.SET_SELECTION, 
 * 						 MyFacade.SET_DATAPROVIDER ];
 * 		}
 * 
 * 		public function handleNotification( notification:INotification ):void {
 * 				switch ( notification.getName() ) {
 * 					case MyFacade.SET_SELECTION:
 * 						setSelection(notification);
 * 						break;
 * 					case MyFacade.SET_DATAPROVIDER:
 * 						setDataProvider(notification);
 * 						break;
 * 				}
 * 		}
 * 
 * 		// Set the data provider of the combo box
 * 		private function setDataProvider( notification:INotification ):void {
 * 			combo.dataProvider = notification.getBody() as Array;
 * 		}
 * 
 * 		// Invoked when the combo box dispatches a change event, we send a
 *      // notification with the
 * 		private function onChange(event:ListEvent):void {
 * 			sendNotification( MyFacade.MYCOMBO_CHANGED, this );
 * 		}
 * 
 * 		// A private getter for accessing the view object by class
 *      private function get combo():ComboBox  {
 *         return view as ComboBox;
 *      }
 * 
 * }
 * </listing>
 * 
 * @see org.puremvc.as2.interfaces.INotification INotification
 */
interface org.puremvc.as2.interfaces.IMediator
{
	
	/**
	 * Get the <code>IMediator</code> instance name
	 * 
	 * @return the <code>IMediator</code> instance name
	 */
	function getMediatorName():String;
	
	/**
	 * Get the <code>IMediator</code>'s view component.
	 * 
	 * @return Object the view component
	 */
	function getViewComponent():Object;
	
	/**
	 * List <code>INotification</code> interests.
	 * 
	 * @return an <code>Array</code> of the <code>INotification</code> names this <code>IMediator</code> has an interest in.
	 */
	function listNotificationInterests( ):Array;
	
	/**
	 * Handle an <code>INotification</code>.
	 * 
	 * @param notification the <code>INotification</code> to be handled
	 */
	function handleNotification( notification:INotification ):Void;
		
}