package org.log5f.as3.states.transition
{
	public interface StateTransition
	{
		function complete(handler:Function):StateTransition;
		
		function error(handler:Function):StateTransition;
	}
}