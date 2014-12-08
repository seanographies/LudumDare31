package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class SpeakerBox extends Entity 
	{
		protected var _image:Image = new Image(GA.SPEAKERBOX_PROTO);
		public function SpeakerBox(x:Number=0, y:Number=0, graphic:Graphic=null) 
		{
			_image.scale = 2;
			super(x, y, _image);
			setHitbox(0, 0, 1000, 1000);
			layer = 1;
		}
		
		override public function update():void 
		{
			super.update();
			updateMoanCollision();
		}
		
		protected function updateMoanCollision():void {
			if (collide("Moan", x, y)) {
				setHitbox(0, 0, 1000, 1000);
			}
		}
		
		
	}

}