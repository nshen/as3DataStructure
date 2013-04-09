package
{
	import ds.DLinkedList;
	import ds.Heap;
	import ds.iterators.DListIterator;
	import ds.iterators.TreeIterator;
	import ds.PriorityQueue;
	import ds.QuadTree;
	import ds.sort.BuiltIn;
	import ds.sort.Insertion;
	import ds.sort.Merge;
	import ds.sort.Quick;
	import ds.sort.Quick3way;
	import ds.sort.Selection;
	import ds.sort.Shell;
	import ds.Tree;
	import examples.SortTest;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;

	[SWF(width="800", height="600", frameRate="30", backgroundColor="#FFFFFF")]
	public class ds extends Sprite
	{
		
		
		
		public function ds():void
		{
			stage.align = StageAlign.TOP_LEFT
			stage.scaleMode = "noScale"
		
		
			//testArray()  //从100万个数据开头删除500个
			//quickRemove()  //快速法从100万个数据开头删除500个
			//hash()
			//linkedList()
			//queue() //10万次push + 10万次shift ，链表比数组快至少10+倍
			//priorityQueue()
			//tree()
			//TODO: binary tree expression parse ，minmax game tree ...决策树 ,霍夫曼树
			
			
			//test sort
			//BuiltIn.test();
			//Selection.test();
			//Insertion.test();
			//Shell.test();
			//Merge.test();
			//Quick.test();
			//Quick3way.test();
			//ds.sort.Heap.test()
			//SortTest.compare();
		}		
		
		
		
		
		
		
		private function testArray():void
		{
			var arr:Array = [];
			for(var i:uint= 0 ;i<1000000;i++)arr[i]=i ;
			
			var startT:Number = getTimer();
			var num:uint = 500;
			while(num > 0)
			{
				arr.splice(0,1)
				num--
			}
			trace("time:",getTimer() - startT)
		}
		
		private function quickRemove():void
		{
			var arr:Array = [];
			for(var i:uint= 0 ;i<1000000;i++)arr[i]=i ;
			
			var startT:Number = getTimer();
			var num:uint = 500;
			while(num > 0)
			{
				arr[0] = arr[arr.length - 1] ;
				arr.length -- ;
				num --;
			}
			trace(getTimer() - startT)
		}
		
		private function hash():void
		{
			var o:Object = new Object()
			o.abc = 123
			trace(o.abc)
			delete o.abc
			trace(o.abc)
			
			o.a = 1;
			o.b = 2;
			o.c = 3;
			o["d"] = 4;//另一种写法
			o["e"] = 5;
			//keys
			for (var key:String in o)
				trace(key);
			//values
			for each (var value:int  in o)
				trace(value);
		}
		private function queue():void
		{
			var startT:Number ,i:int,j:int;
			
			startT = getTimer();
            var queue:DLinkedList = new DLinkedList();
			for(i = 0 ; i<100000 ;i++)
			{
				queue.push(i);
			}
			for(j = 0; j<100000 ;j++)
			{
				queue.shift();
			}
			trace(getTimer() - startT)
			
			
            		
			//数组版本
			startT = getTimer();
			var queueArr:Array = [];
			for(i = 0 ; i<100000 ;i++)
			{
				queueArr.push(i);
			}
			for(j = 0; j<100000 ;j++)
			{
				queueArr.shift()
			}
			trace(getTimer() - startT)
			trace(queueArr);
		}
		
		
		private function linkedList():void
		{
			var list:DLinkedList = new DLinkedList(5, 6, 7, 8);
			trace(list, list.head, list.tail, list.length); //[5,6,7,8] 5 8 4
			list.pop();
			trace(list, list.head, list.tail, list.length);//[5,6,7] 5 7 3
			list.shift();
			trace(list, list.head, list.tail, list.length);//[6,7] 6 7 2
			list.pop();
			trace(list, list.head, list.tail, list.length);//[6] 6 6 1
			list.pop();
			trace(list, list.head, list.tail, list.length);//[] null null 0
			list.pop();
			trace(list, list.head, list.tail, list.length);//[] null null 0
			list.shift();
			trace(list, list.head, list.tail, list.length);//[] null null 0
			
			
			
			list.push(1);
			list.push(2);
			list.push(3);
			
			trace(list, list.head, list.tail, list.length); //[1,2,3] 1 3 3
			
			list.pop();
			trace(list, list.head, list.tail, list.length); //[1,2] 1 2 2
			
			list.unshift(0);
			trace(list, list.head, list.tail, list.length); //[0,1,2] 0 2 3

			
			list.shift()
			trace(list, list.head, list.tail, list.length); //[1,2] 1 2 2
			
			list.push(3)
			trace(list, list.head, list.tail, list.length); //[1,2,3] 1 3 3
			
			//遍历,输出  1,2,3
			var it:DListIterator = list.getIterator();
			for(it.start() ; it.valid(); it.next())
			{
				trace(it.node.data);
			}
            //遍历，输出3，2，1
			for(it.end() ; it.valid(); it.prev())
			{
				trace(it.node.data);
			}
		
		    it.start()  // 指向head
			it.next()   
			list.remove(it) //remove 2
			list.remove(it) //remove 3 // iterator指向null了
			
			trace(list,list.head,list.tail, list.length); //[1] 1 1 1
			list.insertAfter(it,2)  
			trace(list, list.head, list.tail, list.length); //[1,2] 1 2 2
			//此时iterator还是指向1的
			list.insertAfter(it,3)
			trace(list,list.head,list.tail, list.length); //[1,3,2] 1 2

		}	
		
		
		
		
		private function tree():void
		{
		
				
			var tree:Tree = new Tree(0);
			var itr:TreeIterator = tree.getIterator(); //iterator point to 0
			itr.appendChild(1);
			itr.appendChild(2);
			
			/*  0  
			   / \
			  1   2
			*/
			
			
			itr.down() //指向1
			itr.appendChild(3)
			
			
			/*    0  
			     / \
			    1   2
		       /
			  3
		   */
			
			
			itr.up() //指向0
			itr.appendChild(4)
			
			/*    0  
			    / | \ 
			   1  2  4
			  /
			 3
		   */
			
			
			itr.childEnd()
			itr.down()//指向4
			itr.prependChild(5)
			itr.prependChild(6)
			
			
			/*       0  
			       / | \ 
			      1  2  4
			     /      /\
		    	3	   6  5	
			
			*/	
			itr.childStart(); //child指向6
			itr.insertChildBefore(7);
			
			/*       0  
			       / | \
			      1  2  4  
			     /     / /\
		    	3	  7 6  5	
			
			*/				
			itr.childEnd();//child指向5
			itr.insertChildAfter(8);
			/*       0  
			       / | \
			      1  2  4  
			     /    / /\ \
		    	3	 7 6  5 8	
			
			*/				
			trace(tree.dump());
			
			/*
				[TreeNode >(root) has 3 child nodes, data=0]
				+---[TreeNode > has 1 child nodes, data=1]
				|    +---[TreeNode >(leaf), data=3]
				+---[TreeNode >(leaf), data=2]
				+---[TreeNode > has 4 child nodes, data=4]
				|    +---[TreeNode >(leaf), data=7]
				|    +---[TreeNode >(leaf), data=6]
				|    +---[TreeNode >(leaf), data=5]
				|    +---[TreeNode >(leaf), data=8]
		   */
			trace(tree.toXML());	
			
			/*
				 <node label="0">
				  <node label="1">
					<node label="3"/>
				  </node>
				  <node label="2"/>
				  <node label="4">
					<node label="7"/>
					<node label="6"/>
					<node label="5"/>
					<node label="8"/>
				  </node>
				</node>
			 */
		}
		
		
		private function priorityQueue():void
		{
			//逆序排列
			var f:Function = function(a:Number, b:Number):Number { return b - a };
			
			var priorityQueue:PriorityQueue =new PriorityQueue() //默认从小到大排序
			priorityQueue.enqueue(2.1)
			priorityQueue.enqueue(7)
			priorityQueue.enqueue(2)
			priorityQueue.enqueue(2.2)
			priorityQueue.enqueue(6)
			priorityQueue.enqueue(5)
			priorityQueue.enqueue(4)
			priorityQueue.enqueue(8)			
			priorityQueue.enqueue(7)
			priorityQueue.enqueue(1)
			priorityQueue.enqueue(9)
			priorityQueue.enqueue(5)
			priorityQueue.enqueue(3)
			priorityQueue.enqueue(8)			
			priorityQueue.enqueue(4)
			trace(priorityQueue) //,1,2,2.2,2.1,3,5,4,6,4,5,9,8,8,7,7
			
			while (priorityQueue.length > 0 )
				trace(priorityQueue.length , priorityQueue.dequeue());
			
			var p2:PriorityQueue = new PriorityQueue(null, [2.1, 2, 2.2, 6, 5, 8, 7, 4, 1, 3, 9, 5, 8, 7, 4]);
			
			while ( p2.length > 0)
				trace(p2.dequeue());
		
		}

		
	}
}