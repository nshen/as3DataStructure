package ds
{
	public class GraphArc
	{
		
		public var targetNode:GraphNode;
		public var weight:*; //通常为Number
		
		public function GraphArc(p_target:GraphNode,p_weight:*):void
		{
			this.targetNode = p_target;
			this.weight = p_weight;
		}
	}
}