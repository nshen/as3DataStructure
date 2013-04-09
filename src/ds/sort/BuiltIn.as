package ds.sort 
{
	/**
	 * flash内置排序
	 * *不稳定
	 */
	public class BuiltIn 
	{
		public static function test():void
		{
			var objects:Array = new Array(); 
			objects.push({name:"a", born:"5" , sex:"man"}); 
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push({name:"b", born:"5" , sex:"woman"}); 
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push( { name:"Wang", born:"9", sex:"woman" } );
			objects.push({name:"c", born:"5" , sex:"man"}); 
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push({name:"d", born:"5" , sex:"woman"}); 
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push( { name:"Wang", born:"9", sex:"woman" } );
				objects.push({name:"e", born:"5" , sex:"man"}); 
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push({name:"f", born:"5" , sex:"woman"}); 
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push( { name:"Wang", born:"9", sex:"woman" } );
				objects.push({name:"g", born:"5" , sex:"man"}); 
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push({name:"h", born:"5" , sex:"woman"}); 
			objects.push({name:"i", born:"5" , sex:"man"});
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push( { name:"Wang", born:"9", sex:"woman" } );
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push({name:"j", born:"5" , sex:"woman"}); 
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push( { name:"Wang", born:"9", sex:"woman" } );
				objects.push({name:"k", born:"5" , sex:"man"}); 
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push({name:"l", born:"5" , sex:"woman"}); 
			objects.push({name:"m", born:"5" , sex:"man"});
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push( { name:"Wang", born:"9", sex:"woman" } );
				objects.push({name:"n", born:"5" , sex:"woman"});
			objects.push({name:"Blake", born:"8" , sex:"man"}); 
			objects.push( { name:"Dante", born:"2", sex:"woman" } ); 
			objects.push({name:"Wang", born:"9", sex:"woman"});
			
			var objectsVector:Vector.<Object> = new Vector.<Object>();
			objectsVector.push({name:"Angelou", born:"1928" , sex:"man"}); 
			objectsVector.push({name:"Blake", born:"1757" , sex:"man"}); 
			objectsVector.push({name:"cummings", born:"1894" , sex:"woman"}); 
			objectsVector.push({name:"Dante", born:"701", sex:"woman"}); 
			objectsVector.push({name:"Wang", born:"701", sex:"woman"}); 
			
			
			
			var bornFunc:Function = function(a:Object, b:Object):*
			{
			   if (int(a.born) < int(b.born))
			   return -1
			   if (int(a.born) > int(b.born))
			   return 1
			    if (int(a.born) == int(b.born))
			   return 0
			}
			objects.sort(
			objects.sort(bornFunc);
			objectsVector.sort(bornFunc)
	
			//objects.sort(bornFunc);
			//objectsVector.sort(bornFunc)
			
			
			traceAll(objects);
			traceAll(objectsVector);
		}
		
		private static function traceAll(arr:*):void 
		{
			trace("--------------------------------------")
			for ( var i:int = 0 ; i < arr.length ; i++)
			{
				trace(arr[i].name , arr[i].born , arr[i].sex)
			}
			trace("--------------------------------------")
		}
		
	}

}