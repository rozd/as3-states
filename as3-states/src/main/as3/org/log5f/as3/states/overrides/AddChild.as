package org.log5f.as3.states.overrides
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import org.log5f.as3.states.core.Override;
	import org.log5f.as3.states.utils.Factory;

	public class AddChild implements Override
	{
		//----------------------------------------------------------------------
		//
		//	Constructor
		//
		//----------------------------------------------------------------------
		
		public function AddChild()
		{
			super();
		}
		
		//----------------------------------------------------------------------
		//
		//	Variables
		//
		//----------------------------------------------------------------------
		
		private var holder:DisplayObjectContainer;
		
		private var member:String;
		
		private var oldChild:DisplayObject;
		
		//----------------------------------------------------------------------
		//
		//	Methods
		//
		//----------------------------------------------------------------------
		
		//-----------------------------------
		//	Methods: Override
		//-----------------------------------
		
		public function setup(holder:Object, member:String):void
		{
			this.holder = holder as DisplayObjectContainer;
			this.member = member;
		}
		
		public function apply(value:Object=null):void
		{
			oldChild = removeHolderChild();
			
			var child:DisplayObject;
			
			if (value is Factory)
			{
				child = Factory(value).instance() as DisplayObject;
			}
			else if (value is Class)
			{
				child = new value();
			}
			else
			{
				child = value as DisplayObject;
			}
			
			addHolderChild(child);
		}
		
		public function revert():void
		{
			removeHolderChild();
			
			addHolderChild(oldChild);
		}
		
		//-----------------------------------
		//	Methods: Internal
		//-----------------------------------
		
		private function addHolderChild(child:DisplayObject):void
		{
			if (child)
			{
				holder.addChild(child);
				holder[member] = child;
			}
		}
		
		private function removeHolderChild():DisplayObject
		{
			var child:DisplayObject = holder[member];
			
			if (child)
			{
				holder.removeChild(child);
				holder[member] = null;
			}
			
			return child;
		}
		
	}
}