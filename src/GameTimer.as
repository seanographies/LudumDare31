package  
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.*;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameTimer extends Entity 
	{
		protected var t:Text;
		protected var timelimit:Number = 80;
		protected var timer:Boolean = true;
		
		protected var _replay:Boolean = false;
		
		public function GameTimer(x:Number=0, y:Number=0) 
		{
			super(x, y,t);
		}
		
		override public function update():void {
			super.update();
			Timer();
			replay();
		}
		
		protected function Timer():void {
			if(GV.PLAY){
			if (timer) {
				timelimit -= FP.elapsed;
				updateCounter(timelimit);
				if (timelimit <= 0) {
					trace("end game");
					_replay = true;
					timelimit = 0;
					timer = false;
					GV.PLAY = false;
				}
			}
		}
		}
		
		protected function replay():void {
			if(_replay){
					if (Input.pressed(Key.W)) {
						FP.world = new GameWorld(GA.LEVEL);
						_replay = false;
					}
			}		
		}
		
		protected function updateCounter(_counter:int):void {
				var bc:String = new String(_counter);
				t= new Text(bc);
				t.x = 8;
				t.y = - 27;
				t.color = 0x000000;
				t.size = 30;
				graphic = t;
		}		
	}

}