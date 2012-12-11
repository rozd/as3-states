package org.log5f.as3.states.overrides
{
	import flash.events.Event;
	
	import flexunit.framework.Assert;
	
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.verify;
	
	import org.flexunit.async.Async;
	
	public class CallMethodTest
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
			mock(holder).method("testMethod").args("one", 2);
			
			const override:CallMethod = new CallMethod();
			override.setup(holder, "testMethod");
			
			override.apply(["one", 2]);
			
			verify(holder);
		}
		
		[Test]
		public function revert():void
		{
			Assert.fail("Test method Not yet implemented");
		}
	}
}