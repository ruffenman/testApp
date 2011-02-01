package flewt.core 
{
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltListNode 
	{		
		public function FltListNode(object:*) 
		{
			_object = object;
		}
		
		public function get prev():FltListNode
		{
			return _prev;
		}
		
		public function get next():FltListNode
		{
			return _next;
		}
		
		public function get object():*
		{
			return _object;
		}
		
		internal var _prev:FltListNode;
		internal var _next:FltListNode;		
		internal var _object:*;
		internal var _parent:FltList;
	}

}