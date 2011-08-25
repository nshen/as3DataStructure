package ds
{
	public class Tree
	{
		public var node:Tree
		public var children:DLinkedList
		public var parent:Tree
		
		public var data:*;
		public function Tree(Obj:*,Parent:Tree=null)
		{
			this.data = Obj
			this.children = new DLinkedList()
			this.parent = Parent;
			if(this.parent)
			{
				this.parent = Parent;
				this.parent.children.push(this)
			}
		}
		
		public function isRoot():Boolean
		{
			return this.parent==null;
		}
		public function isLeaf():Boolean
		{
			return this.children.length==0;
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
		
		public function get length():uint
		{
			var c:uint = 1
			var itr:DListIterator = this.children.getIterator()
				
			while(itr.hasNext())
			{				
				c+= Tree(itr.node.data).length;
				itr.next()
			}
			return c;
		}
		
		/**
		 * 前序遍历
		 */
		public function preorder(Node:Tree,Process:Function):void
		{
			Process(Node)
			var itr:DListIterator = Node.children.getIterator()
			while(itr.hasNext())
			{
				preorder(Tree(itr.node.data),Process)
				itr.next();
			}
		}
		
		//非递归
		public function preorder2(Node:Tree,Process:Function):void
		{
			var stack:Array = [Node]
			while(stack.length>0)
			{
				var t:Tree = stack.pop()
				Process(t)
				var itr:DListIterator = t.children.getIterator()
				itr.end()
				while(itr.hasPrev())
				{
					stack.push(Tree(itr.node.data))
					itr.prev();
				}
			}
		}
		
		/**
		 * 后序遍历
		 */
		public function postorder(Node:Tree,Process:Function):void
		{
			var itr:DListIterator =  Node.children.getIterator()
			while(itr.hasNext())
			{
				postorder(Tree(itr.node.data),Process)
			}
			Process(Node)
		  	
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
		 * 输出xml能直接赋值给Flex的Tree组件的dataProvider属性
		 * 
		 * 这段代码谁能看懂我服他，我自己都看不太懂，有好方法记得通知我。。。
		 */
		public function toXML(Node:Tree):XML
		{
			var xmlStack:Array=[ ]
			var stack:Array = [Node]
			var s:String = ""
		
			while(stack.length>0)
			{
				
				var t:* = stack.pop()
				if(t is String)
				{
					s+=t
				}else
				{
					t = Tree(t)
					s+="<node label='"+t.data+"'>"
					if(t.children.length>0)
					{
						stack.push("</node>")
					}else
					{
						s+="</node>"
					}
					var itr:DListIterator = t.children.getIterator()
					itr.end()
					while(itr.hasPrev())
					{
						stack.push(Tree(itr.node.data))
						itr.prev();
					}
				}
			}	
			return new XML(s);
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