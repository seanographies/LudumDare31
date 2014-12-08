package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Ear extends Entity 
	{
		protected var _image:Image = new Image(GA.EAR);
		
		public function Ear(x:Number=0, y:Number=0) 
		{
			super(x, y, _image);
			
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}