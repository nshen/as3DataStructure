package ds 
{
	/**
	 * 二叉堆实现的最小优先队列，使用数组存储
	 */
	public class PriorityQueue
	{
		private var _heap:Array = [];
		private var _length:uint = 0 ;
		private var _compareFunc:Function;
		
		/**
		 * 最小优先队列
		 * @param compare  返回负数，则a排在b前边,如果不指定，默认为 function (a:Number,b:Number):Number{return a-b};
		 */
		public function PriorityQueue(compareFunc:Function = null , keys:Array = null):void
		{
			if(compareFunc == null)
				_compareFunc =  function (a:Number,b:Number):Number{return a-b};
			else
				_compareFunc = compareFunc;
				
			if (keys != null)
			{
				_length = keys.length;
				_heap = [];
				for (var i:int = 0 ; i < _length ; i ++)
				  _heap[i + 1] = keys[i];
				for ( var k:int = _length >> 1 ; k >= 1; k--)
				  sink(k);
			}
		}
		
		public function get length():uint
		{
			return _length;
		}
		
		public function isEmpty():Boolean
		{
			return _length == 0 ;
		}
		public function get top():* { return _heap[1]; }
		
		public function enqueue(obj:*):void
		{
			_heap[++_length] = obj;
			swim(_length);
		}
		
		public function dequeue():*
		{
			if ( isEmpty()) return null;
			var r:* = _heap[1]; //第一个为结果，出列
			_heap[1] = _heap.pop(); //最后一个放在第一个上，并下沉重构
			_length --;
			sink(1);
			return r;
			
		}
		//上浮
		private function swim(objectIndex:uint):void
		{
			var parentIndex:uint ;
			var keyObj:* = _heap[objectIndex];
			while (objectIndex > 1) //只有objIndex>1才有可能有parent
			{
				parentIndex = objectIndex >> 1 ; //parent索引的算法
				if ( _compareFunc (keyObj , _heap[parentIndex]) < 0 ) //keyObj比parent小，则应上浮
				{
					_heap[objectIndex] = _heap[parentIndex];//parent移下来
					objectIndex = parentIndex;
				}else
				{
					break;
				}
			}
			_heap[objectIndex] = keyObj;
		}
		//下沉
		private function sink(objectIndex:uint):void
		{
			var j:uint ;
			var keyObj:*  = _heap[objectIndex];
			while ( (objectIndex << 1) <= _length) //有子节点
			{
				j = objectIndex << 1; //第一个子节点 2*k
				if ( j < _length && _compareFunc(_heap[j], _heap[j + 1]) > 0 ) j ++; //j现在为最小子节点
				if (_compareFunc(keyObj , _heap[j]) <= 0) //如果objectIndex比最小的子节点大
					break;
				_heap[objectIndex] = _heap[j]//子节点移上去
				objectIndex = j;
				
			}
			_heap[objectIndex] = keyObj;
		}
		

		public function get topItem():*
		{
			return _heap[1];
		}
		
		public function toString():String
		{
			return this._heap.toString()
		}
	
	}	

}