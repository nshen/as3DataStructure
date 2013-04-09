package ds
{
	import ds.iterators.DListIterator;
	import ds.iterators.TreeIterator;
	
	public class Tree
	{
		public var node:Tree;
		public var children:DLinkedList;
		public var parent:Tree;
		public var data:*;
		
		public function Tree(Obj:* , Parent:Tree = null)
		{
			data = Obj;
			children = new DLinkedList();
			parent = Parent;
			if(parent)
				parent.children.push(this);
		}
		
		public function isRoot():Boolean
		{
			return parent == null;
		}
		
		public function isLeaf():Boolean
		{
			return children.length == 0;
		}
		
		/**
		 * 计算这个节点的深度
		 */
		public function get depth():int
		{
			if (!parent) return 0;
			
			var node:Tree = this, c:int = 0;
			while (node.parent)
			{
				c++;
				node = node.parent;
			}
			return c;
		}
		
		
		/**
		 * 返回整个tree的节点数
		 */
		public function get length():uint
		{
			var c:uint = 1;
			var itr:DListIterator = this.children.getIterator();
				
			while(itr.valid())
			{				
				c += Tree(itr.node.data).length;
				itr.next();
			}
			return c;
		}
		
		/**
		 * 前序遍历
		 */
		public function preorder(Node:Tree,Process:Function):void
		{
			Process(Node);
			var itr:DListIterator = Node.children.getIterator();
			while(itr.valid())
			{
				preorder(Tree(itr.node.data), Process);
				itr.next();
			}
		}
		
		
		/**
		 * 后序遍历
		 */
		public function postorder(Node:Tree,Process:Function):void
		{
			var itr:DListIterator =  Node.children.getIterator();
			while(itr.valid())
			{
				postorder(Tree(itr.node.data), Process)
				itr.next();
			}
			Process(Node);
		  	
		}
		
		
		/**
		 * Prints out a string representing the current object.
		 * 
		 * @return A string representing the current object.
		 */
		public function toString():String
		{
			var s:String = "[TreeNode >" + (parent == null ? "(root)" : "");
			
			if (children.length == 0)
				s += "(leaf)";
			else
				s += " has " + children.length + " child node" + (length > 1 || length == 0 ? "s" : "");
			
			s += ", data=" + data + "]";	
			
			return s;
		}
		
		/**
		 * 	递归实现，感谢madcloudsong   http://madcloudsong.com/articles/110
		 * @return 输出的xml能直接赋值给Flex的Tree组件的dataProvider属性
		 */
		public function toXML(Node:Tree = null):XML
		{
			if (!Node)
				Node = this;
			
			var xml:XML = <node></node>;
			xml.@label = Node.data.toString();
			
			if (Node.children.length > 0)
			{
				for ( var itr:DListIterator = Node.children.getIterator(); itr.valid(); itr.next())
					xml.appendChild( Tree(itr.data).toXML());
			}
			return xml;
		}
	
		
		/**
		 * Prints out all elements (for debug/demo purposes).
		 * 
		 * @return A human-readable representation of the structure.
		 */
		public function dump():String
		{
			var s:String = "";
			this.preorder(this, function(node:Tree):void
			{
				var d:int = node.depth;
				
				for (var i:int = 0; i < d; i++)
				{
					if (i == d - 1)
						s += "+---";
					else
						s += "|    ";
				}
				s += node + "\n";
			});
			return s;
		}
		
		
		/**
		 *  Get iterator
		 */
		public function getIterator():TreeIterator 
		{
			return new TreeIterator(this);
		}
	}
}