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

		[Inspectable(name = "15   Swap actors", type="Boolean", defaultValue="false")]
		public var swapActors:Boolean = false;



		/**
		 */
		public function LineJointScheme()
		{
			super("joints::LineJointScheme", "joints::BaseJointScheme");
		}
	}
}