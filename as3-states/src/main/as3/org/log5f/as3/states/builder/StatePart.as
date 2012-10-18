package org.log5f.as3.states.builder
{
	public interface StatePart
	{
		function move(x:Number, y:Number):StatePart;
		
		function x(x:Number):StatePart;

		function y(x:Number):StatePart;
		
		function size(w:Number, h:Number):StatePart;
		
		function width(w:Number, h:Number):StatePart;
		
		function height(h:Number):StatePart;
		
		function set(prop:String, value:Object):StatePart;
		
		function enable():StatePart;
		
		function disable():StatePart;
		
		function handle(event:String, handler:Function):StatePart;
		
		function end():StatePart;
	}
}