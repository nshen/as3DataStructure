package ds
{
	/**
	 *  这是一个双向链表
	 */
	public class DLinkedList
	{
		public var head:DListNode = null;
		public var tail:DListNode = null;
		private var _length:uint = 0;
		
		
		public function DLinkedList(...args):void
		{
		   var l:uint = args.length;
		   if(l>0)
		   {
			   head = tail = new DListNode(args[0])
			   if(l>1)
			   {
				 for(var i:uint = 1 ; i<l;i++)
				 {
					 tail.next = new DListNode(args[i])
					 tail.next.prev =tail
					 tail = tail.next
				 }
			   }
			   this._length++ ;
		   }
		 }
				
		/**
		 *  根据索引取元素，由于需要遍历所以比数组慢很多
		 */
		public function get(Index:uint):*
		{
			if(this._length <=0 || Index<0 || Index>this._length-1)return null;
			var n:DListNode = this.head
			var i:uint = 0
			while(i<Index)
			{
				i++
				n=n.next
			}
			return n.data			
		}
		
		 
		/**
		 *  添加一个元素到队尾
		 */
		public function push(obj:*):*
		{
			if(this._length>0)
			{
				tail.next =  new DListNode(obj)
				tail.next.prev = tail
				tail = tail.next				
			}else
			{
				head = tail = new DListNode(obj)
			}
			this._length++
			return tail.data
		}
		
		/**
		 *  删除队尾元素
		 */
		public function pop():*
		{
			if(this._length>0)
			{  
				var d:* = tail.data
				if(this._length==1)
				{
					head = tail =null
				}else
				{				 
					tail = tail.prev
					tail.next = null
				}
				this._length--
				return d;
			}
		}
		
		/** 
		 * 删除第一个元素
		 */
		public function shift():*
		{
			if(this._length>0)
			{
				var d:* = this.head.data
				if(this._length==1)
				{
					head = tail = null
				}else
				{
					head = head.next
					head.prev = null
				}
				this._length--
				return d;
			}
			
		}
		
		/**
		 *  在对头添加一个元素
		 */
		public function unshift(obj:*):*
		{
			if(this._length>0)
			{
				head.prev =new DListNode(obj)
				head.prev.next =head
				head = head.prev;
			}else
			{
				head = tail = new DListNode(obj)
			}
			this._length++
			return head.data
		}
			 
		/**
		 *  取得元素个数
		 */
		public function get length():uint
		{
			return this._length
		}
		
		
		
		
		/**
		 *  Get iterator
		 */
		public function getIterator():DListIterator 
		{
			return new DListIterator(this, head);
		}
		
		
		public function insert(Iterator:DListIterator,obj:*):void
		{
			if(Iterator.list!=this)return
			if(Iterator.node)
			{				
				var n:DListNode =  new DListNode(obj)
					n.prev = Iterator.node
					n.next = Iterator.node.next					
				    if(Iterator.node.next)
					{
						Iterator.node.next.prev = n
					}else
					{
						tail = n
					}
					Iterator.node.next = n
					this._length++
			}else
			{
				this.push(obj);
			}
		}
		
		/**
		 * 删除Iterator.node，如果删除成功则Iterator向后移一位，如果已经到了结尾则Iterator指向head
		 */
		public function remove(Iterator:DListIterator):*
		{
			if(Iterator.list!=this)return
			var n:DListNode = Iterator.node
			if(n)
			{
				if(n==head)
				{
					head = n.next
				}else if(n==tail)
				{
					tail = tail.prev
				}
				if(n.prev)n.prev.next = n.next
				if(n.next)
				{
					n.next.prev = n.prev
					Iterator.node= n.next
				}else
				{
					Iterator.node= head
				}
				 
				n.prev = n.next = null
				this._length--
			}
			
		}
		
		public function toString():String
		{
			var str:String = "["
			var n:DListNode = this.head
			while(n)
			{
				str+= n.toString()
				if(n!=this.tail)
				{
					str+=",";
				}
				
				n=n.next
					
			}
			str+="]"
			return str;
		}
	}

}

