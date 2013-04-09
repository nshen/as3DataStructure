package ds.iterators
{
	import ds.Tree;
	public class TreeIterator
	{
		public var node:Tree = null;
		private var _childItr:DListIterator;
		
		public function TreeIterator(Node:Tree):void
		{
			this.node = Node;
			resetChildIterator();
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
		
		public function get childData():Tree 
		{
			return Tree(_childItr.data);
		}
		
		public function root():void
		{
			if(node)
			{
				while(node.parent)
				{
					node = node.parent;
				}
				resetChildIterator();
			}
		}
		
		public function up():void
		{
			if (node) 
				node = node.parent;
			resetChildIterator()
		}
		
		public function down():void
		{
			if(_childItr.valid())
			{
				node = _childItr.node.data as Tree;
				resetChildIterator()
			}
		}
		
		/**
		 * Moves the child iterator forward by one position.
		 */
		public function nextChild():void
		{
			_childItr.next()
		}
		
		/**
		 * Moves the child iterator back by one position.
		 */
		public function prevChild():void
		{
			_childItr.prev();
		}
		
		/**
		 * Moves the child iterator to the first child.
		 */
		public function childStart():void
		{
			_childItr.start();
		}
		
	   /**
		* Moves the child iterator to the last child.
		*/
	   public function childEnd():void
	   {
		   _childItr.end();
	   }
		
		public function childValid():Boolean
		{
			return _childItr.valid();
		}
		
		
		public function appendChild(obj:*):void
		{
			new Tree(obj, node);
			//如果没append之前没有children，则应重设置一下childItr
			if (node.children.length == 1)
				_childItr.start();
		}
		
		
		public function prependChild(obj:*):void
		{
			var childNode:Tree = new Tree(obj, null);
			childNode.parent = node;
			node.children.unshift(childNode);
			
			//如果没prependChild之前children是空的，则应重设置一下childItr
			if (node.children.length == 1)_childItr.start();
		}
		
		public function insertChildAfter( obj:*):void
		{
			if (node)
			{
				var child:Tree = new Tree(obj);
				child.parent = node;
				node.children.insertAfter(_childItr , child);
			}
		}
		
		public function insertChildBefore(obj:*):void
		{
			if (node)
			{
				var child:Tree = new Tree(obj);
				child.parent = node;
				node.children.insertBefore(_childItr, child);
			}
		}
		
		private function resetChildIterator():void
		{
			if(node)
			{
				_childItr = node.children.getIterator();
			}else
			{
				_childItr.list = null;
				_childItr.node = null;
			}
		}
	}
}