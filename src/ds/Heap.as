package ds
{
	/**
	 * Heap是一种特殊的二叉树，它的每个节点都比它的子节点大。内部实现是用数组存储的。
	 * <p> 
	 * 比如原树状结构为： 
	 *    2
	 *   / \
	 *  1   0
	 * 则存储成数组为：
	 * [2,1,0]
	 * </p>
	 */
	public class Heap
	{
		private var _heap:Array 
		private var _compare:Function
		
		/**
		 * @param compare  返回正数，则a排在b前边,如果不指定，默认为 function (a:int,b:int):int{return a-b};
		 */
		public function Heap(compare:Function = null):void
		{
			_heap = []; 
			if(compare==null)
				_compare =  function (a:int,b:int):int{return a-b};
			else
				_compare =compare;
		}
		
		public function get length():uint
		{
			return _heap.length
		}
		
		public function modify(obj:*,newObj:*):Boolean
		{
			 var objIndex:int = this._heap.indexOf(obj);
			 if(objIndex<0)return false
			 _heap[objIndex]= newObj
		     var parentIndex:int = (objIndex-1)>>1
			 var temp:* =  _heap[objIndex]
			 while(objIndex>0) //只有objIndex>0才有可能有parent
			 {
				 //如果新插入的数据大于parent的数据，则应不断上移与parent交换位置
				 if(_compare(temp,this._heap[parentIndex])>0) 
				 {
					 this._heap[objIndex] = this._heap[parentIndex]
					 objIndex = parentIndex
					 parentIndex = (parentIndex-1)>>1 //parent索引的算法
				 }else
				 {
					 break;
				 }
			 }
			 _heap[objIndex] = temp
		     return true
				 
		}
		//parentIndex = (childindex -1)/2
		public function enqueue(obj:*):void
		{
			this._heap.push(obj)
				
			var parentIndex:int = (this._heap.length-2)>> 1
			var objIndex:int = this._heap.length -1
			var temp:* = this._heap[objIndex]
	
			
			while(objIndex>0) //只有objIndex>0才有可能有parent
			{
				//如果新插入的数据大于parent的数据，则应不断上移与parent交换位置
				if(_compare(temp,this._heap[parentIndex])>0) 
				{
					this._heap[objIndex] = this._heap[parentIndex]
					objIndex = parentIndex
					parentIndex = (parentIndex-1)>>1 //parent索引的算法 
				}else
				{
					break;
				}
			}
			_heap[objIndex] = temp
			
		}
		
		public function dequeue():*
		{
			if(_heap.length>1)
			{
				var r:* = _heap[0]
				_heap[0] = _heap.pop()
				var parentIndex:int = 0
				var childIndex:int = 1
				var temp:* = _heap[parentIndex]
				while(childIndex <= _heap.length-1)
				{
						if(_heap[childIndex+1] && this._compare(_heap[childIndex],_heap[childIndex+1])<0)
						{
						 childIndex++
						}
					if(this._compare(temp,this._heap[childIndex])<0)
					{
						  this._heap[parentIndex] = _heap[childIndex]
						  parentIndex = childIndex;
						  childIndex = (childIndex <<1)+1
					}else
					{
						break
					}
				 
				}   
				_heap[parentIndex] = temp	
				return r
			}
			return _heap.pop()
		}
		
		public function toString():String
		{
			return this._heap.toString()
		}
		public function get heap():Array
		{
			return _heap;
		}
	}
}