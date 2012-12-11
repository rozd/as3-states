package org.log5f.as3.states.builder
{
	public interface StateOverrideBuilder
	{
		function move(x:Number, y:Number):StateOverrideBuilder;
		
		function x(x:Number):StateOverrideBuilder;

		function y(x:Number):StateOverrideBuilder;
		
		function size(w:Number, h:Number):StateOverrideBuilder;
		
		function width(value:Number):StateOverrideBuilder;
		
		function height(h:Number):StateOverrideBuilder;
		
		function set(prop:String, value:Object):StateOverrideBuilder;
		
		function call(method:String, args:Array):StateOverrideBuilder;
		
		function enable():StateOverrideBuilder;
		
		function disable():StateOverrideBuilder;
		
		function on(event:String, handler:Function):StateOverrideBuilder;
		
		function handle(event:String, handler:Function):StateOverrideBuilder;
		
		function text(value:String):StateOverrideBuilder;
		
		function end():StateBuilder;
	}
}