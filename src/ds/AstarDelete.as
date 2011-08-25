package ds
{
	public class AstarDelete
	{
		public function AstarDelete()
		{
		}
	
		
		
		
		public static function find(map:Graph , startNode:GraphNode,goalNode:GraphNode):Boolean
		{
		   //1.把起始节点添加到开启列表
		   var pq:Heap = new Heap()	
			   pq.enqueue(startNode)
		  //重复如下工作：	  
			//   d) 停止，当你
		
		//		   * 没有找到目标格，开启列表已经空了。这时候，路径不存在。
		//		   3.保存路径。从目标格开始，沿着每一格的父节点移动直到回到起始格。这就是你的路径。
		   while(closeList.length>0)
		   {
			   //a)寻找开启列表中F值最低的节点，把它称为当前节点
			   var cur:GraphNode = pq.dequeue()
			   //b) 把它切换到关闭列表。  
			   closeList.push(cur)
				
				/////	   * 把目标格添加进了关闭列表(注解)，这时候路径被找到，或者
				if(cur==goalNode)   
			   //  c) 对相邻的每一个节点？
			   for(var i:int in cur.arcs)
			   {
			       // * 如果它不可通过或者已经在关闭列表中，略过它。反之如下。
				   if(closeList.indexOf(arcs[i].targetNode))
				   {
					   
				   }else
				   {
			           //* 如果它不在开启列表中，把它添加进去。把当前格作为这一格的父节点。记录这一格的F,G,和H值。
					   if(pq.indexOf(arcs[i].targetNode)==null)
					   {
						   arcs[i].targetNode.parent = cur
					   }else
					   {
						   
			   //	   * 如果它已经在开启列表中，用G值为参考检查新的路径是否更好。更低的G值意味着更好的路径。如果是这样，就把这一格的父节点改成当前格，并且重新计算这一格的G和F值。如果你保持你的开启列表按F值排序，改变之后你可能需要重新对开启列表排序。
					   }
					   
				   }
			   }
			   
		   }
		}
	}
}