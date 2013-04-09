package ds.iterators
{
	import ds.DLinkedList;
	import ds.nodes.DListNode;
	
	/**
	 * 
	    // loop through the list while the iterator is valid.
		for( itr.start(); itr.valid(); itr.next() )
		{
			trace(itr.data());
		}
	 */
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
			if(list)
				node = list.head;
		}
		public function end():void
		{
			if(list)
				node = list.tail;
		}
		public function next():void
		{
			if(node)
				node = node.next;
		}
		public function prev():void
		{
			if(node)
				node = node.prev;
		}
		
		public function valid():Boolean
		{
			return node != null;
		}
		public function get data():*
		{
			if(node)
				return node.data;
			return null;
		}
		public function equalTo(iterator:DListIterator):Boolean
		{
			return node == iterator.node && list == iterator.list;
		}
	}
}