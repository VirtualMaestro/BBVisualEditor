package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class WeldJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "14   Phase (degrees)", type="Number", defaultValue="0")]
		public var phase:Number = 0.0;

		/**
		 */
		public function WeldJointScheme()
		{
			super("joints::WeldJointScheme", "joints::BaseJointScheme");
		}
	}
}