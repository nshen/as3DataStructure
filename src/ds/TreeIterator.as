package ds
{
	public class TreeIterator
	{
		public var node:Tree = null
		private var _childItr:DListIterator;
		public function TreeIterator(Node:Tree):void
		{
			this.node = Node;
			resetChildren()
		}
		
		public function appendChild(obj:*):void
		{
			new Tree(obj,node)
			if(node.children.length==1)this._childItr.start()
		}
		
		/**
		 * Prepends a child node to the child list.
		 * 
		 * @param obj The data to prepend as a child node.
		 */
		public function prependChild(obj:*):void
		{
			var childNode:Tree = new Tree(obj, null);
			childNode.parent = node;
			node.children.unshift(childNode);
			
			if (node.children.length == 1)this._childItr.start()
		}
		
		public function root():void
		{
			if(node)
			{
				while(node.parent)
				{
					node = node.parent
				}
				this.resetChildren()
			}
		}
		
		
		public function up():void
		{
			if(this.node)this.node= this.node.parent
			resetChildren()
		}
		public function down():void
		{
			if(_childItr.hasNext())
			{
				this.node = _childItr.node.data
				resetChildren()
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
		
		
		private function resetChildren():void
		{
			if(this.node)
			{
				this._childItr = this.node.children.getIterator();
			}else
			{
				this._childItr = null
			}
		}
	}
}