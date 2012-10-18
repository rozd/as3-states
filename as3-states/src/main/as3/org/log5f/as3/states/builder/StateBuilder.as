package org.log5f.as3.states.builder
{
	public interface StateBuilder
	{
		function child(name:String):StatePart;
		
		function add(name:String, instance:Object):StatePart;
		
		function remove(name:String):StatePart;
	}
}