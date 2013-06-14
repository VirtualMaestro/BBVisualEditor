package worlds
{
	import flash.display.MovieClip;
	
	/**
	 * 
	 * @author VirtualMaestro
	 */
	public class WorldScheme extends BaseScheme
	{
		[Inspectable(name = "02   Gravity", type="Array", defaultValue="0, 1200")]
		public var gravity:Array = [0, 1200];

		/**
		 */
		public function WorldScheme()
		{
			super("worlds::WorldScheme", "BaseScheme");
		}
	}
}