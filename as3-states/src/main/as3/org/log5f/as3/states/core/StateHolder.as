package org.log5f.as3.states.core
{
	import org.log5f.as3.states.builder.StateBuilder;
	import org.log5f.as3.states.transition.StateTransition;

	public interface StateHolder
	{
		function state(name:String):StateBuilder;
		
		function go(state:String):StateTransition;
		
		function normal():StateTransition;
	}
}