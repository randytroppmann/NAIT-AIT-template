package ca.nait.d3.base1024x768.sprite.event{
	import flash.events.Event;
	
	public class RadioButtonEvent extends Event{
		
		public static const CLICK:String = "ca.nait.d3.autobody.swayfront.sprite.event.RadioButtonEvent.CLICK";
		
		public function RadioButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}