package examples
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	
	import net.hires.debug.Stats;

	[SWF(width="600", height="500", frameRate="60", backgroundColor="#FFffff")]
	public class Array_collition extends Template
	{
		
		private var canvas:Sprite = new Sprite()
//		private var pointShape:Shape = new Shape() 
		private var spArr:Array = []
			
			
			
		public function Array_collition()
		{
			super();
			
		}
		
		override protected function init(e:Event):void
		{
			super.init(e);
			
			this.addChild(canvas);
			this.addChild(new Stats());
			
			initSprites();
			
			
		}
		
		 
		private function initSprites():void
		{
			for(var i:int = 0 ; i< 250 ;  i++ )
			{
				var sp:RectSprite = new RectSprite(Math.random() * stage.stageWidth,Math.random() * stage.stageHeight,5+10 * Math.random(),5+10 * Math.random(),Math.random()*4-2,Math.random()*4-2);
				spArr.push(sp)
				this.canvas.addChild(sp)				
			}
		}
		
		
		override protected function onEnterFrame(e:Event):void
		{

			super.onEnterFrame(e);
			
			for each(var a:RectSprite in this.spArr)
			{
				a.update()
				 
				for each (var i:RectSprite in this.spArr)
				{
					if(a==i)continue;
					if(a.isCollid && i.isCollid)continue
					if(a.hitTestObject( i))
					{ 
						if(!a.isCollid)
						{
							a.collid(true)
						}
						if(!i.isCollid)
						{
							i.collid(true);
						}
						
					}
				}
				
			}

		}
		
	}
}