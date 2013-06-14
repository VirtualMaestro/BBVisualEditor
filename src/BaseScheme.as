/**
 * User: VirtualMaestro
 * Date: 14.06.13
 * Time: 13:30
 */
package
{
	import flash.display.MovieClip;

	/**
	 */
	public class BaseScheme extends MovieClip
	{
		//
		public var className:String = "BaseScheme";
		public var superClassName:String = "flash.display::MovieClip";

		/**
		 */
		public function BaseScheme(p_className:String, p_superClassName:String)
		{
			super();
			className = p_className;
			superClassName = p_superClassName;
		}
	}
}
