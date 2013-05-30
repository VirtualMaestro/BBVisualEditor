package shapes
{
	import flash.display.MovieClip;
	

	
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class BaseShapeScheme extends MovieClip
	{
		[Inspectable(name = "01   Shape name", type="String", defaultValue="")]
		public var shapeName:String = "";

		[Inspectable(name = "02   Predefine material", type="List", defaultValue="NONE, PAPER, WOOD, ICE, MEAT, PLASTIC, RUBBER, SAND, GLASS, GRANITE, STEEL, IRIDIUM",  listOffset=0)]
		public var materialPredefine:String = "NONE";

		[Inspectable(name = "03   Density", type="Number", defaultValue="1.0")]
		public var density:Number = 1.0;

		[Inspectable(name = "04   Elasticity", type="Number", defaultValue="0.4")]
		public var elasticity:Number = 0.4;

		[Inspectable(name = "05   Dynamic friction", type="Number", defaultValue="1.0")]
		public var dynamicFriction:Number = 1.0;

		[Inspectable(name = "06   Static friction", type="Number", defaultValue="2.0")]
		public var staticFriction:Number = 2.0;

		[Inspectable(name = "07   Rolling friction", type="Number", defaultValue="0.01")]
		public var rollingFriction:Number = 0.01;

		[Inspectable(name = "08   Collision group", type="Number", defaultValue="1")]
		public var collisionGroup:Number = 1;

		[Inspectable(name = "09   Collision mask", type="Number", defaultValue="-1")]
		public var collisionMask:Number = -1;

		[Inspectable(name = "10   Sensor group", type="Number", defaultValue="1")]
		public var sensorGroup:Number = 1;

		[Inspectable(name = "11   Sensor mask", type="Number", defaultValue="-1")]
		public var sensorMask:Number = -1;

		[Inspectable(name = "12   Fluid group", type="Number", defaultValue="1")]
		public var fluidGroup:Number = 1;

		[Inspectable(name = "13   Fluid mask", type="Number", defaultValue="-1")]
		public var fluidMask:Number = -1;

		[Inspectable(name = "14   Fluid enable", type="Boolean", defaultValue="false")]
		public var fluidEnable:Boolean = false;

		[Inspectable(name = "15   Fluid density", type="Number", defaultValue="1.0")]
		public var fluidDensity:Number = 1.0;

		[Inspectable(name = "16   Viscosity", type="Number", defaultValue="1.0")]
		public var viscosity:Number = 1.0;

		[Inspectable(name = "17   Fluid gravity", type="Array", defaultValue="")]
		public var fluidGravity:Array = null;

		/**
		 */
		public function BaseShapeScheme()
		{
			super();
		}
	}
}