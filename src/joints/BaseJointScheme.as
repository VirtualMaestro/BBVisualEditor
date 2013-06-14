package joints
{
	/**
	 * @author VirtualMaestro
	 */
	public class BaseJointScheme extends BaseScheme
	{
		[Inspectable(name="01   Joint name", type="String", defaultValue="")]
		public var jointName:String = "";

		[Inspectable(name="02   Owner actor", type="String", defaultValue="")]
		public var ownerActorName:String = "";

		[Inspectable(name="03   Jointed actor", type="String", defaultValue="")]
		public var jointedActorName:String = "";

		[Inspectable(name="05   Ignore", type="Boolean", defaultValue=true)]
		public var ignore:Boolean = true;

		[Inspectable(name="06   Active", type="Boolean", defaultValue=true)]
		public var active:Boolean = true;

		[Inspectable(name="07   Stiff", type="Boolean", defaultValue=true)]
		public var stiff:Boolean = true;

		[Inspectable(name="08   Frequency", type="Number", defaultValue=10.0)]
		public var frequency:Number = 10.0;

		[Inspectable(name="09   Damping", type="Number", defaultValue=0.5)]
		public var damping:Number = 1.0;

		[Inspectable(name="10   Max force", type="Number", defaultValue=1000000000)]
		public var maxForce:Number = 1000000000;

		[Inspectable(name="11   Max error", type="Number", defaultValue=1000000000)]
		public var maxError:Number = 1000000000;

		[Inspectable(name="11   Remove on break", type="Boolean", defaultValue=true)]
		public var removeOnBreak:Boolean = true;

		[Inspectable(name="12   Break under force", type="Boolean", defaultValue=true)]
		public var breakUnderForce:Boolean = false;

		[Inspectable(name="13   Break under error", type="Boolean", defaultValue=true)]
		public var breakUnderError:Boolean = false;

		/**
		 */
		public function BaseJointScheme(p_className:String, p_superClassName:String)
		{
			super(p_className, p_superClassName);
		}
	}
}