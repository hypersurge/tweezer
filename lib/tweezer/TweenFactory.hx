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
import tweezer.tweens.Back;
import tweezer.tweens.Bounce;
import tweezer.tweens.Circular;
import tweezer.tweens.Cubic;
import tweezer.tweens.Elastic;
import tweezer.tweens.Exponential;
import tweezer.tweens.Linear;
import tweezer.tweens.Quadratic;
import tweezer.tweens.Quartic;
import tweezer.tweens.Quintic;
import tweezer.tweens.Sine;

/**
 * Static Factory method to create Tweens by type.
 * @author	Robert Fell
 */
class TweenFactory
{	
	/**
	 * Helper function to create a tween value.
	 * @param	p_currentTime	Current time (in frames or seconds)
	 * @param	p_startValue	Starting value
	 * @param	p_changeInValue	Change needed in value
	 * @param	p_duration	Expected easing duration (in frames or seconds)
	 * @param	p_easingType	The type of easing
	 * @param	p_tweenType	The type of tween function
	 * @return	The tweened value
	 */
	public static function createTween( p_currentTime:Float, p_startValue:Float, p_changeInValue:Float, p_duration:Float, p_easeType:EEase, p_tweenType:ETween ):Float
	{
		return createTweenFunction( p_startValue, p_changeInValue, p_duration, p_easeType, p_tweenType )( p_currentTime );
	}
	
	/**
	 * Helper function to create a tween function.
	 * @param	p_currentTime	Current time (in frames or seconds)
	 * @param	p_startValue	Starting value
	 * @param	p_changeInValue	Change needed in value
	 * @param	p_duration	Expected easing duration (in frames or seconds)
	 * @param	p_easingType	The type of easing
	 * @param	p_tweenType	The type of tween function
	 * @return	The simple tween function
	 */
	public static function createTweenFunction( p_startValue:Float, p_changeInValue:Float, p_duration:Float, p_easeType:EEase, p_tweenType:ETween ):Float->Float
	{
		if ( p_easeType == null )
		{
			p_easeType = EASE_IN;
		}
		if ( p_tweenType == null )
		{
			p_tweenType = LINEAR;
		}
		return switch( p_tweenType )
		{
			case BACK( p_overshoot ) :
				if ( p_overshoot == null )
				{
					p_overshoot = 1.70158;
				}
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ) { return Back.easeIn( p_value, p_startValue, p_changeInValue, p_duration, p_overshoot ); };
					case EASE_IN_OUT : function( p_value:Float ) { return Back.easeInOut( p_value, p_startValue, p_changeInValue, p_duration, p_overshoot ); };
					case EASE_OUT : function( p_value:Float ) { return Back.easeOut( p_value, p_startValue, p_changeInValue, p_duration, p_overshoot ); };
					case EASE_OUT_IN : function( p_value:Float ) { return Back.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration, p_overshoot ); };
				}
			case BOUNCE :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Bounce.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ) { return Bounce.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Bounce.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Bounce.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case CIRCULAR :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Circular.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Circular.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Circular.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Circular.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case CUBIC :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Cubic.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Cubic.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Cubic.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Cubic.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case ELASTIC( p_period, p_amplitude ) :
				if ( p_period == null )
				{
					p_period = p_duration * .3 * ( p_easeType == EASE_IN_OUT ? 1.5 : 1 );
				}
				if ( p_amplitude == null )
				{
					p_amplitude = 0;
				}
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Elastic.easeIn( p_value, p_startValue, p_changeInValue, p_duration, p_period, p_amplitude ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Elastic.easeInOut( p_value, p_startValue, p_changeInValue, p_duration, p_period, p_amplitude ); };
					case EASE_OUT : function( p_value:Float ){ return Elastic.easeOut( p_value, p_startValue, p_changeInValue, p_duration, p_period, p_amplitude ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Elastic.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration, p_period, p_amplitude ); };
				}
			case EXPONENTIAL :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Exponential.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Exponential.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Exponential.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Exponential.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case LINEAR :
				function( p_value:Float ){ return Linear.ease( p_value, p_startValue, p_changeInValue, p_duration ); };
			case QUADRATIC :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Quadratic.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Quadratic.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Quadratic.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Quadratic.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case QUARTIC :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Quartic.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Quartic.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Quartic.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Quartic.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case QUINTIC :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Quintic.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Quintic.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Quintic.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Quintic.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
			case SINE :
				switch( p_easeType )
				{
					case EASE_IN : function( p_value:Float ){ return Sine.easeIn( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_IN_OUT : function( p_value:Float ){ return Sine.easeInOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT : function( p_value:Float ){ return Sine.easeOut( p_value, p_startValue, p_changeInValue, p_duration ); };
					case EASE_OUT_IN : function( p_value:Float ){ return Sine.easeOutIn( p_value, p_startValue, p_changeInValue, p_duration ); };
				}
		}
	}
	
}