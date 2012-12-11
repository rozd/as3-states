package org.log5f.as3.states.transition
{
	import org.log5f.as3.states.core.State;

	public interface StateTransition
	{
		function get init():State;
		
		function get dest():State;
		
		function perform():void;
		
		function complete(handler:Function):StateTransition;
		
		function error(handler:Function):StateTransition;
	}
}