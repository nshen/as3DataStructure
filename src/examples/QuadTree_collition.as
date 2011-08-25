package examples
{
	import ds.QuadTree;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	
	import net.hires.debug.Stats;

	[SWF(width="600", height="500", frameRate="60", backgroundColor="#FFffff")]
	public class QuadTree_collition extends Template
	{
		
		private var spArr:Array = []
		private var canvas:Sprite = new Sprite()
		private var quad:ds.QuadTree ; 
		private var pointShape:Shape = new Shape() 
		 

		override protected function init(e:Event):void
		{
		    super.init(e);
			 
				
			this.addChild(canvas);
			this.addChild(pointShape);
            this.addChild(new Stats());
			
			quad = new ds.QuadTree(new Rectangle(0,0,stage.stageWidth,stage.stageHeight))
			initRects();
		 
			
		}
		public function initRects():void
		{
			
			for(var i:int = 0 ; i< 500 ;  i++ )
			{
				
				var sp:RectSprite = new RectSprite(Math.random() * stage.stageWidth,Math.random() * stage.stageHeight,5+10 * Math.random(),5+10 * Math.random(),Math.random()*4-2,Math.random()*4-2);				
				spArr.push(sp)
				this.canvas.addChild(sp)				
				this.quad.insert(sp)
			}
		}
		
		override protected function onEnterFrame(e:Event):void
		{
			super.onEnterFrame(e);
			this.quad.clear()
			for each ( var s:RectSprite in this.spArr)
			{
				s.update()
				quad.insert(s);
			}
			
			
			for each(var a:RectSprite in this.spArr)
			{
				var arr:Array = this.quad.retrieve(a)
				for each (var i:RectSprite in arr)
				{
					if(a==i)continue;
					if(a.isCollid && i.isCollid)continue
					if(a.hitTestObject( i))
					{ 

						a.collid(true)
						i.collid(true);
						
					}
				}
					
			}
		}


	}
	
	
	
	

}