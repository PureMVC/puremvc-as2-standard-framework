/*
 PureMVC AS2 Port by Pedr Browne <pedr.browne@puremvc.org>
 PureMVC - Copyright(c) 2006-2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
import org.puremvc.as2.interfaces.*;
import org.puremvc.as2.patterns.observer.*;

/**
 * A base <code>ICommand</code> implementation that executes other <code>ICommand</code>.
 *  
 * <P>
 * A <code>MacroCommand</code> maintains an list of
 * <code>ICommand</code> Class references called <i>SubCommands</i>.</P>
 * 
 * <P>
 * When <code>execute</code> is called, the <code>MacroCommand</code> 
 * instantiates and calls <code>execute</code> on each of its <i>SubCommands</i> turn.
 * Each <i>SubCommand</i> will be passed a reference to the original
 * <code>INotification</code> that was passed to the <code>MacroCommand</code>'s 
 * <code>execute</code> method.</P>
 * 
 * <P>
 * Unlike <code>SimpleCommand</code>, your subclass
 * should not override <code>execute</code>, but instead, should 
 * override the <code>initializeMacroCommand</code> method, 
 * calling <code>addSubCommand</code> once for each <i>SubCommand</i>
 * to be executed.</P>
 *
 * <P>
 * AS2 Note: It is important to remember in this port of PureMVC that commands should
 * be stateless. A single instance of each command will be used throughout 
 * the runtime of the application. Therefore, be sure to remove any listeners 
 * that a command sets, as this can cause garbage collection problems. 
 * <P>
 * 
 * @see org.puremvc.as2.core.controller.Controller Controller
 * @see org.puremvc.as2.patterns.observer.Notification Notification
 * @see org.puremvc.as2.patterns.command.SimpleCommand SimpleCommand
 */
class org.puremvc.as2.patterns.command.MacroCommand extends Notifier implements ICommand, INotifier
{
		
	private var subCommands : Array;
	
	/**
	 * Constructor. 
	 * 
	 * <P>
	 * You should not need to define a constructor, 
	 * instead, override the <code>initializeMacroCommand</code>
	 * method.</P>
	 * 
	 * <P>
	 * If your subclass does define a constructor, be 
	 * sure to call <code>super()</code>.</P>
	 */
	public function MacroCommand()
	{
		subCommands = new Array();
		initializeMacroCommand();			
	}
	
	/**
	 * Initialize the <code>MacroCommand</code>.
	 * 
	 * <P>
	 * In your subclass, override this method to 
	 * initialize the <code>MacroCommand</code>'s <i>SubCommand</i>  
	 * list with <code>ICommand</code> class references like 
	 * this:</P>
	 * 
	 * <listing>
	 *		// Initialize MyMacroCommand
	 *		override private function initializeMacroCommand( ) : Void
	 *		{
	 *			addSubCommand( com.me.myapp.controller.FirstCommand );
	 *			addSubCommand( com.me.myapp.controller.SecondCommand );
	 *			addSubCommand( com.me.myapp.controller.ThirdCommand );
	 *		}
	 * </listing>
	 * 
	 * <P>
	 * Note that <i>SubCommand</i>s may be any <code>ICommand</code> implementor,
	 * <code>MacroCommand</code>s or <code>SimpleCommands</code> are both acceptable.
	 */
	private function initializeMacroCommand() : Void
	{
	}
	
	/**
	 * Add a <i>SubCommand</i>.
	 * 
	 * <P>
	 * The <i>SubCommands</i> will be called in First In/First Out (FIFO)
	 * order.</P>
	 * 
	 * @param commandClassRef a reference to the <code>Class</code> of the <code>ICommand</code>.
	 *
	 * AS2 Note: Unlike the AS3 version, we are passing in an instance of an ICommand rather than a class ref.
	 */
	private function addSubCommand( command:ICommand ): Void
	{
		subCommands.push(command);
	}
	
	/** 
	 * Execute this <code>MacroCommand</code>'s <i>SubCommands</i>.
	 * 
	 * <P>
	 * The <i>SubCommands</i> will be called in First In/First Out (FIFO)
	 * order. 
	 * <P>
	 * AS2 Note: This method loops through the children executing them in order
	 * rather than shifting them from the stack as the AS3 version does. 
	 * This is because in AS2 we cannot pass a class name and create commands 
	 * dynamically, so MacroCommands and SimpleCommands are created once and 
	 * reused. A caveat of course is that ICommands in AS2 should not keep 
	 * state. This is not a problem in AS3, where fresh commands are used each
	 * time.
	 * 
	 * @param notification the <code>INotification</code> object to be passsed to each <i>SubCommand</i>.
	 */
	public function execute( notification:INotification ) : Void
	{
		for ( var i:Number=0; i < subCommands.length; i++) {
			var command:ICommand = ICommand(subCommands[i]);
			command.execute( notification );
		}
	}
								
}