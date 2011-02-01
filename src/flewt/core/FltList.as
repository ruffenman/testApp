package flewt.core 
{
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltList
	{		
		public function FltList() 
		{
			_length = 0;
		}
		
		public function pushBack(object:*):void
		{
			//if there is a tail (at least one node)
			if (_tail)
			{
				//add new node after tail
				_tail._next = new FltListNode(object);
				_tail._next._prev = _tail;
				_tail = _tail._next;
			}
			//else there is no tail and the list is empty
			else
			{
				//create first node
				_head = _tail = new FltListNode(object);
			}
			
			_tail._parent = this;
			
			//increase length by one
			_length++;
		}
		
		public function pushFront(object:*):void
		{
			//if there is a head (at least one node)
			if (_head)
			{
				//add new node before head
				_head.prev = new FltListNode(object);
				_head.prev.next = _head;
				_head = _head.prev;
			}
			//else there is no head and the list is empty
			else
			{
				//create first node
				_head = _tail = new FltListNode(object);
			}
			
			_head._parent = this;
			
			//increase length by one
			_length++;
		}
		
		public function popBack():*
		{
			var object:*;
			
			//if there is a tail (at least one object)
			if (_tail)
			{
				//get object to return
				object = _tail._object;
				
				//remove node from list
				removeNode(_tail);
			}
			else
			{
				throw new RangeError("Tried to pop an item from an empty list");
			}
			
			return object;
		}
		
		public function popFront():*
		{
			var object:*;
			
			//if there is a head (at least one object)
			if (_head)
			{
				//store object to return
				object = _head._object;
				
				//remove node from list
				removeNode(_head);
			}
			else
			{
				throw new RangeError("Tried to pop an item from an empty list");
			}
			
			return object;
		}		
		
		public function removeNode(node:FltListNode):void
		{
			//if this node is a member of this list
			if (node._parent == this)
			{
				var prev:FltListNode = node._prev;
				var next:FltListNode = node._next;
				
				//if there is a previous node
				if (prev)
				{
					prev._next = next;
				}
				//else removing head node
				else
				{
					_head = next;
				}
				
				//if there is a next node
				if (next)
				{
					next._prev = prev;
				}
				//else removing tail node
				else
				{
					_tail = prev;
				}
				
				node._next = null;
				node._prev = null;
				node._object = null;
				node._parent = null;
				
				//decrement list count
				_length--;
			}
			else
			{
				throw new Error("Tried to remove a node from a list it didn't belong to");
			}
		}
		
		public function find(object:*):FltListNode
		{
			var iter:FltListNode = _head;
			
			while (iter)
			{
				if (iter.object == object)
				{
					return iter;
				}
				
				iter = iter.next;
			}
			
			return null;
		}
		
		public function get back():*
		{
			if (_tail)
			{
				return _tail.object;
			}
			else
			{
				throw new RangeError("Tried to get an item from an empty list");
				return null;
			}
		}
		
		public function get front():*
		{
			if (_head)
			{
				return _head.object;
			}
			else
			{
				throw new RangeError("Tried to get an item from an empty list");
				return null;
			}
		}
		
		public function get head():FltListNode
		{
			return _head;
		}
		
		public function get tail():FltListNode
		{
			return _tail;
		}
		
		public function get length():int
		{
			return _length;
		}
		
		private var _head:FltListNode;
		private var _tail:FltListNode;
		private var _length:int;
	}

}