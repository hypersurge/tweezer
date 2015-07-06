package demo;
import awe6.core.drivers.createjs.extras.gui.Image;
import awe6.core.drivers.createjs.extras.gui.Text;
import awe6.core.Scene;
import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;
import tweezer.EEase;
import tweezer.ETween;
import tweezer.Tweezer;

/**
 * A simple test scene with an Image Tweezer
 * @author	Robert Fell
 */

class Test extends Scene 
{
	private var _eases:Array<EEase>;
	private var _tweens:Array<ETween>;
	private var _image:Image;
	private var _text:Text;
	
	public function new( p_kernel:IKernel, p_type:EScene, p_isPauseable:Bool = false, p_isMuteable:Bool = true, p_isSessionSavedOnNext:Bool = false ) 
	{
		super( p_kernel, p_type, p_isPauseable, p_isMuteable, p_isSessionSavedOnNext );
	}
	
	override function _init():Void 
	{
		super._init();
		_eases = [ EEase.EASE_IN, EEase.EASE_IN_OUT, EEase.EASE_OUT, EEase.EASE_OUT_IN ];
		_tweens = [ ETween.BACK(), ETween.BOUNCE, ETween.CIRCULAR, ETween.CUBIC, ETween.ELASTIC(), ETween.EXPONENTIAL, ETween.LINEAR, ETween.QUADRATIC, ETween.QUARTIC, ETween.QUINTIC, ETween.SINE ];
		_image = new Image( _kernel, "assets/Circle.png" );
		_image.setPosition( 0, 0 );
		addEntity( _image, true, 5 );
		_text = new Text( _kernel, _kernel.factory.width, 30, "Test", _kernel.factory.createTextStyle() );
		_text.setPosition( 0, _kernel.factory.height - _text.height );
		addEntity( _text, true, 10 );
		_createRandomTweezer();
	}
	
	private function _createRandomTweezer():Void
	{
		var l_ease = _eases[ Std.random( _eases.length ) ];
		var l_tween = _tweens[ Std.random( _tweens.length ) ];
		var l_tweezer = new Tweezer( _kernel, _updateImagePosition, -128, _kernel.factory.width - 128, 500, 2000, 1000, l_ease, l_tween, _createRandomTweezer );
		_image.addEntity( l_tweezer );
		_text.text = _kernel.tools.toWords( Type.enumConstructor( l_tween ) + "_" + l_ease );
		_kernel.overlay.flash();
	}
	
	private function _updateImagePosition( p_value:Float ):Void
	{
		_image.x = p_value;
	}
}
