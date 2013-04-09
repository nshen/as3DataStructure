package ds.sort 
{
	import flash.utils.getTimer;
	/**
	 * 三项切分快速排序
	 * 不稳定
	 * 重复元素多时比快速排序快
	 */
	public class Quick3way
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
			var lt:int = startIndex , i:int = startIndex , gt:int = endIndex;  //lt...i...gt三个指针
			var v:* = arr[startIndex];
			var r:int ;//result
			while ( i <= gt )
			{
				r = compareFunc(arr[i],v) 
				if ( r  < 0) SortUtils.swap(arr, lt++, i++);
				else if (r > 0) SortUtils.swap(arr, i , gt--);
				else  i++;
			}
			sort2(arr, startIndex , lt-1 ,compareFunc);
			sort2(arr, gt + 1, endIndex,compareFunc);
		}
		

		
	}

}