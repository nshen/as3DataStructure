package ds.sort 
{
	/**
	 * 插入排序
	 * *稳定
	 * *运行时间取决于输入元素的初始顺序，已经有序的数组会快很多
	 */
	public class Insertion 
	{
		
		public static function sort(arr:Array , compareFunc:Function = null):void
		{
			
			if (compareFunc == null)
			   compareFunc = SortUtils.ASC_COMPARE_FUNC;
			
			var l:int = arr.length;
			var key:*;
			for (var i:int = 1 ; i < l ; i++)
			{
				key = arr[i];//待插入的
				for (var j:int = i ; j > 0 && SortUtils.less(key,arr[j-1],compareFunc) ; j--)
				{
					arr[j] = arr[j - 1]; //比待插入大的向右移动
				}
				arr[j] = key;
			}
		}
	}

}