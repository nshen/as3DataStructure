package ds
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
		
/*		public function insertAfter(node:DListNode):void
		{
		   node.next = this.next;
		   node.prev = this;
		   if(this.next)next.prev = node;
		   this.next = node;
		};*/
		
		public function toString():String
		{
			return this.data.toString();
		}
	}
}

