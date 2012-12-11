package org.log5f.as3.states.builder
{
	public interface StateHandlerBuilder
	{
		function add(handler:Function):StateOverrideBuilder;
		
		function remove(handler:Function):StateOverrideBuilder;
	}
}