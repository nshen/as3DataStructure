package ds.sort 
{
	import flash.utils.getTimer;
	/**
	 * 快速排序
	 * 不稳定
	 */
	public class Quick 
	{
		public static function sort(arr:Array, compareFunc:Function):void
		{
			if (compareFunc == null)
			 compareFunc = SortUtils.ASC_COMPARE_FUNC;
			 
			sort2(arr,  0, arr.length - 1, compareFunc)
		}
		
		static private function sort2(arr:Array, startIndex:int, endIndex:int, compareFunc:Function):void 
		{
			if ( startIndex >= endIndex) return;
			var j:int = partition(arr, startIndex, endIndex, compareFunc);
			sort2(arr, startIndex , j - 1 ,compareFunc);
			sort2(arr, j + 1, endIndex,compareFunc);
		}
		
		private static function partition (arr:Array , startIndex:int , endIndex:int ,compareFunc:Function):uint
		{
			var i:int = startIndex , j:int = endIndex + 1 ; //左右扫描指针
	        var v:* = arr[startIndex]; //分割元素
			while (true) 
			{
				while (SortUtils.less(arr[++i], v, compareFunc)) if (i == endIndex) break;
				while (SortUtils.less(v, arr[--j], compareFunc)) if (j == startIndex) break;
				if (i >= j) break; //相遇
				SortUtils.swap(arr, i, j);
			}
			SortUtils.swap(arr, startIndex, j);//将v = a[j]放入正确的位置
			return j;
		}
		
		
		
	
	}

}