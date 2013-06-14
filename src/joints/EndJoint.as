/**
 * User: VirtualMaestro
 * Date: 14.06.13
 * Time: 12:57
 */
package joints
{
	/**
	 */
	public class EndJoint extends BaseScheme
	{
		[Inspectable(name="01   Joint name", type="String", defaultValue="")]
		public var jointName:String = "";

		/**
		 */
		public function EndJoint()
		{
			super("joints::EndJoint", "BaseScheme");
		}
	}
}
