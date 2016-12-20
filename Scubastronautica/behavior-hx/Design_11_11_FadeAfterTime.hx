package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_11_11_FadeAfterTime extends ActorScript
{
	public var _FadeTime:Float;
	public var _TimetoFadeAfter:Float;
	public var _Fading:Bool;
	public var _KillAfterFade:Bool;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Fade():Void
	{
		if(!(_Fading))
		{
			_Fading = true;
			propertyChanged("_Fading", _Fading);
			actor.fadeTo(0, _FadeTime, Linear.easeNone);
			runLater(1000 * _FadeTime, function(timeTask:TimedTask):Void
			{
				if(_KillAfterFade)
				{
					recycleActor(actor);
				}
			}, actor);
		}
	}
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Fade Time", "_FadeTime");
		_FadeTime = 1.0;
		nameMap.set("Time to Fade After", "_TimetoFadeAfter");
		_TimetoFadeAfter = 1.0;
		nameMap.set("Fading", "_Fading");
		_Fading = false;
		nameMap.set("Kill After Fade", "_KillAfterFade");
		_KillAfterFade = true;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		if((_TimetoFadeAfter >= 0))
		{
			runLater(1000 * _TimetoFadeAfter, function(timeTask:TimedTask):Void
			{
				_customEvent_Fade();
			}, actor);
		}
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}