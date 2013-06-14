package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class AngleJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "14   Ratio", type="Number", defaultValue="1")]
		public var ratio:Number = 1;

		[Inspectable(name = "15   Joint [min, max] (in degrees)", type="Array", defaultValue="-180, 180")]
		public var jointMinMax:Array = [-180, 180];

		/**
		 */
		public function AngleJointScheme()
		{
			super("joints::AngleJointScheme", "joints::BaseJointScheme");
		}
	}
}