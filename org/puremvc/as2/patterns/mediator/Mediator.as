﻿/*
 PureMVC AS2 Port originally by Pedr Browne 
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
import org.puremvc.as2.interfaces.*;
import org.puremvc.as2.patterns.observer.*;
import org.puremvc.as2.patterns.facade.Facade;

class org.puremvc.as2.patterns.mediator.Mediator extends Notifier implements IMediator, INotifier
{
	/**
	 * A base <code>IMediator</code> implementation. 
	 * 
	 * @see org.puremvc.as2.core.view.View View
	 */
	

		/**
		 * The name of the <code>Mediator</code>. 
		 * 
		 * <P>
		 * Typically, a <code>Mediator</code> will be written to serve
		 * one specific control or group controls and so,
		 * will not have a need to be dynamically named.</P>
		 */
		public static var NAME : String = 'Mediator';
		
		/**
		 * Constructor.
		 */
		public function Mediator( viewComponent : Object) {
			this.viewComponent = viewComponent;	
		}

		/**
		 * Get the name of the <code>Mediator</code>.
		 * <P>
		 * Override in subclass!</P>
		 */		
		public function getMediatorName() : String 
		{	
			return Mediator.NAME;
		}

		/**
		 * Get the <code>Mediator</code>'s view component.
		 * 
		 * <P>
		 * Additionally, an implicit getter will usually
		 * be defined in the subclass that casts the view 
		 * object to a type, like this:</P>
		 * 
		 * <listing>
		 *		private function get comboBox : mx.controls.ComboBox 
		 *		{
		 *			return viewComponent as mx.controls.ComboBox;
		 *		}
		 * </listing>
		 */		
		public function getViewComponent() : Object
		{	
			return viewComponent;
		}

		/**
		 * List the <code>INotification</code> names this
		 * <code>Mediator</code> is interested in being notified of.
		 * 
		 * @return Array the list of <code>INotification</code> names 
		 */
		public function listNotificationInterests() : Array 
		{
			return [ ];
		}

		/**
		 * Handle <code>INotification</code>s.
		 * 
		 * <P>
		 * Typically this will be handled in a switch statement,
		 * with one 'case' entry per <code>INotification</code>
		 * the <code>Mediator</code> is interested in.
		 */ 
		public function handleNotification( notification:INotification ) : Void {}
		
		// The view component
		private var viewComponent : Object;
	
}