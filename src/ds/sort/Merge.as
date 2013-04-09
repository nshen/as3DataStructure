package ds.sort
{
	
	/**
	 * 归并排序
	 * *稳定
	 * 时间复杂度 线性对数
	 */
	public class Merge 
	{
		
		public static function sort(arr:Array, compareFunc:Function = null):void
		{
			if (compareFunc == null)
			  compareFunc = SortUtils.ASC_COMPARE_FUNC;
			
			var cp:Array = arr.slice(0);
			sort2(arr, cp, 0, arr.length - 1, compareFunc)
		}
		
		private static function sort2(arr:Array , cp:Array , startIndex:int , endIndex:int ,compareFunc:Function):void
		{
			if (startIndex >= endIndex) return;
			var mid:int =  ( (endIndex - startIndex) >> 1 ) + startIndex ;
			sort2(arr, cp, startIndex, mid, compareFunc);
			sort2(arr, cp, mid + 1, endIndex, compareFunc);
			
			merge(arr, cp, startIndex, mid, endIndex,compareFunc);
		}
		
		public static function merge(arr:Array,cp:Array, l0:int, mid:int, hi:int,compareFunc:Function):void
		{
			//trace(" merge" , l0,mid,hi)
			//将[l0...mid]和[mid+1 ... hi]归并
			var i:int = l0 , j:int = mid + 1 , k:int = l0;
			
			for ( k = l0 ; k <= hi; k++)
			 cp[k] = arr[k];
			 
			for (k = l0; k <= hi; k++)
			{
				if (i > mid)
					arr[k] = cp[j++]; //左边用尽，取右边
				else if (j > hi)
					arr[k] = cp[i++]; //右边用尽，取左边 
				else if (SortUtils.less(cp[j], cp[i], compareFunc)) 
					arr[k] = cp[j++]; //右边小，取右边
				else						
					arr[k] = cp[i++];
			}
		
		}
		

	
	}

}