package org.log5f.as3.states
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mockolate.mock;
	import mockolate.nice;
	import mockolate.prepare;
	import mockolate.stub;
	import mockolate.verify;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	import org.hamcrest.object.instanceOf;
	
	public class ProofOfConceptTest
	{
		private var tf:TextFormat;
		
		private var titleLabel:TextField;
		
		private var greetingLabel:TextField;

		private var holder:DisplayObjectContainer
		
		[Before(async, timeout=5000)]
		public function setUp():void
		{
			Async.proceedOnEvent(this, prepare(DisplayObject, TextField), Event.COMPLETE);
			
			tf = new TextFormat("TestFontFamily");
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[Test]
		public function go_initial():void
		{
			titleLabel = nice(TextField);
			titleLabel.name = "titleLabel";
			
			holder = nice(DisplayObjectContainer);
			stub(holder).getter("titleLabel").returns(titleLabel);
			holder.addChild(titleLabel);
			
			States.host(holder)
				.state("initial")
					.child("titleLabel")
						.x(10).y(23)
						.width(100).height(100)
						.text("Initial State")
						.call("setTextFormat", [tf])
					.end()
					.add("greetingLabel", new TextField())
						.set("width", 100)
						.handle("addedToStage", Async.asyncHandler(this, greetingLabel_addedToStageHandler, 500))
					.end()
				.build()
			
			mock(titleLabel).setter("x").arg(10);
			mock(titleLabel).setter("width").arg(100);
			mock(titleLabel).setter("height").arg(100);
			mock(titleLabel).setter("text").arg("Initial State");
			mock(titleLabel).method("setTextFormat").args(tf);
			
			mock(holder).method("addChild").args(instanceOf(TextField));
			mock(holder).setter("greetingLabel").arg(instanceOf(TextField));
			
			States.host(holder).go("initial");
			
			verify(holder);
			verify(titleLabel);
		}

		[Test]
		public function go_disabled():void
		{
			States.host(holder)
				.state("disabled")
					.child("titleLabel")
						.disable()
					.end()
				.build();
			
			mock(titleLabel).setter("enabled").arg(false);
			
			States.host(holder).go("disabled");
		}

		private function greetingLabel_addedToStageHandler(event:Event):void
		{
			assertEquals("greetingLabel", event.target.name);
		}
	}
}