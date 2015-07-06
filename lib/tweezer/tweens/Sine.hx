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

package tweezer.tweens;

/**
 * Tweening functions for a sinusoidal (sin(t)).
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 * @author Robert Fell
 */
class Sine
{
	/**
	 * Easing equation function for a sinusoidal (sin(t)) easing in: accelerating from zero velocity.
	 */
	public static function easeIn( t:Float, b:Float, c:Float, d:Float ):Float
	{
		return -c * Math.cos( t / d * ( Math.PI / 2 ) ) + c + b;
	}

	/**
	 * Easing equation function for a sinusoidal (sin(t)) easing out: decelerating from zero velocity.
	 */
	public static function easeOut( t:Float, b:Float, c:Float, d:Float ):Float
	{
		return c * Math.sin( t / d * ( Math.PI / 2 ) ) + b;
	}

	/**
	 * Easing equation function for a sinusoidal (sin(t)) easing in/out: acceleration until halfway, then deceleration.
	 */
	public static function easeInOut( t:Float, b:Float, c:Float, d:Float ):Float
	{
		return -c / 2 * ( Math.cos( Math.PI * t / d ) - 1 ) + b;
	}

	/**
	 * Easing equation function for a sinusoidal (sin(t)) easing out/in: deceleration until halfway, then acceleration.
	 */
	public static function easeOutIn( t:Float, b:Float, c:Float, d:Float ):Float
	{
		if ( t < d / 2 ) return easeOut( t * 2, b, c / 2, d );
		return easeIn( ( t * 2 ) - d, b + c / 2, c / 2, d );
	}
}