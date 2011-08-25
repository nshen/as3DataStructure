package ds
{
	public class GraphNode
	{
		public var data:*
		public var arcs:Array
		public var marked:Boolean  
			
		public function GraphNode(obj:*):void
		{
			this.data = obj
		    this.arcs = []
			this.marked = false
		}
		
		/**
		 * 添加一个从当前GraphNode到目标GraphNode的Arc
		 * @param p_node 目标GraphNode
		 * @param p_weight 该Arc的重量(weight)
		 */
		public function addArc(p_node:GraphNode , p_weight:Number):void
		{
			this.arcs.push(new GraphArc(p_node,p_weight));
		}
		
		/**
		 * 删除指向p_targetNode的Arc
		 * @return 如果删除成功返回true，否则false
		 */
		public function removeArc(p_targetNode:GraphNode):Boolean
		{
			var l:int = this.arcs.length
			for(var i:int = 0 ; i< l; i++)
			{
				if(arcs[i]==p_targetNode)
				{
					arcs.splice(i,1)
					return true
				}
			}
			return false;
		}
		
		
		/**
		 * 返回指向p_targetNode的Arc
		 * @return 如果没有则返回null
		 */
		public function getArc(p_targetNode:GraphNode):GraphArc
		{
			var l:int = this.arcs.length
			for each (var arc:GraphArc in this.arcs)
			{
				if(arc.targetNode == p_targetNode)
				{
					return arc
				}
			}
			return null
		}
		
	}
}