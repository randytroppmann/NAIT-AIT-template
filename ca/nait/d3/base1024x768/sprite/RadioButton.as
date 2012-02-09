package ca.nait.d3.base1024x768.sprite{
	
	import ca.nait.d3.base1024x768.sprite.event.RadioButtonEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	public class RadioButton extends MovieClip{
		
		public var overColor:uint = 0xffffff;		
		public var downColor:uint = 0xD2DEFF;		
		public var outColor:uint = 0xffffff;
		private var _isCorrect:Boolean = false;
		
		public function RadioButton(){
			selectedDot.visible = false;
			xMark.visible = false;
			checkMark.visible = false;
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
			addEventListener(MouseEvent.MOUSE_UP, onMouseOver, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
			addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);			
		}	
		
		
		protected function onMouseDown(p_evt:MouseEvent):void{
			if (enabled) changeMiddleColor(downColor);
		}		
		protected function onMouseOver(p_evt:MouseEvent):void{
			if (enabled) changeMiddleColor(overColor);
		}
		protected function onMouseOut(p_evt:MouseEvent):void{
			if (enabled) changeMiddleColor(outColor);
		}
		protected function onMouseClick(p_evt:MouseEvent):void{
			if (enabled){
				dispatchEvent(new RadioButtonEvent(RadioButtonEvent.CLICK));
				//selectedDot.visible = true;
			}
		}
		
		public function get isCorrect():Boolean{
			return _isCorrect;
		}
		
		public function set isCorrect(p_bool:Boolean):void{
			_isCorrect = p_bool;
			xMark.visible = !isCorrect;
			checkMark.visible = isCorrect;
		}
		
		public function changeMiddleColor(p_color:int):void{
			var colorTransform:ColorTransform = middle.transform.colorTransform;
			colorTransform.color = p_color;	
			middle.transform.colorTransform = colorTransform;
		}

	}
}