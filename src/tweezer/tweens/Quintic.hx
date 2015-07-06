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
 * Tweening functions for a quintic (t^5).
 * @author Robert Penner / http://www.robertpenner.com/easing_terms_of_use.html
 * @author Robert Fell
 */
class Quintic
{
	/**
	 * Easing equation function for a quintic (t^5) easing in: accelerating from zero velocity.
	 */
	public static function easeIn( t:Float, b:Float, c:Float, d:Float ):Float
	{
		return c * ( t /= d ) * t * t * t * t + b;
	}

	/**
	 * Easing equation function for a quintic (t^5) easing out: decelerating from zero velocity.
	 */
	public static function easeOut( t:Float, b:Float, c:Float, d:Float ):Float
	{
		return c * ( ( t = t / d - 1 ) * t * t * t * t + 1 ) + b;
	}

	/**
	 * Easing equation function for a quintic (t^5) easing in/out: acceleration until halfway, then deceleration.
	 */
	public static function easeInOut( t:Float, b:Float, c:Float, d:Float ):Float
	{
		if ( ( t /= d / 2 ) < 1 ) return c / 2 * t * t * t * t * t + b;
		return c / 2 * ( ( t -= 2 ) * t * t * t * t + 2 ) + b;
	}

	/**
	 * Easing equation function for a quintic (t^5) easing out/in: deceleration until halfway, then acceleration.
	 */
	public static function easeOutIn( t:Float, b:Float, c:Float, d:Float ):Float
	{
		if ( t < d / 2 ) return easeOut( t * 2, b, c / 2, d );
		return easeIn( ( t * 2 ) - d, b + c / 2, c / 2, d );
	}
}