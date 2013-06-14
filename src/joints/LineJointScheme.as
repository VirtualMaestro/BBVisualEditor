package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class LineJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "14   Joint [min, max]", type="Array", defaultValue="10, 50")]
		public var jointMinMax:Array = [10, 50];

		/**
		 */
		public function LineJointScheme()
		{
			super("joints::LineJointScheme", "joints::BaseJointScheme");
		}
	}
}