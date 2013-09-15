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

		[Inspectable(name="02   Add to layer", type="List", defaultValue="NONE, BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=0)]
		public var addToLayer:String = "NONE";

		[Inspectable(name="03   Attach camera", type="Boolean", defaultValue="false")]
		public var attachCamera:Boolean = false;

		[Inspectable(name="04   Depend on camera", type="List", defaultValue="NONE, BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=0)]
		public var dependOnCamera:String = "NONE";

		[Inspectable(name="05   Depend X", type="Number", defaultValue="0.0")]
		public var dependX:Number = 0.0;

		[Inspectable(name="06   Depend Y", type="Number", defaultValue="0.0")]
		public var dependY:Number = 0.0;

		[Inspectable(name="07   Depend Zoom", type="Number", defaultValue="0.0")]
		public var dependZoom:Number = 0.0;

		/**
		 */
		public function LayerScheme()
		{
			super("layers::LayerScheme", "BaseScheme");
		}
	}
}
