package org.log5f.as3.states.overrides
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.async.Async;
	
	public class RemoveChildTest
	{
		private var holder:Sprite;
		private var field:TextField;
		private var override:RemoveChild;
		
		[Before(async, timeout=500)]
		public function setUp():void
		{
			Async.proceedOnEvent(this, prepare(Sprite), Event.COMPLETE);
			
			field = new TextField();
			override = new RemoveChild();
		}
		
		[After]
		public function tearDown():void
		{
			override = null;
			holder = null;
			field = null;
		}
		
		[Test]
		public function apply():void
		{
			holder = nice(Sprite);
			stub(holder).getter("field").returns(field);
			mock(holder).method("removeChild").args(field);
			
			override.setup(holder, "field");
			
			override.apply();
			
			verify(holder);
		}
		
		[Test]
		public function revert():void
		{
			holder = nice(Sprite);
			stub(holder).getter("field").returns(field);
			mock(holder).method("addChild").args(field);
			
			override.setup(holder, "field");
			
			override.apply();
			
			override.revert();
			
			verify(holder);
		}
	}
}