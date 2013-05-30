package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class MotorJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "02   Actor name 1", type="String", defaultValue="this")]
		public var actorName1:String = "this";

		[Inspectable(name = "03   Actor name 2", type="String", defaultValue="world")]
		public var actorName2:String = "world";

		[Inspectable(name = "14   Ratio", type="Number", defaultValue="1")]
		public var ratio:Number = 1;

		[Inspectable(name = "15   Rate", type="Number", defaultValue="0")]
		public var rate:Number = 0;


		/**
		 */
		public function MotorJointScheme()
		{
			super();
		}
	}
}