package org.log5f.as3.states.core
{
	public interface State
	{
		function get name():String;
		function set name(value:String):void;
		
		function get overrides():Vector.<Override>;
		function set overrides(value:Vector.<Override>):void;
		
		function apply():void;
	}
}