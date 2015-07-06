/**
 *  _                       
 * | |___      _____  ___ _________ _
 * | __\ \ /\ / / _ \/ _ \_  / _ \ '_|
 * | |__\ V  V /  __/  __// /  __/ |    
 *  \____\_/\_/ \___|\___/___\___|_|   
 *   tweezer: easy tweening & easing
 *
 * Copyright (c) 2015, Robert Fell
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package tweezer;
import awe6.core.Entity;
import awe6.interfaces.IKernel;

/**
 * Tweezer awe6 entity for adding Tweening & Easing behavior.
 * @author	Robert Fell
 */
class Tweezer extends Entity 
{	
	private var _updateCallback:Float->Void;
	private var _startValue:Float;
	private var _endValue:Float;
	private var _startDelay:Int;
	private var _duration:Int;
	private var _endDelay:Int;
	private var _easeType:EEase;
	private var _tweenType:ETween;
	private var _completeCallback:Void->Void;
	private var _isSnap:Bool;
	private var _tweenFunction:Float->Float;
	
	/**
	 * Tweezer awe6 entity for adding Tweening & Easing behavior.
	 * @param	p_kernel	The awe6 kernel
	 * @param	p_updateCallback	The function to call back with a tween value each update
	 * @param	p_startValue	The starting value (from)
	 * @param	p_endValue	The ending value (to)
	 * @param	p_startDelay	The intial delay before the tween begins
	 * @param	p_duration	The duration of the tween
	 * @param	p_endDelay	The final delay after the tween completes
	 * @param	p_easeType	The ease type
	 * @param	p_tweenType	The tween type
	 * @param	p_completeCallback	An optional function to call on completion
	 * @param	p_isSnap	Whether values are rounded
	 */
	public function new( p_kernel:IKernel, p_updateCallback:Float->Void, p_startValue:Float, p_endValue:Float, ?p_startDelay:Int = 0, ?p_duration:Int = 1000, ?p_endDelay:Int = 0, ?p_easeType:EEase, ?p_tweenType:ETween, ?p_completeCallback:Void->Void, ?p_isSnap:Bool ) 
	{
		_updateCallback = p_updateCallback;
		_startValue = p_startValue;
		_endValue = p_endValue;
		_startDelay = p_startDelay;
		_duration = p_duration;
		_endDelay = p_endDelay;
		_easeType = p_easeType;
		_tweenType = p_tweenType;
		_completeCallback = p_completeCallback;
		_isSnap = p_isSnap;
		super( p_kernel );
		_updater();
		_updates = 0;
	}
	
	override function _init():Void 
	{
		super._init();
		_tweenFunction = TweenFactory.createTweenFunction( _startValue, ( _endValue - _startValue ), _duration, _easeType, _tweenType );
	}
	
	override private function _updater( p_deltaTime:Int = 0 ):Void 
	{
		super._updater( p_deltaTime );
		if ( _updateCallback != null )
		{
			var l_value = _tweenFunction( Math.min( Math.max( 0, _age - _startDelay ), _duration ) );
			_updateCallback( _isSnap ? Math.round( l_value ) : l_value );
		}
		if ( _age >= ( _startDelay + _duration + _endDelay ) )
		{
			if ( _completeCallback != null )
			{
				_completeCallback();
			}
			dispose();
		}
	}
	
	public function clone():Tweezer
	{
		return new Tweezer( _kernel, _updateCallback, _startValue, _endValue, _startDelay, _duration, _endDelay, _easeType, _tweenType, _completeCallback, _isSnap );
	}
}