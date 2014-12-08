package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Instructions extends Entity 
	{
		protected var _image:Image;
		protected var _line:int = 0;
		
		protected var counter:Number = 0;
		protected var timelimit:Number = 1;
		protected var timerStart:Boolean = false;
		
		public function Instructions(x:Number=0, y:Number=0) 
		{
			displayInstructions();
			super(x, y,_image);
		}
		
		override public function update():void {
			super.update();
			timer();
		}
		
		protected function displayInstructions():void {
			switch(_line) {
				case 0:
					_image = new Image(GA.INSTRUCTION_1);
					timerStart = true;
					break;
				case 1:
					_image = new Image(GA.INSTRUCTION_2);
					graphic = _image;
					timerStart = true;
					break;
				case 2:
					_image = new Image(GA.INSTRUCTION_3);
					graphic = _image;
					timerStart = true;
					break;
				case 3:
					_image = new Image(GA.INSTRUCTION_4);
					graphic = _image;
					timerStart = true;
					break;
				case 4:
					GV.PLAY = true;
					FP.world.remove(this);
					break;
			}
		}
		
		protected function timer():void {
			if (Input.pressed(Key.W)) {
				_line++;
				displayInstructions();
			}
		}
		
	}

}