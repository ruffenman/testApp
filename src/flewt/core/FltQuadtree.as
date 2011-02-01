package flewt.core 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author ruffenman
	 */
	public class FltQuadtree 
	{		
		public function FltQuadtree(x:Number, y:Number, width:Number, height:Number)
		{
			_bounds = new Rectangle(x, y, width, height);
		}
		
		public function add(object:FltObject):void
		{
			//TODO: add objects to quadtree
		}
		
		public function get a():FltQuadtree
		{
			return _a;
		}
		
		public function get b():FltQuadtree
		{
			return _b;
		}
		
		public function get c():FltQuadtree
		{
			return _c;
		}
		
		public function get d():FltQuadtree
		{
			return _d;
		}
		
		private var _bounds:Rectangle;
		
		private var _a:FltQuadtree;
		private var _b:FltQuadtree;
		private var _c:FltQuadtree;
		private var _d:FltQuadtree;
		
		private var _children:FltList;
	}

}