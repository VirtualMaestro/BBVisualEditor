package joints
{
	/**
	 * @author VirtualMaestro
	 */
	public class DistanceJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "14   Joint [min, max]", type="Array", defaultValue="10, 50")]
		public var jointMinMax:Array = [10, 50];

		/**
		 */
		public function DistanceJointScheme()
		{
			super("joints::DistanceJointScheme", "joints::BaseJointScheme");
		}
	}
}