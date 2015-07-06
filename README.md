[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md) 

# Tweezer
Tweezer is an easy tweening and easing library designed primarily for use with [awe6](http://awe6.org), the inverted game framework.

The library extends [Robert Penner's easing functions](http://robertpenner.com/easing/) to allow programmatic values to be [inbetweened](https://en.wikipedia.org/wiki/Inbetweening).  Or ... "add flavor to motion"!  Great for usage in game GUI transitions.
	
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

addEntity( new Tweezer( _kernel, _onUpdate, 0, 100, 500, 2000, 1000, EEase.EASE_OUT, ETween.BOUNCE, _onComplete, false ) );
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

