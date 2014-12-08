package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class Moan extends Entity 
	{
		private var _tiles:Tilemap;
		private var _grid:Grid = new Grid(320, 320, 64, 64, 256, 96);
		
		//setRect values for randomization
		protected var _column:int;
		protected var _row:int;
		protected var Range:int = 5;
		protected var Low:int = 0;
		
		protected var _spawn:Boolean = true;
		
		public function Moan() 
		{
			mask = _grid;
			type = "Moan";
		}
		
		override public function update():void {
			super.update();
			updateCollision();
			spawn();
		}
		
		protected function spawn():void {
			if(_spawn){
				_column = Math.floor(Math.random() * Range) + Low;
				_row = Math.floor(Math.random() * Range) + Low;
				
				_grid.setTile(_column,_row);
				_spawn = false;
				GV.MOAN_X = _column * 64 + 256;
				GV.MOAN_Y = _row * 64 + 96;
				trace(GV.MOAN_X);
				trace ( GV.MOAN_Y);
			}
			
		}
		
		protected function updateCollision():void {
			if (collide("Player", x, y)) {
				_grid.clearTile(_column, _row);
				_spawn = true;
			}
		}
		
	}

}