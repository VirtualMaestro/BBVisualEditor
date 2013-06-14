package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class MotorJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "14   Ratio", type="Number", defaultValue="1")]
		public var ratio:Number = 1;

		[Inspectable(name = "15   Rate", type="Number", defaultValue="0")]
		public var rate:Number = 0;

		/**
		 */
		public function MotorJointScheme()
		{
			super("joints::MotorJointScheme", "joints::BaseJointScheme");
		}
	}
}