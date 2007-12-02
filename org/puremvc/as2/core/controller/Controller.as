/*
 PureMVC AS2 Port by Pedr Browne <pedr.browne@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
import org.puremvc.as2.core.view.*;
import org.puremvc.as2.interfaces.*;
import org.puremvc.as2.patterns.observer.*;
class org.puremvc.as2.core.controller.Controller implements IController{
	
	/**
	 * A Singleton <code>IController</code> implementation.
	 * 
	 * <P>
	 * In PureMVC, the <code>Controller</code> class follows the
	 * 'Command and Controller' strategy, and assumes these 
	 * responsibilities:
	 * <UL>
	 * <LI> Remembering which <code>ICommand</code>s 
	 * are intended to handle which <code>INotifications</code>.</LI>
	 * <LI> Registering itself as an <code>IObserver</code> with
	 * the <code>View</code> for each <code>INotification</code> 
	 * that it has an <code>ICommand</code> mapping for.</LI>
	 * <LI> Executing a cached instance of the proper <code>ICommand</code>
	 * to handle a given <code>INotification</code> when notified by the 
	 * <code>View</code>.</LI>
	 * <LI> Calling the <code>ICommand</code>'s <code>execute</code>
	 * method, passing in the <code>INotification</code>.</LI> 
	 * </UL>
	 * 
	 * <P>
	 * Your application must register <code>ICommands</code> with the 
	 * Controller.
	 * <P>
 	 * The simplest way is to subclass </code>Facade</code>, 
	 * and use its <code>initializeController</code> method to add your 
	 * registrations. 
	 * 
	 * @see org.puremvc.as2.core.view.View View
	 * @see org.puremvc.as2.patterns.observer.Observer Observer
	 * @see org.puremvc.as2.patterns.observer.Notification Notification
	 * @see org.puremvc.as2.patterns.command.SimpleCommand SimpleCommand
	 * @see org.puremvc.as2.patterns.command.MacroCommand MacroCommand
	 */

		
		/**
		 * Constructor. 
		 * 
		 * <P>
		 * This <code>IController</code> implementation is a Singleton, 
		 * so you should not call the constructor 
		 * directly, but instead call the static Singleton 
		 * Factory method <code>Controller.getInstance()</code>
		 * 
		 * @throws Error Error if Singleton instance has already been constructed
		 * 
		 */
		public function Controller( )
		{
			if (instance != null) throw Error(SINGLETON_MSG);
			instance = this;
			commandMap = new Array();	
			initializeController();	
		}
		
		/**
		 * Initialize the Singleton <code>Controller</code> instance.
		 * 
		 * <P>Called automatically by the constructor.</P> 
		 * 
		 * <P>Note that if you are using a subclass of <code>View</code>
		 * in your application, you should <i>also</i> subclass <code>Controller</code>
		 * and override the <code>initializeController</code> method in the 
		 * following way:</P>
		 * 
		 * <listing>
		 *		// ensure that the Controller is talking to my IView implementation
		 *		override public function initializeController(  ) : Void 
		 *		{
		 *			view = MyView.getInstance();
		 *		}
		 * </listing>
		 * 
		 * @return Void
		 */
		private function initializeController(  ) : Void 
		{
			view = View.getInstance();
		}
	
		/**
		 * <code>Controller</code> Singleton Factory method.
		 * 
		 * @return the Singleton instance of <code>Controller</code>
		 */
		public static function getInstance() : IController
		{
			if ( instance == null ) instance = new Controller( );
			return instance;
		}

		/**
		 * If an <code>ICommand</code> has previously been registered 
		 * to handle a the given <code>INotification</code>, then it is executed.
		 * 
		 * @param note an <code>INotification</code>
		 */
		public function executeCommand( note : INotification ) : Void
		{
			var command:ICommand = commandMap[ note.getName() ];
			if ( command== null ) return;
			command.execute( note );
		}

		/**
		 * Register a particular <code>ICommand</code> class as the handler 
		 * for a particular <code>INotification</code>.
		 * 
		 * <P>
		 * If an <code>ICommand</code> has already been registered to 
		 * handle <code>INotification</code>s with this name, it is no longer
		 * used, the new <code>ICommand</code> is used instead.</P>
		 * 
		 * @param notificationName the name of the <code>INotification</code>
		 * @param commandClassRef the <code>Class</code> of the <code>ICommand</code>
		 */
		public function registerCommand( notificationName:String, command:ICommand) : Void
		{
			commandMap[ notificationName ] = command;
			var observer:Observer = new Observer( executeCommand, this);
			view.registerObserver( notificationName, observer );
		}
		
		/**
		 * Remove a previously registered <code>ICommand</code> to <code>INotification</code> mapping.
		 * 
		 * @param notificationName the name of the <code>INotification</code> to remove the <code>ICommand</code> mapping for
		 */
		public function removeCommand( notificationName : String ) : Void
		{
			commandMap[ notificationName ] = null;
		}
		
		// Local reference to View 
		private var view : IView;
		
		// Mapping of Notification names to Command Class references
		private var commandMap:Array;

		// Singleton instance
		private static var instance : IController;

		// Message Constants
		private var SINGLETON_MSG:String = "Controller Singleton already constructed!";

	
}