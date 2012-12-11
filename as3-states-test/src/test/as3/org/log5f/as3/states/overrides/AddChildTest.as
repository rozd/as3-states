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
	
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	
	public class AddChildTest
	{
		private var holder:Sprite;
		private var field:TextField;
		private var override:AddChild;
		
		[Before(async, timeout=500)]
		public function setUp():void
		{
			Async.proceedOnEvent(this, prepare(Sprite), Event.COMPLETE);
			
			override = new AddChild();
			field = new TextField();
		}
		
		[After]
		public function tearDown():void
		{
			holder = null;
			field = null;
			override = null;
		}
		
		[Test]
		public function apply():void
		{
			holder = nice(Sprite);
			stub(holder).getter("field");
			mock(holder).setter("field").arg(field);
			
			override.setup(holder, "field");
			
			override.apply(field);
			
			verify(holder);
			
			assertTrue(holder.getChildIndex(field) != -1);
		}
		
		[Test]
		public function revert():void
		{
			holder = nice(Sprite);
			mock(holder).setter("field").arg(null);
			
			override.setup(holder, "field");
			
			override.apply(field);
			
			override.revert();
			
			verify(holder);
			
			assertTrue(holder.getChildIndex(field) == -1);
		}
	}
}