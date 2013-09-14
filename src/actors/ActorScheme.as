package actors
{
	/**
	 *
	 * @author VirtualMaestro
	 */
	public class ActorScheme extends BaseScheme
	{
		[Inspectable(name="01   Actor name", type="String", defaultValue="")]
		public var actorName:String = "";

		[Inspectable(name="02   Type", type="List", defaultValue="STATIC, DYNAMIC, KINEMATIC", listOffset=0)]
		public var actorType:String = "STATIC";

		[Inspectable(name="03   Same type for children", type="Boolean", defaultValue="false")]
		public var sameTypeForChildren:Boolean = false;

		[Inspectable(name="04   Allow rotation", type="Boolean", defaultValue="true")]
		public var allowRotation:Boolean = true;

		[Inspectable(name="05   Allow Movement", type="Boolean", defaultValue="true")]
		public var allowMovement:Boolean = true;

		[Inspectable(name="06   Graphics rotation", type="Boolean", defaultValue="true")]
		public var graphicsRotation:Boolean = true;

		[Inspectable(name="07   Layer", type="List", defaultValue="BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND, MENU, PANEL, MESSAGE, PARTICLE, POPUP, MAIN", listOffset=2)]
		public var layerName:String = "MIDDLEGROUND";

		[Inspectable(name="08   Collision internal actors", type="Boolean", defaultValue="true")]
		public var isCollisionInternalActors:Boolean = true;

		[Inspectable(name="09   Use hand", type="Boolean", defaultValue="false")]
		public var useHand:Boolean = false;

		[Inspectable(name="10   Is bullet", type="Boolean", defaultValue="false")]
		public var isBullet:Boolean = false;

		[Inspectable(name="11   Gravity", type="Array", defaultValue="")]
		public var gravity:Array = null;

		[Inspectable(name="12   Air friction", type="Number", defaultValue="0.0")]
		public var airFriction:Number = 0.0;

		/**
		 */
		public function ActorScheme()
		{
			super("actors::ActorScheme", "BaseScheme");
		}
	}
}