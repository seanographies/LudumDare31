package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.*;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Player extends Entity 
	{
		protected var timerStart:Boolean = false;
		protected var counter:Number = 0;
		protected var timeLimit:Number = 1.5;
		protected var delay:Boolean = false;
		
		protected var _sfx:Sfx = new Sfx(GA.DIRECTION_SFX);
		protected var _pan:Number;
		protected var _vol:Number;
		
		protected var _moan:Sfx;
		protected var moan_number:Number;
		protected var Range:Number = 10;
		protected var Low:Number = 1;
		protected var _image:Image = new Image(GA.PLAYER);
		
		
		public function Player(x:Number=0, y:Number=0) 
		{
			super(x, y,_image);
			
			setHitbox(64, 64, 0, 0);
			type = "Player";
			directionalSound();
		}
		
		override public function update():void {
			super.update();
			timer();
			controls();
			updateMoanCollision();
		}
		
		//timer for the delay of movement
		protected function timer():void {
			if(timerStart){
				counter += FP.elapsed;
				//trace(counter);
				if (counter >= timeLimit) {
					timerStart = false;
					delay = false;
					timeLimit = 1.5;
					counter = 0;
				}
			}
		}
		
		protected function directionalSound():void {
			//distance
			var _x:Number = this.x/64 - GV.MOAN_X/64;
			var _y:Number = this.y / 64 - GV.MOAN_Y / 64;
			trace("Rows away:" + _y);
			trace( "Columns away: " + _x);
			
			switch(_x) {
				case 4:
					_pan = -1;
					break;
				case 3:
					_pan = -1;
					break;
				case 2:
					_pan = -0.5;
					break;
				case 1:
					_pan = -0.1;
					break;
				case 0:
					_pan = 0;
					break;
				case -1:
					_pan = 0.1;
					break;
				case -2:
					_pan = 0.5;
					break;
				case -3:
					_pan = 1;
					break;
				case -4:
					_pan = 1;
					break;
				default: break;
			}
			
			switch(_y) {
				case -4:
					_vol = 1;
					break;
				case -3:
					_vol = 0.8;
					break;
				case -2:
					_vol = 0.5;
					break;
				case -1:
					_vol = 0.3;
					break;
				case 0:
					_vol = 0.1;
					break;
				case 1:
					_vol = 0.3;
					break;
				case 2:
					_vol = 0.5;
					break;
				case 3:
					_vol = 0.8;
					break;
				case 4:
					_vol = 1;
					break;
				default: break;			
			}
			_sfx.play(_vol, _pan);
		}
		
		//movement of player is dependent on cursors position when clicked
		protected function controls():void {
			if (GV.PLAY){
				//player limit
				if (this.x > 512) this.x = 512;
				if (this.x < 256) this.x = 256;
				if (this.y < 96) this.y = 96;
				if (this.y > 352) this.y = 352;
				if(!delay){
					if (Input.pressed(Key.W)) {
						this.y -= 64;
						delay = true;
						timerStart = true;
						directionalSound();
					}			if (Input.pressed(Key.S)) {
						this.y += 64;
						delay = true;
						timerStart = true;
						directionalSound();
					}			if (Input.pressed(Key.A)) {
						this.x -= 64;
						delay = true;
						timerStart = true;
						directionalSound();
						}			if (Input.pressed(Key.D)) {
						this.x += 64;
						delay = true;
						timerStart = true;
						directionalSound();
					}
				}
			}
		}
		
		protected function updateMoanCollision():void {
			if (collide("Moan", x, y)) {
				_sfx.stop();
				//snippets of moan play here
				moanSounds();
				delay = true;
				timeLimit = 3.5;
				timerStart = true;
			}
		}
		
		protected function moanSounds():void {
			moan_number = Math.floor(Math.random() * Range) + Low;
			var sound:Class;
			switch(moan_number) {
				case 1:
					sound = GA.WOMAN_MOAN_1;
					break;
				case 2:
					sound = GA.WOMAN_MOAN_2;
					break;
				case 3:
					sound = GA.WOMAN_MOAN_3;
					break;
				case 4:
					sound = GA.WOMAN_MOAN_4;
					break;
				case 5:
					sound = GA.WOMAN_MOAN_5;
					break;
				case 6:
					sound = GA.MAN_MOAN_1;
					break;
				case 7:
					sound = GA.MAN_MOAN_2;
					break;
				case 8:
					sound = GA.MAN_MOAN_3;
					break;
				case 9:
					sound = GA.MAN_MOAN_4;
					break;
				case 10:
					sound = GA.MAN_MOAN_5;
					break;
			}
			_moan = new Sfx(sound);
			_moan.play();
		}
		
	}

}