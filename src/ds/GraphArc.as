package ds
{
	public class GraphArc
	{
		
		public var targetNode:GraphNode;
		public var weight:Number
		
		public function GraphArc(p_target:GraphNode,p_weight:Number)
		{
			this.targetNode = p_target;
			this.weight = p_weight;
			
		}
	}
}