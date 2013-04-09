package ds.nodes 
{
	public class DListNode
	{
		public var data:* ;
		public var next:DListNode = null;
		public var prev:DListNode = null;
		
		public function DListNode(Data:*):void
		{
			this.data = Data;
		}
		
		/**
		 * 从list中删除此节点
		 */
		public function delink():void
		{
			if (prev)
			  prev.next = next;
			if (next)
			  next.prev = prev;
		}
		
		public function insertAfter(data:*):void
		{
			var node:DListNode = new DListNode(data);
			node.next = next;
			node.prev = this;
			
			if (next != null)
			  next.prev = node;
			
			next = node;
		}
		
		public function insertBefore(data:*):void
		{
			var node:DListNode = new DListNode(data);
			node.next = this;
			node.prev = prev;
			
			if (prev)
			  prev.next = node;
			prev = node;
		}
		
		
		public function toString():String
		{
			return this.data.toString();
		}
	}

}