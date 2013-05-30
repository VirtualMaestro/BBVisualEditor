package joints
{
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class AngleJointScheme extends BaseJointScheme
	{
		[Inspectable(name = "02   Actor name 1", type="String", defaultValue="this")]
		public var actorName1:String = "this";

		[Inspectable(name = "03   Actor name 2", type="String", defaultValue="world")]
		public var actorName2:String = "world";

		[Inspectable(name = "14   Ratio", type="Number", defaultValue="1")]
		public var ratio:Number = 1;

		[Inspectable(name = "15   Joint [min, max] (in degrees)", type="Array", defaultValue="-180, 180")]
		public var jointMinMax:Array = [-180, 180];

		/**
		 */
		public function AngleJointScheme()
		{
			super();
		}
	}
}