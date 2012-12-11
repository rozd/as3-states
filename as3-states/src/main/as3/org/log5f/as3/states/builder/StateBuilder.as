package org.log5f.as3.states.builder
{
	import org.log5f.as3.states.core.StateHolder;

	public interface StateBuilder
	{
		function based(state:String):StateBuilder;
		
		function child(name:String):StateOverrideBuilder;
		
		function add(name:String, instance:Object):StateOverrideBuilder;
		
		function remove(name:String):StateOverrideBuilder;
		
		function build():StateHolder;
	}
}