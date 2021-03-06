[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE) [![Haxelib Version](https://img.shields.io/badge/haxelib-v0.1.9-blue.svg)](http://lib.haxe.org/p/tweezer)

# Tweezer
Tweezer is an easy tweening and easing library designed primarily for use with [awe6](http://awe6.org), the inverted game framework.

This [Haxe](http://haxe.org) library extends [Robert Penner's easing functions](http://robertpenner.com/easing/) to allow programmatic values to be [inbetweened](https://en.wikipedia.org/wiki/Inbetweening).  Or ... "add flavor to motion"!  Great for usage in game GUI transitions.

See some [examples](http://hypersurge.github.io/tweezer/).
	
## Usage

If using awe6:

```
var l_onUpdate = function( p_value:Float ):Void // The function to call back with a tween value each update
{
	// do something with p_value - e.g. change the x coordinate of a View
}
var l_startValue = 0; // The starting value (from)
var l_endValue = 100; // The ending value (to)
var l_startDelay = 500; // The intial delay before the tween begins
var l_duration = 2000; // The duration of the tween
var l_endDelay = 1000; // The final delay after the tween completes
var l_easeType = EEase.EASE_OUT; // The ease type
var l_tweenType = ETween.BOUNCE; // The tween type
var l_completeCallback = function():Void // An optional function to call on completion
{
	// do something else / chain Tweezers
}
var l_isSnap = false; // Whether values are rounded

addEntity( new Tweezer( _kernel, l_onUpdate, l_startValue, l_endValue, l_startDelay, l_duration, l_endDelay, l_easeType, l_tweenType, l_completeCallback, l_isSnap ) );
```

If not using awe6:
	
```
var l_startValue = 0; // The starting value (from)
var l_changeInValue = 100; // Change needed in value
var l_duration = 2000; // The duration of the tween
var l_easeType = EEase.EASE_OUT; // The ease type
var l_tweenType = ETween.BOUNCE; // The tween type

var l_currentValue = TweenFactory.createTween( l_currentTime, l_startValue, l_changeInValue, l_duration, l_easeType, l_tweenType );
```

Please note, for real-world implementations local variables need not be used, they are shown here for ease of explanation.

## Features

The following Easing Types are included:
	
 * Ease In: accelerating from zero velocity
 * Ease In/Out: acceleration until halfway, then deceleration
 * Ease Out: decelerating from zero velocity
 * Ease Out/In: deceleration until halfway, then acceleration
 
And the following Tween Types are included:
	 
 * Back: easing equation function for a back (overshooting cubic easing: (s+1)*t^3 - s*t^2)
 * Bounce: easing equation function for a bounce (exponentially decaying parabolic bounce)
 * Circular: easing equation function for a circular (sqrt(1-t^2))
 * Cubic: easing equation function for a cubic (t^3)
 * Elastic: easing equation function for an elastic (exponentially decaying sine wave)
 * Exponential: easing equation function for an exponential (2^t)
 * Linear: easing equation function for a simple linear tweening
 * Quadratic: easing equation function for a quadratic (t^2)
 * Quartic: easing equation function for a quartic (t^4)
 * Quintic: easing equation function for a quintic (t^5)
 * Sine: easing equation function for a sinusoidal (sin(t))
 
A demo suite, to visually illustrate the various combinations of Easing and Tweeing types, is available in the [demo folder](https://github.com/hypersurge/tweezer/tree/master/demo).  The demo uses the awe6 and createjs libraries available on haxelib and can be [seen online here](http://hypersurge.github.io/tweezer/).
