package org.log5f.as3.states.core
{
	public interface Override
	{
		function setup(holder:Object, member:String):void;
		
		function apply(value:Object=null):void;
		
		function revert():void;
	}
}