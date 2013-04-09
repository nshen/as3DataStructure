package ds
{
	import ds.iterators.DListIterator;
	import ds.nodes.DListNode;
	/**
	 *  双向链表
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
			   head = tail = new DListNode(args[0]);
			   _length++ ;
			   if(l>1)
			   {
				 for(var i:uint = 1 ; i < l; i++)
					 push(args[i]);
			   }
		   }
		 }
				
		/**
		 *  根据索引取元素，由于需要遍历所以比数组慢很多
		 */
		public function getData(p_index:uint):*
		{
			var n:DListNode = getListNode(p_index);
			return n == null ? null : n.data;
		}
		/**
		 *  根据索赋值元素，由于需要遍历所以比数组慢很多
		 */
		public function setData(p_index:uint , obj:*):*
		{
			var n:DListNode = getListNode(p_index);
			if (n)
			  n.data = obj;
		}
		

		/**
		 * 添加一个元素到队尾
		 * @param	obj
		 * @return
		 */
		public function push(obj:*):DListNode
		{
			if (obj == null)
				return null;
			if (_length > 0)
			{
				tail.insertAfter(obj);
				tail = tail.next;
			}else
			{
				head = tail = new DListNode(obj);
			}
			_length++;
			return tail;
		}
		
		/**
		 *  删除队尾元素
		 */
		public function pop():DListNode
		{
			if (_length <= 0) 
			   return null;
			   
			var d:DListNode = tail;
			if(this._length == 1)
				head = tail = null;
			else
			{
				tail = tail.prev;
				tail.next = null;
			}
			_length--;
			return d;
		}
		
		/** 
		 * 删除第一个元素
		 */
		public function shift():DListNode
		{
			if (_length <= 0)
			   return null;
			   
			var d:DListNode = head;
			if (_length == 1)
			{
				head = tail = null;
			}else
			{
				head = head.next;
				head.prev = null;
			}
			_length--;
			return d;
			
		}
		
		/**
		 *  在队头添加一个元素
		 */
		public function unshift(obj:*):DListNode
		{
			if (obj == null)
				return null;
			if (_length > 0)
			{
				head.insertBefore(obj);
				head = head.prev;
			}else
			{
				head = tail = new DListNode(obj);
			}
			_length++;
			return head;
		}
		
		/**
		 * 在iterator后插入数据，如果iterator是invalid的则push到对尾
		 * @param	iterator
		 * @param	obj
		 */
		public function insertAfter( iterator:DListIterator , obj:*):void
		{
			if (iterator && iterator.node != null)
			{
				iterator.node.insertAfter(obj);
				if (iterator.node == tail)
				  tail = tail.next;
				  
				_length ++ ;
			}else
			{
				push(obj);
			}
		}
		
		/**
		 * 在iterator前插入数据，如果iterator是invalid的则unshift到队首
		 * @param	iterator
		 * @param	obj
		 */
		public function insertBefore( iterator:DListIterator , obj:*):void
		{
			if (iterator && iterator.node != null)
			{
				iterator.node.insertBefore(obj);
				if (iterator.node == head)
				  head = head.prev;
				  
				_length ++;
			}else {
				unshift(obj);
			}
		}
			 
		/**
		 * 删除iterator指定节点，并把iterator向后移一位。
		 * @param	iterator
		 */
		public function remove( iterator:DListIterator ):void
		{
			if (!iterator || !iterator.node)
				return;
				
			var node:DListNode = iterator.node;
			if (node == head)
				head = head.next;
			else if (node == tail)
				tail = tail.prev;
			iterator.next();
			node.delink();
			
			if (head == null)
			  tail = null;
			
			_length --;
		}

		
		/**
		 *  取得元素个数
		 */
		public function get length():uint
		{
			return _length;
		}
		
		/**
		 * 取iterator，默认指向head
		 * @param	node
		 * @return
		 */
		public function getIterator(node:DListNode = null ):DListIterator
		{
			return new DListIterator(this, node == null? head : node);
		}

	   /**
		* @param	p_index
		* @return  DListNode
		*/
	   public function getListNode(p_index:uint):DListNode
	   {
		   if (_length <= 0 || p_index < 0 || p_index > _length-1)return null;
		   var n:DListNode = head;
		   var i:uint = 0;
		   while (i < p_index)
		   {
			   i++;
			   n = n.next;
		   }
		   return n;	
	   }
	   
	   public function toString():String
	   {
			var str:String = "[";
			var n:DListNode = this.head;
			while(n)
			{
				str += n.toString();
				if(n!= this.tail)
					str+=",";
				
				n = n.next;
			}
			str += "]";
			return str;
		}
	}

}


