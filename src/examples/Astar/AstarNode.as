package examples.Astar
{
	import ds.GraphNode;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	public class AstarNode extends GraphNode
	{
		public var f:Number 
		public var g:Number 
		public var h:Number
		public var parent:AstarNode
		
		public var _canvas:Graphics
		public function AstarNode(obj:*= null )
		{
			super(obj);
//			this._canvas = canvas;
		}
	 public function toString():String
		{
			return "{x:"+this.data.x+",y:"+this.data.y+",f:"+this.f+"}"
		}
		
	}
	
	
}