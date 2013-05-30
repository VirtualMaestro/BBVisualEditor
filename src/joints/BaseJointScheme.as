package joints
{
	import flash.display.MovieClip;
	
	/**
	 * @author VirtualMaestro
	 */
	public class BaseJointScheme extends MovieClip
	{
		[Inspectable(name = "01   Joint name", type="String", defaultValue="")]
		public var jointName:String = "";

//		[Inspectable(name = "02   Actor name 1", type="String", defaultValue="this")]
//		public var actorName1:String = "this";
		
//		[Inspectable(name = "03   Actor name 2", type="String", defaultValue="world")]
//		public var actorName2:String = "world";

		[Inspectable(name = "04   Is guiding joint", type="Boolean", defaultValue=false)]
		public var isGuiding:Boolean = false;

		[Inspectable(name = "05   Ignore", type="Boolean", defaultValue=true)]
		public var ignore:Boolean = true;

		[Inspectable(name = "06   Active", type="Boolean", defaultValue=true)]
		public var active:Boolean = true;

		[Inspectable(name = "07   Stiff", type="Boolean", defaultValue=true)]
		public var stiff:Boolean = true;

		[Inspectable(name = "08   Frequency", type="Number", defaultValue=10.0)]
		public var frequency:Number = 10.0;

		[Inspectable(name = "09   Damping", type="Number", defaultValue=0.5)]
		public var damping:Number = 1.0;

		[Inspectable(name = "10   Max force", type="Number", defaultValue=1000000000)]
		public var maxForce:Number = 1000000000;

		[Inspectable(name = "11   Max error", type="Number", defaultValue=1000000000)]
		public var maxError:Number = 1000000000;

		[Inspectable(name = "11   Remove on break", type="Boolean", defaultValue=true)]
		public var removeOnBreak:Boolean = true;

		[Inspectable(name = "12   Break under force", type="Boolean", defaultValue=true)]
		public var breakUnderForce:Boolean = false;
		
		[Inspectable(name = "13   Break under error", type="Boolean", defaultValue=true)]
		public var breakUnderError:Boolean = false;


		
		/**
		 */
		public function BaseJointScheme()
		{
			super();
		}
	}
}