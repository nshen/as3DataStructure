package examples
{
	import flash.display.Sprite;
	
	public class RectSprite extends Sprite
	{
		private var _vx:Number;
		private var _vy:Number;
		private var _width:Number
	    private var _height:Number
		public function RectSprite(px:Number,py:Number,p_width:Number,p_height:Number,p_vx:Number,p_vy:Number)
		{
			super();
			this.mouseChildren = this.mouseEnabled = false
			this._vx = p_vx;
			this._vy = p_vy;
			this.x = px
			this.y = py
			
			this.graphics.beginFill(0xffff0000)
			this.graphics.drawRect(0,0,p_width,p_height);
			this.graphics.endFill();
			this._width = p_width
			this._height = p_height
		}
		public var isCollid:Boolean = false
		public function update():void
		{
			if(this.x > stage.stageWidth)this.x = 0
			if(this.x<0)this.x = stage.stageWidth;
			if(this.y > stage.stageHeight)this.y = 0
			if(this.y<0)this.y = stage.stageHeight;
			this.x+=this._vx
			this.y+=this._vy

		    this.collid(false)
		}
		
		public function collid(p:Boolean):void
		{
			this.isCollid = p
			
			if( p){
				this.graphics.clear()
				this.graphics.beginFill(0xff0000ff)
				this.graphics.drawRect(0,0,this._width,this._height);
				this.graphics.endFill(); 
			}else
			{
				this.graphics.clear()
				this.graphics.beginFill(0xffff0000)
				this.graphics.drawRect(0,0,this._width,this._height);
				this.graphics.endFill();
			}
		}
		
	}
}