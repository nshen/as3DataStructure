package ds
{
	public class DListIterator
	{
		/**
		 * The node the iterator is currently pointing to.
		 */
		public var node:DListNode;
		
		/**
		 * The list this iterator uses.
		 */
		public var list:DLinkedList;
		
		public function DListIterator(list:DLinkedList, node:DListNode = null)
		{
			this.list = list;
			this.node = node;
		}
		public function start():void
		{
			this.node = list.head
		}
		public function end():void
		{
			this.node = list.tail
		}
		public function next():void
		{
			this.node = node.next
		}
		public function prev():void
		{
			this.node = node.prev
		}
		public function hasNext():Boolean
		{
			return this.node != null
		}
		public function hasPrev():Boolean
		{
			return this.node!=null
		}
	}
}