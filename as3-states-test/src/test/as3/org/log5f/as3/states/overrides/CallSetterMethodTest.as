package org.log5f.as3.states.overrides
{
	import flash.events.Event;
	
	import flexunit.framework.Assert;
	
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.async.Async;
	
	public class CallSetterMethodTest
	{		
		[Before(async, timeout=500)]
		public function setUp():void
		{
			Async.proceedOnEvent(this, prepare(Object), Event.COMPLETE);
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[Test]
		public function apply():void
		{
			const holder:Object = nice(Object);
			mock(holder).method("setTestMethod").args("testValue");
			
			const override:CallSetterMethod = new CallSetterMethod();
			override.setup(holder, "setTestMethod");
			
			override.apply("testValue");
			
			verify(holder);
		}
		
		[Test]
		public function revert():void
		{
			const holder:Object = nice(Object);
			stub(holder).method("getTestMethod").returns("oldValue");
			mock(holder).method("setTestMethod").args("newValue");
			mock(holder).method("setTestMethod").args("oldValue");
			
			const override:CallSetterMethod = new CallSetterMethod();
			override.setup(holder, "setTestMethod");
			
			override.apply("newValue");
			
			override.revert();
			
			verify(holder);
		}
	}
}