package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class LineJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "02   Actor name", type="String", defaultValue="this")]
		public var actorName1:String = "this";

		[Inspectable(name = "14   Joint [min, max]", type="Array", defaultValue="10, 50")]
		public var jointMinMax:Array = [10, 50];

		/**
		 */
		public function LineJointScheme()
		{
			super();
		}
	}
}