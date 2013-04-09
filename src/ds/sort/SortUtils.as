package ds.sort 
{
	/**
	 * ...
	 * @author Nshen.net
	 */
	public class SortUtils 
	{
		
		public static function less(a:* ,b:*,compareFunc:Function):Boolean
		{
			return compareFunc(a, b) < 0;
		}
		
		public static function swap(arr:Array , i:int , j:int):void
		{
			var t:* = arr[i];
			arr[i] = arr[j];
			arr[j] = t;
		}
		
		public static function isSorted(arr:Array , compareFunc:Function):Boolean
		{
			for ( var i:int = 0; i < arr.length-1 ; i++)
			{
				if (less(arr[i + 1], arr[i],compareFunc)) return false;
			}
			return true;
		}
		
		public static function traceAll(arr:Array):void 
		{
			trace("--------------------------------------")
			for ( var i:int = 0 ; i < arr.length ; i++)
			{
				trace(arr[i])
			}
			trace("--------------------------------------")
		}
		
		/**
		 * 升序
		 */
		public static const ASC_COMPARE_FUNC:Function = function(a:*, b:*):Number {
				if (a < b)
					return -1;
				else if (a > b)
					return 1;
				else
					return 0;
				}
		/**
		 * 降序
		 */
	   public static const DESC_COMPARE_FUNC:Function = function(a:*, b:*):Number {
				if (a > b)
					return -1;
				else if (a < b)
					return 1;
				else
					return 0;
				}
	}

}