package actors
{
	import flash.display.MovieClip;

	/**
	 *
	 * @author VirtualMaestro
	 */
	public class ActorScheme extends MovieClip
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

		[Inspectable(name="07   Is update", type="Boolean", defaultValue="false")]
		public var isUpdate:Boolean = false;

		[Inspectable(name="08   Layer", type="List", defaultValue="BACKEND, BACKGROUND, MIDDLEGROUND, FOREGROUND, FRONTEND", listOffset=2)]
		public var layerName:String = "MIDDLEGROUND";

		[Inspectable(name="09   Cache", type="Boolean", defaultValue="true")]
		public var cache:Boolean = true;

		[Inspectable(name="10   Collision internal actors", type="Boolean", defaultValue="true")]
		public var isCollisionInternalActors:Boolean = true;

		[Inspectable(name="11   Is dynamic creation", type="Boolean", defaultValue="false")]
		public var isDynamicCreation:Boolean = false;

		[Inspectable(name="12   Use hand", type="Boolean", defaultValue="false")]
		public var useHand:Boolean = false;

		/**
		 */
		public function ActorScheme()
		{
			super();
		}
	}
}