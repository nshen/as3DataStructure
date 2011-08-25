package ds
{
	public class Graph
	{
		public var nodes:Array
		public var count:int
		public function Graph()
		{
			this.nodes = []
			count = 0;
		}
		
		/**
		 * 向图中添加一个GraphNode
		 * @return 成功true否则false
		 */
		public function addNode(node:GraphNode,index:int):Boolean
		{
			if(this.nodes[index])return false
			nodes[index] = node
			return true;
		}
		
		/** 
		 * 删除index指定的Node
		 * @return 成功ture，否则false
		 */
		public function removeNode(index:int):Boolean
		{
			var node:GraphNode = this.nodes[index]
			if(!node)return false;
			var l:int = this.nodes.length
			for(var i:int = 0 ; i< l ; i++)
			{
				if(this.nodes[i].getArc(node))
				{ //删除所有指向node的arc
					this.removeArc(i,index);
				}
			}
			this.nodes.splice(index,1)
            return true
		};
		
		public function getNode(index:int):GraphNode
		{
			return this.nodes[index]
			
		}
		
		
		/**
		 * 添加一个从p_fromIndex到p_toIndex的arc
		 * @param p_fromIndex 原node索引
		 * @param p_toIndex   指向的node索引
		 * @param p_weight    arc的重量(weight)
		 * @return 成功true，否则false
		 */
		public function addArc(p_fromIndex:int , p_toIndex:int,p_weight:int=1):Boolean
		{
			var from:GraphNode = this.nodes[p_fromIndex];
			var to:GraphNode = this.nodes[p_toIndex];
			if(from && to)
			{
				if(from.getArc(to))return false
				from.addArc(to,p_weight);
				return true
			}
			return false
		}
		
		/**
		 * 删除从p_fromIndex到p_toIndex的Arc
		 * @return 删除成功true，否则false
		 */
		public function removeArc(p_fromIndex:int,p_toIndex:int):Boolean
		{
			var from:GraphNode = this.nodes[p_fromIndex];
			var to:GraphNode = this.nodes[p_toIndex];
			if(from && to)
			{
				from.removeArc(to)
				return true
			}
			return false
		}
		
		/**
		 * 取得从p_fromIndex到p_toIndex的arc
		 * @return 如果没有返回null
		 */
		public function getArc(p_fromIndex:int, p_toIndex:int):GraphArc
		{
			var from:GraphNode = this.nodes[p_fromIndex];
			var to:GraphNode = this.nodes[p_toIndex];
			if(from && to) return from.getArc(to);
			return null
		}
		
		/**
		 * 遍历之前要先调用此函数清空节点标记
		 */
		public function clearMarks():void
		{
		    for each (var n:GraphNode in  this.nodes)
			{
				if(n)n.marked = false
			}
		}
		
		/**
		 * 深度优先遍历
		 */
		public function depthFirst(p_node:GraphNode , p_process:Function):void
		{
			if(!p_node)return;
			p_process(p_node);
			p_node.marked = true;
			var arcs:Array = p_node.arcs
			var l:int = arcs.length	
			for(var i:int = 0 ; i<l; i++)
			{
				if(  !GraphArc(arcs[i]).targetNode.marked)
				{
				     depthFirst(GraphArc(arcs[i]).targetNode,p_process)
				}
			}
		}
		/**
		 * 广度优先遍历
		 */
		public function breadFirst(p_node:GraphNode,  p_process:Function):void
		{
			if(!p_node)return
			var queue:DLinkedList = new DLinkedList()
			var itr:DListIterator =  queue.getIterator()
			queue.push(p_node)
			p_node.marked = true
			while(queue.length>0)
			{
				p_process(queue.head)
				var arcs:Array = GraphNode(queue.head.data).arcs
				for(var i:int= 0 ; i< arcs.length;i++)
				{
					if(!GraphArc(arcs[i]).targetNode.marked)
					{
						GraphArc(arcs[i]).targetNode.marked = true
						queue.push(GraphArc(arcs[i]).targetNode)
					}
				}
				queue.shift()
			}
				
				
		}//-
		
		
		
	}
}