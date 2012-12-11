package org.log5f.as3.states.overrides
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	
	public class AddHandlerTest
	{
		private var holder:EventDispatcher;
		private var override:AddHandler;
		
		[Before]
		public function setUp():void
		{
			holder = new EventDispatcher();
			override = new AddHandler();
		}
		
		[After]
		public function tearDown():void
		{
			override = null;
			holder = null;
		}
		
		[Test]
		public function apply():void
		{
			override.setup(holder, "testEvent");
			
			override.apply(testHandler);
			
			assertTrue(holder.hasEventListener("testEvent"));
		}
		
		[Test]
		public function revert():void
		{
			override.setup(holder, "testEvent");
			
			override.apply(testHandler);
			
			override.revert();
			
			assertFalse(holder.hasEventListener("testEvent"));
		}
		
		private function testHandler(event:Event):void
		{
			
		}
	}
}