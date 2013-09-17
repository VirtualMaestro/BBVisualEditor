package graphics
{
	/**
	 */
	public class GraphicsScheme extends BaseScheme
	{
		[Inspectable(name="01   Start playing from", type="Number", defaultValue="0")]
		public var playFrom:Number = 0;  // if '0' mean stop

		[Inspectable(name="02   Frame rate", type="Number", defaultValue=30)]
		public var frameRate:Number = 30;

		[Inspectable(name="03   Layer name", type="List", defaultValue="NONE, BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=0)]
		public var layerName:String = "NONE";

		/**
		 */
		public function GraphicsScheme()
		{
			super("graphics::GraphicsScheme", "BaseScheme");
		}
	}
}
