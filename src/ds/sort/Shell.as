package ds.sort 
{
	/**
	 * 希尔排序：改进的插入排序
	 * *不稳定
	 */
	public class Shell
	{
		
		public static function sort(arr:Array , compareFunc:Function):void
		{
			if (compareFunc == null)
			 compareFunc = SortUtils.ASC_COMPARE_FUNC;
			 
			var l:int = arr.length;
			var h:int = 1;
			var key:*;
			while ( h < l/3 ) h = 3 * h + 1; // 1,4,13,40,121,364,1093,....
			while ( h >= 1)
			{
				for (var i:int = h; i < l ; i++)
				{
					key = arr[i]; //待插入
					for ( var j:int = i ; j >= h && SortUtils.less(key, arr[j - h], compareFunc); j -= h)
					{
						arr[j] = arr[j - h]; //右移
					}
					arr[j] = key;
				}
				h = int(h / 3);
			}
		}
		
		
	}

}