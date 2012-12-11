package org.log5f.as3.states.overrides
{
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNull;

	public class SetPropertyTest
	{
		private var holder:Object;
		private var override:SetProperty;
		
		[Before]
		public function setUp():void
		{
			holder = {};
			override = new SetProperty();
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
			override.setup(holder, "name");
			
			override.apply("TestName");
				
			assertEquals("TestName", holder.name);
		}
		
		[Test]
		public function revert_undefined():void
		{
			override.setup(holder, "name");
			
			override.apply("TestName");
			
			override.revert();
			
			assertThat(holder.name is undefined);
		}
		
		[Test]
		public function revert_null():void
		{
			holder.name = null;
			
			override.setup(holder, "name");
			
			override.apply("TestName");
			
			override.revert();
			
			assertNull(holder.name);
		}

		[Test]
		public function revert_value():void
		{
			holder.name = "OldName";
			
			override.setup(holder, "name");
			
			override.apply("TestName");
			
			override.revert();
			
			assertEquals("OldName", holder.name);
		}
	}
}