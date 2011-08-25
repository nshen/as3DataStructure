package examples
{
	import com.greensock.TweenLite;
	import com.greensock.TweenNano;
	import com.greensock.easing.Linear;
	
	import ds.Graph;
	import ds.GraphArc;
	import ds.GraphNode;
	
	import examples.Astar.Astar;
	import examples.Astar.AstarNode;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	[SWF(width="680", height="700", frameRate="60", backgroundColor="#F1F1C3")]
	public class GraphTest extends Template
	{
		 
		private var _graph:Graph;
		private var _canvas:Sprite
		private var _player:Sprite
		private var _pTween:TweenLite
		private var nodes:Array = [{x:48,y:108},{x:286,y:136},{x:411,y:215},{x:350,y:292},{x:203,y:248},{x:52,y:296},{x:87,y:468},{x:171,y:440},{x:243,y:651},{x:309,y:489},{x:280,y:362},{x:472,y:374},{x:539,y:265},{x:488,y:117},{x:635,y:49},{x:615,y:185},{x:646,y:347},{x:540,y:596},{x:521,y:435}]
		private var arcs:Array = [[0,1],[1,2],[2,3],[3,4],[4,5],[5,6],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12],[12,13],[13,14],[14,15],[15,16],[16,17],[17,18],[0,4],[0,5],[4,10],[3,11],[2,11],[7,10],[9,7],[5,7],[11,18],[9,18],[8,18],[8,17],[12,15],[12,16],[4,7],[4,1],[2,13],[12,18],[18,16],[15,13],[1,13],[2,12]]	
			
		private var _lastPlace:int	
		override protected function init(e:Event):void
		{
			super.init(e)

			this.addChild(_canvas = new Sprite)
			_graph = new Graph()
				

			for(var i:int= 0 ; i< nodes.length; i++)
			{
				_graph.addNode(new AstarNode(nodes[i]),i)
			}
			for(var j:int = 0 ; j< arcs.length; j++)
			{
				this.connect(arcs[j][0],arcs[j][1]);
			}
			
				
			draw()
				
			this._player = new Sprite()
			this._player.graphics.beginFill(0xff382513)
			this._player.graphics.drawCircle(0,0,15)
			this._player.graphics.endFill()
			this._player.x= this._graph.getNode(0).data.x
			this._player.y= this._graph.getNode(0).data.y
			_lastPlace = 0
			this.addChild(_player);
			
			_pTween =  new TweenLite(_player,0.5,{alpha:0,width:46,height:46,onComplete:onFinishTween})
		}
		
		private function onFinishTween():void
		{
			_pTween.restart();
			
		}
		
	

		
		private function connect(index1:int,index2:int):void{
			var d:Number = distance(nodes[index1],nodes[index2])
			_graph.addArc(index1,index2,d)
			_graph.addArc(index2,index1,d)
			
		}
		
		private function distance(p1:Object,p2:Object):Number
		{
			return Math.sqrt( (p1.x-p2.x)*(p1.x-p2.x) + (p1.y - p2.y)*(p1.y - p2.y))
		}
		
		private function draw( ):void
		{
			for(var i:int = 0 ; i< _graph.nodes.length ; i++)
			{
				var n:GraphNode = _graph.nodes[i]

					
				var sp:Sprite = new Sprite()
			    sp.name =i.toString();
				sp.graphics.beginFill(0xff96A84A)
				sp.graphics.drawCircle(0,0,16)	
				
				sp.graphics.endFill()
					
				var t:TextField = new TextField()
				t.text = i.toString()
				t.selectable = false
				t.width =t.height = 32
				var f:TextFormat = new TextFormat()
				f.size = 24
			    f.color = 0xffF1F1C3
				f.align = "center"
				t.setTextFormat(f)
				t.x  =  - 16
				t.y  = - 16
				
				sp.addChild(t)
				sp.x = n.data.x
				sp.y = n.data.y
				this.addChild(sp);
				sp.addEventListener(MouseEvent.CLICK,onSpClick);	
					
				for each(var j:GraphArc in n.arcs)
				{
					_canvas.graphics.lineStyle(4,0xffB8B495)
					_canvas.graphics.moveTo(n.data.x,n.data.y)
					_canvas.graphics.lineTo(j.targetNode.data.x,j.targetNode.data.y);
				}		
					

			}
		}
		
		private var lastName:String
		private var moveTween:TweenLite
		private var _moveStack:Array
		private function onSpClick(e:MouseEvent):void
		{
		
		    if(this._lastPlace.toString() == e.currentTarget)return
			if(this._moveStack &&this._moveStack.length>0)return;

			_moveStack = Astar.find(this._graph,this._lastPlace,int(e.currentTarget.name))

			if(_moveStack.length <= 1)return;
		    _moveStack.pop()
			
			var t:AstarNode = _moveStack.pop()
				
			TweenLite.to(_player,this.distance(_player,t.data)/100,{x:t.data.x,y:t.data.y,overwrite:0,onComplete:onMove,ease:Linear.easeNone})
			this._lastPlace = int(e.currentTarget.name)
		}
		
		private function onMove():void
		{
			if(_moveStack.length>0)
			{
				var t:AstarNode = _moveStack.pop()				 
				TweenLite.to(_player,this.distance(_player,t.data)/100,{x:t.data.x,y:t.data.y,overwrite:0,onComplete:onMove,ease:Linear.easeNone})
			}
		}
		

	}
}