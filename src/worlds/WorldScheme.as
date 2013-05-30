package worlds
{
	import flash.display.MovieClip;
	
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class WorldScheme extends MovieClip
	{
		[Inspectable(name = "01   World size", type="Array", defaultValue="0, 0, 800, 600")]
		public var worldSize:Array = [];

		[Inspectable(name = "02   Destroy if out of world range", type="Boolean", defaultValue="false")]
		public var destroyOutWorld:Boolean = false;

		[Inspectable(name = "03   Time step 1 / ", type="Number", defaultValue=30)]
		public var timeStep:Number = 30;

		[Inspectable(name = "04   Gravity", type="Array", defaultValue="0, 400")]
		public var gravity:Array= [0, 400];

//		[Inspectable(name = "Precision simulation", type="List", defaultValue="LOW, MEDIUM, HIGH", listOffset=0)]
//		public var precisionSimulation:String = "LOW";
		
		[Inspectable(name = "05   Velocity iterations", type="Number", defaultValue=20)]
		public var velocityIterations:Number = 20;

		[Inspectable(name = "06   Position iterations", type="Number", defaultValue=20)]
		public var positionIterations:Number = 20;



		/**
		 */
		public function WorldScheme()
		{
			super();
		}
	}
}