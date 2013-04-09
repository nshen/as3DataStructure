package ds.sort 
{
	import ds.PriorityQueue;
	/**
	 * 堆排序
	 * @author Nshen.net
	 */
	public class Heap 
	{
		
		public static function sort(arr:Array , compareFunc:Function = null):void
		{
			if (compareFunc == null)
			   compareFunc =  SortUtils.ASC_COMPARE_FUNC;
			   
			var size:uint =  arr.length;
			for ( var k:int = size >> 1 ; k >= 1; k --)
			  sink(arr, k, size , compareFunc); //下沉构造堆
			while (size > 1)
			{
				swap(arr, 1, size-- )
				sink(arr, 1, size , compareFunc);
			}
		}
		
		private static function sink(arr:Array , k:int , l:int ,compareFunc:Function):void
		{
			var j:uint;
			var key:* = arr[k - 1];
			while ( k << 1 <= l) //2 * k < length 有子节点
			{
				j = k << 1;
				if (j < l && compareFunc(arr[j-1], arr[j] ) < 0) j++; //2k还是2k+1
				if ( compareFunc(key, arr[j - 1]) >= 0) break;
				arr[k - 1] = arr[j - 1]; //子节点上移，并记录顶节点应该放的位置
				k = j;
			}
			arr[k - 1] = key;
		}
		
	
		public static function swap(arr:Array , i:int , j:int):void
		{
			var t:* = arr[i-1];
			arr[i-1] = arr[j-1];
			arr[j-1] = t;
		}
		
	}

}