package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class PivotJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "02   Actor name 1", type="String", defaultValue="this")]
		public var actorName1:String = "this";

		[Inspectable(name = "03   Actor name 2", type="String", defaultValue="world")]
		public var actorName2:String = "world";

		/**
		 */
		public function PivotJointScheme()
		{
			super();
		}
	}
}