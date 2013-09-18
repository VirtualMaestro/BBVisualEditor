/**
 * User: VirtualMaestro
 * Date: 14.09.13
 * Time: 21:02
 */
package layers
{
	/**
	 */
	public class LayerScheme extends BaseScheme
	{
		[Inspectable(name="01   Layer name", type="List", defaultValue="BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=2)]
		public var layerName:String = "MIDDLEGROUND";

		[Inspectable(name="02   Deep index", type="List", defaultValue="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20", listOffset=0)]
		public var deepIndex:Number = 0;

		[Inspectable(name="03   Add to layer", type="List", defaultValue="NONE, BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=0)]
		public var addToLayer:String = "NONE";

		[Inspectable(name="04   Attach camera", type="Boolean", defaultValue="false")]
		public var attachCamera:Boolean = false;

		[Inspectable(name="05   Depend on camera", type="List", defaultValue="NONE, BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=0)]
		public var dependOnCamera:String = "NONE";

		[Inspectable(name="06   Depend X", type="Number", defaultValue="0.0")]
		public var dependX:Number = 0.0;

		[Inspectable(name="07   Depend Y", type="Number", defaultValue="0.0")]
		public var dependY:Number = 0.0;

		[Inspectable(name="08   Depend Zoom", type="Number", defaultValue="0.0")]
		public var dependZoom:Number = 0.0;

		[Inspectable(name="09   Camera X", type="Number", defaultValue="0.0")]
		public var cameraX:Number = 0.0;

		[Inspectable(name="10   Camera Y", type="Number", defaultValue="0.0")]
		public var cameraY:Number = 0.0;

		[Inspectable(name="11   Camera mouse enable", type="Boolean", defaultValue="false")]
		public var cameraMouseEnable:Boolean = false;

		/**
		 */
		public function LayerScheme()
		{
			super("layers::LayerScheme", "BaseScheme");
		}
	}
}
