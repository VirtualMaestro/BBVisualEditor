package graphics
{
	/**
	 */
	public class GraphicsScheme extends BaseScheme
	{
		[Inspectable(name="01   Name", type="String", defaultValue="")]
		public var graphicsName:String = "";

		[Inspectable(name="02   Start playing from", type="Number", defaultValue="0")]
		public var playFrom:Number = 0;  // if '0' mean stop

		[Inspectable(name="03   Frame rate", type="Number", defaultValue=30)]
		public var frameRate:Number = 30;

		[Inspectable(name="04   Layer name", type="List", defaultValue="BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=0)]
		public var layerName:String = "BACKEND";

		/**
		 */
		public function GraphicsScheme()
		{
			super("graphics::GraphicsScheme", "BaseScheme");
		}
	}
}
