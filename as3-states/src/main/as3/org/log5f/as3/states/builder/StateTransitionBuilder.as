package org.log5f.as3.states.builder
{
	public interface StateTransitionBuilder
	{
		function from(state:String):StateTransitionBuilder;
		
		function to(state:String):StateTransitionBuilder;
		
		function tween():StateTransitionBuilder;
		
		function error(handler:Function):StateTransitionBuilder;
		
		function complete(handler:Function):StateTransitionBuilder;
	}
}