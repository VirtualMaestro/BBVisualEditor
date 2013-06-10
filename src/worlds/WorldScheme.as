package worlds
{
	import flash.display.MovieClip;
	
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class WorldScheme extends MovieClip
	{
//		[Inspectable(name = "01   Time step 1 / ", type="Number", defaultValue=30)]
//		public var timeStep:Number = 30;

		[Inspectable(name = "02   Gravity", type="Array", defaultValue="0, 1200")]
		public var gravity:Array = [0, 1200];

//		[Inspectable(name = "03   Velocity iterations", type="Number", defaultValue=20)]
//		public var velocityIterations:Number = 20;
//
//		[Inspectable(name = "04   Position iterations", type="Number", defaultValue=20)]
//		public var positionIterations:Number = 20;

		/**
		 */
		public function WorldScheme()
		{
			super();
		}
	}
}