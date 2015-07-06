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

/**
 * Representing the tween function.
 * @author	Robert Fell
 */
enum ETween 
{
	/**
	 * Easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2)
	 * @param p_overshoot		Overshoot ammount: higher s means greater overshoot (0 produces cubic easing with no overshoot, and the default value of 1.70158 produces an overshoot of 10 percent)
	 */
	BACK( ?p_overshoot:Float );
	/**
	 * Easing equation function for a bounce (exponentially decaying parabolic bounce)
	 */
	BOUNCE;
	/**
	 * Easing equation function for a circular (sqrt(1-t^2))
	 */
	CIRCULAR;
	/**
	 * Easing equation function for a cubic (t^3).
	 */
	CUBIC;
	/**
	 * Easing equation function for an elastic (exponentially decaying sine wave)
	 * @param p_period		Period
	 * @param p_amplitude		Amplitude
	 */
	ELASTIC( ?p_period:Float, ?p_amplitude:Float );
	/**
	 * Easing equation function for an exponential (2^t)
	 */
	EXPONENTIAL;
	/**
	 * Easing equation function for a simple linear tweening.
	 */
	LINEAR;
	/**
	 * Easing equation function for a quadratic (t^2)
	 */
	QUADRATIC;
	/**
	 * Easing equation function for a quartic (t^4)
	 */
	QUARTIC;
	/**
	 * Easing equation function for a quintic (t^5)
	 */
	QUINTIC;
	/**
	 * Easing equation function for a sinusoidal (sin(t))
	 */
	SINE;
}