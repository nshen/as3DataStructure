package examples.Astar
{
	import ds.Graph;
	import ds.GraphArc;
	import ds.GraphNode;
	import ds.Heap;
	

	public class Astar
	{
			
		/**
		 *   距离启发函数
		 */
		public static function distance(startNode:GraphNode,endNode:GraphNode):Number
		{
			  return  Math.sqrt( (endNode.data.x - startNode.data.x)*(endNode.data.x - startNode.data.x) + (endNode.data.y - startNode.data.y)*(endNode.data.y - startNode.data.y))
		}
		/**
		 *  曼哈顿启发函数
		 */
		public static function manhattan(startNode:GraphNode,endNode:GraphNode):Number
		{
			return  Math.abs(endNode.data.x - startNode.data.x)+Math.abs(endNode.data.y - endNode.data.y);
		}
		/**
		 *  寻路
		 */
		public static function find(graph:Graph , startIndex:int,endIndex:int):Array
		{
			//还原值
			for each (var n:AstarNode in graph.nodes)
			{
				n.f = n.g = n.f = 0
				n.parent = null
				
			}
			
			var open:Heap = new Heap(function(a:AstarNode,b:AstarNode):Number{return b.f - a.f}); //根据f值升序排列 
			var close:Array = []
			//1，把起始节点添加到开启列表。
			AstarNode(graph.getNode(startIndex)).f =0	
			open.enqueue(graph.getNode(startIndex));
			//2，重复如下的工作：
			while(open.heap.length>0)
			{
				//a) 寻找开启列表中F值最低的节点。我们称它为当前节点。 
				var cur:AstarNode = AstarNode(open.dequeue())
				if(cur==graph.getNode(endIndex))return  Astar.getPath(cur)  //把目标格添加进了关闭列表(注解)，这时候路径被找到，或者	
					 
				//b) 把它切换到关闭列表。
				close.push(cur)
				//c) 对相邻的格中的每一个？
				for each(var i:GraphArc in cur.arcs)
				{
					var test:AstarNode = AstarNode(i.targetNode)
					//如果它不可通过或者已经在关闭列表中，略过它。
					if(close.indexOf(test)>=0)continue
					//如果它不在开启列表中，把它添加进去。把当前格作为这一格的父节点。记录这一格的F,G,和H值。
					
					if(open.heap.indexOf(test)<0)
					{
						
						test.parent =cur
						test.g = cur.getArc(test).weight
						test.h = Astar.distance(test,graph.getNode(endIndex))
						// 这里使用距离启发值，原教程使用的曼哈顿启发函数可以替换成这句  Astar.manhattan(test,graph.getNode(endIndex))
						test.f = test.g + test.h
						open.enqueue(test);
					}else
					{
					 //如果它已经在开启列表中，用G值为参考检查新的路径是否更好。更低的G值意味着更好的路径。
					 //如果是这样，就把这一格的父节点改成当前格，并且重新计算这一格的G和F值。如果你保持你的开启列表按F值排序，改变之后你可能需要重新对开启列表排序。
						if( cur.g+ cur.getArc(test).weight < test.g)
						{
							test.parent = cur
							test.g = cur.g+ cur.getArc(test).weight
							test.f = test.h+test.g
							open.modify(test,test);
						}
						
					}
					
				 }	
			}
			return []
        }
		
		public static function getPath(node:AstarNode):Array
		{
			var arr:Array = [node]
			while(node.parent)
			{
				arr.push(node.parent)
				node = node.parent
			}
			
			return arr
		}
		
	}
}