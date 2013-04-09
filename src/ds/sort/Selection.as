package ds.sort 
{
	/**
	 * 选择排序：一种简单的排序
	 * *不稳定
	 * *n次交换
	 */
	public class Selection 
	{

		public static function sort(arr:Array , compareFunc:Function = null):void
		{
			if (compareFunc == null)
			  compareFunc = SortUtils.ASC_COMPARE_FUNC;
			  
			var l:int = arr.length;
			var min:int;
			for (var i:int = 0 ; i < l - 1 ; i++)
			{
				min = i; //遍历取最小索引
				for (var j:int = i + 1; j < l; j++)
				{
					if (SortUtils.less(arr[j], arr[min] , compareFunc))
						min = j;
				}
				if (i != min) //最小的放在左边
					SortUtils.swap(arr, i, min);
			}
		}
		
	}

}