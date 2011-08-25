package
{
	import ds.DLinkedList;
	import ds.DListIterator;
	import ds.Heap;
	import ds.QuadTree;
	import ds.Tree;
	import ds.TreeIterator;
	
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
		
				
			//每个方法测试一种数据结构	
			//testArray()
			//quickRemove()
			//hash()
			//queue()
			//linkedList()
			//tree()
			//priorityQueue()
			
			
		}		
		
		
		
		
		
		
		private function testArray():void
		{
			var arr:Array = []
			for(var i:uint= 0 ;i<1000000;i++)arr[i]=i ;
			
			var startT:Number = getTimer()
			var num:uint = 500
			while(num>0)
			{
				arr.splice(0,1)
				num--
			}
			trace("time:",getTimer() - startT)
		}
		
		private function quickRemove():void
		{
			var arr:Array = []
			for(var i:uint= 0 ;i<1000000;i++)arr[i]=i ;
			
			var startT:Number = getTimer()
			var num:uint = 1000
			while(num>0)
			{
				arr[0] =arr[arr.length-1]
				arr.length -=1
				num--
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
		}
		private function queue():void
		{
			var startT:Number = getTimer()
            var queue:DLinkedList = new DLinkedList()
			for(var i:int = 0 ; i<100000 ;i++)
			{
				queue.push(i);
			}
			for(var j:int = 0 ; j<100000 ;j++)
			{
				queue.shift()
			}
			trace(getTimer() - startT)
			
			
			
           /*			
			//数组版本
			var startT:Number = getTimer()
			var queue:Array = []
			for(var i:int = 0 ; i<100000 ;i++)
			{
				queue.push(i);
			}
			for(var i:int = 0 ; i<100000 ;i++)
			{
				queue.shift()
			}
			trace(getTimer() - startT)*/
			
		}
		
		
		private function linkedList():void
		{
			var l:DLinkedList = new DLinkedList()
			l.push(1)
			l.push(2)
			l.push(3)
			trace(l,l.head,l.tail) //[1,2,3] 1 3
			l.pop()
			trace(l,l.head,l.tail) //[1,2] 1 2
			l.unshift(0)
			trace(l,l.head,l.tail) //[0,1,2] 0 2
			l.shift()
			trace(l,l.head,l.tail) //[1,2] 1 2
			l.push(3)
			trace(l,l.head,l.tail) //[1,2,3] 1 3
			
			//遍历,输出  1,2,3
			var it:DListIterator = l.getIterator()
			for(it.start() ; it.hasNext(); it.next())
			{
				trace(it.node.data)
			}
           
			for(it.end() ; it.hasPrev(); it.prev())
			{
				trace(it.node.data)
			}
			
			return
		    it.start()  // 归0
			it.next()   
			l.remove(it) //remove 2
			l.remove(it) //remove 3
			trace(l,l.head,l.tail) //[1] 1 1
			l.insert(it,2) 
			trace(l,l.head,l.tail) //[1,2] 1 2
			l.insert(it,3)
			trace(l,l.head,l.tail) //[1,3,2] 1 2

		}	
		
		
		
		
		private function tree():void
		{
		
				
			var tree:Tree = new Tree(0);
			var itr:TreeIterator = tree.getIterator()
			itr.appendChild(1)
			itr.appendChild(2) 
			
			/*  0  
			   / \
			  1   2
			*/
			
			
			itr.down()
			itr.appendChild(3)
			
			
			/*    0  
			     / \
			    1   2
		       /
			  3
		   */
			
			
			itr.up()
			itr.appendChild(4)
			
			/*    0  
			    / | \ 
			   1  2  4
			  /
			 3
		   */
			
			
			itr.childEnd()
			itr.down()
			itr.prependChild(5)
			itr.prependChild(6)
			
			
			/*       0  
			       / | \ 
			      1  2  4
			     /      /\
		    	3	  6  5	
			
			*/	
			trace(tree.dump())
			
			/*
			[TreeNode >(root) has 3 child nodes, data=0]
			+---[TreeNode > has 1 child nodes, data=1]
			|    +---[TreeNode >(leaf), data=3]
			+---[TreeNode >(leaf), data=2]
			+---[TreeNode > has 2 child nodes, data=4]
			|    +---[TreeNode >(leaf), data=6]
			|    +---[TreeNode >(leaf), data=5]
			
		   */
				
			
 
		}
		
		
		private function priorityQueue():void
		{
			var priorityQueue:Heap =new Heap() //默认从大到小排列
			priorityQueue.enqueue(2)
			priorityQueue.enqueue(6)
			priorityQueue.enqueue(5)
			priorityQueue.enqueue(8)			
			priorityQueue.enqueue(7)
			priorityQueue.enqueue(4)
			priorityQueue.enqueue(1)
			priorityQueue.enqueue(3)
			priorityQueue.enqueue(9)
				
			trace(priorityQueue)
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			trace(priorityQueue.dequeue())
			
			//逆序排列
			
			var f:Function = function(a:int,b:int):int{return b-a}
			var p:Heap =new Heap(f)
			p.enqueue(2)
			p.enqueue(6)
			p.enqueue(5)
			p.enqueue(8)			
			p.enqueue(7)
			p.enqueue(4)
			p.enqueue(1)
			p.enqueue(3)
			p.enqueue(9)

			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
			trace(p.dequeue())
				
		}

		
	


			
			
		
	}
}