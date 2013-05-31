package  {
	import flash.events.MouseEvent;
	import adobe.utils.MMExecute;
	import flash.display.MovieClip;
	import flash.text.TextField;

	//
	public class LevelExporterPanel extends MovieClip
	{
		public var xmlPathTextField:TextField;
		public var xmlPathButton:MovieClip;
		public var exportButton:MovieClip;

		private var _beginCommand:String = "fl.runScript(fl.configURI + 'WindowSWF/LevelExporter.jsfl',";
		private var _endCommand:String = ");";
		
		//
		public function LevelExporterPanel() 
		{
			xmlPathTextField.text = "";
			xmlPathButton.addEventListener(MouseEvent.CLICK, xmlPathButtonClick);
			exportButton.addEventListener(MouseEvent.CLICK, exportButtonClick);
		}
		
		//
		private function xmlPathButtonClick(event:MouseEvent):void
		{
			xmlPathTextField.text = sendCommand('setXMLPath');
		}

		/**
		*/
		private function exportButtonClick(event:MouseEvent):void
		{
			sendCommand('exportLevels', xmlPathTextField.text);
		}
		
		//
		private function sendCommand(functionName:String, ...params):String
		{
			var parameters:String = "";
			var len:int = params.length;
			for (var i:int = 0; i < len; i++)
			{
				parameters += ",";
				if (params[i] is String) 
				{
					parameters += "'" + params[i] + "'";
				}
				else 
				{
					parameters += params[i];
				}
			}
			
			var query:String = _beginCommand + '\''+ functionName + '\''+ parameters + _endCommand;

			return MMExecute(query);
		}
	}
}
