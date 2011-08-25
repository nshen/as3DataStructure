package examples
{
	import ds.QuadTree;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	[SWF(width="500", height="500", frameRate="30", backgroundColor="#FFffff")]
	public class QuadTree_retrieve extends Sprite
	{
		
		private var shape:Shape = new Shape()
		private var pointShape:Shape = new Shape()
		private var quad:ds.QuadTree	
			
		public function QuadTree_retrieve()
		{
			stage.addEventListener(Event.ENTER_FRAME,init)
		}
		
        protected function init(e:Event):void
		{
			stage.removeEventListener(Event.ENTER_FRAME,init);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseUp );
			stage.align = StageAlign.TOP_LEFT
			stage.scaleMode = "noScale"
			this.addChild(shape);
			this.addChild(pointShape);
			
			
			quad = new ds.QuadTree(new Rectangle(0,0,stage.stageWidth,stage.stageHeight))
			initRects();
//			quad.dump()
			renderQuad();
			
			
		}
		
		
		public function initRects():void
		{
			var x:int , y:int ,w:int , h:int  
			
			for(var i:int = 0 ; i< 250 ;  i++ )
			{
				x = Math.random() * stage.stageWidth
				y = Math.random() * stage.stageHeight
				w = 10+10 * Math.random();
				h = 10+10 * Math.random();
					
				if(x+w > stage.stageWidth) x= stage.stageWidth - w -2	
				if(y+h > stage.stageHeight) y= stage.stageHeight - h -2	
					 
				this.quad.insert({x:x,y:y,width:w,height:h})
			}
			
		}
		
		
		
		public function renderQuad():void
		{
			var g:Graphics = shape.graphics;
			g.clear();
			g.lineStyle(1,0xff000000)
			drawNode(quad,g);
		}
		
		
		
		public function onMouseUp(e:MouseEvent):void
		{
			renderRects(this.quad.retrieve({x:e.stageX , y:e.stageY,width:30,height:30}) )
		}
		
		public function renderRects(p:Array):void
		{
			 var g:Graphics  = this.pointShape.graphics
		     g.clear()
			 g.lineStyle(2,0xff3333ff)
			 g.drawRect(stage.mouseX,stage.mouseY,30,30)
			 g.lineStyle(2,0xffff3333)
			
			 for each (var i:Object in  p)
			 {
				 g.drawRect(i.x,i.y,i.width,i.height);
			 }
		}
		
		public function  drawNode(p:ds.QuadTree,p_g:Graphics):void
		{
			 
			var r:Rectangle = p._rect 
			var children:Array = p._children
			for each(var i:Object in children)
			{
				p_g.drawRect(i.x,i.y,i.width,i.height)
					
			}
			if(p._topLeft)drawNode(p._topLeft,p_g)
			if(p._topRight)drawNode(p._topRight,p_g)
			if(p._bottomLeft)drawNode(p._bottomLeft,p_g)
			if(p._bottomRight)drawNode(p._bottomRight,p_g)
		}
	}
}