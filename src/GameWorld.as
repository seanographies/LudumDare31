package  
{
	import net.flashpunk.World;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	import net.flashpunk.Entity
	import net.flashpunk.masks.Grid;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	
	
	/**
	 * ...
	 * @author sean singh
	 */
	public class GameWorld extends World 
	{
		//Map grid
		protected var map:Entity;
		public var _mapGrid:Grid;
		public var _mapImage:Image;
		protected var _mapData:Class;
		
		public function GameWorld(mapData:Class) 
		{
			_mapData = mapData;
			super(); 
			loadMap(_mapData);
			
		}
		
		override public function begin():void {
			super.begin();
			add(new Moan);
			add(new GameTimer(400, 37));
			//462,500
			add(new Instructions(362, 420));
		}
		
		protected function loadMap(mapData:Class):void {
			var mapXML:XML = FP.getXML(mapData);
			var node:XML;
			
			//map grid
            _mapGrid = new Grid(uint(mapXML.@width), (uint(mapXML.@height)), 32,32,0,0);
            _mapGrid.loadFromString(String(mapXML.Grid), "", "\n");
			
			//player
			for each(node in mapXML.Entities.Player) {
				add(new Player(Number(node.@x), Number(node.@y)));
			}	
			//SpeakerBox
			for each(node in mapXML.Entities.SpeakerBox) {
				add(new SpeakerBox(Number(node.@x), Number(node.@y)));
			}			
			//Ear
			for each(node in mapXML.Entities.Ear) {
				add(new Ear(Number(node.@x), Number(node.@y)));
			}
			
		}
	}

}