package graphics
{
	import flash.display.MovieClip;

	/**
	 *
	 */
	public class GraphicsScheme extends MovieClip
	{
//		[Inspectable(name="01   Name", type="String", defaultValue="")]
//		public var nameGE:String = "";

//		[Inspectable(name="02   Assets name", type="String", defaultValue="")]
//		public var assetsName:String = "";

//		[Inspectable(name="02   Layer name", type="String", defaultValue="root")]
//		public var layerName:String = "root";

//		[Inspectable(name="03   Frames in animation", type="String", defaultValue="")]
//		public var frames:String = "";

		[Inspectable(name="01   Start playing from", type="Number", defaultValue="0")]
		public var playFrom:Number = 0;  // if '0' mean stop

		[Inspectable(name="02   Frame rate", type="Number", defaultValue=30)]
		public var frameRate:Number = 30;

//		[Inspectable(name="06   Graphics rotation", type="Boolean", defaultValue="true")]
//		public var graphicsRotation:Boolean = true;

		/**
		 */
		public function GraphicsScheme()
		{
			super();
		}
	}
}
