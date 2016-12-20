/*
    Stencyl exclusively uses the Haxe programming language. 
    Haxe is similar to ActionScript and JavaScript.
    
    Want to use native code or make something reusable? Use the Extensions Framework instead.
    http://www.stencyl.com/help/view/engine-extensions/
    
    Learn more about Haxe and our APIs
    http://www.stencyl.com/help/view/haxe/
*/

package scripts;


//==========================================================
// Imports
//==========================================================

import com.stencyl.graphics.G;

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
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;

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


class BasicShitStencylNeeded extends ActorScript
{
	//Expose your attributes like this:
	//@:attribute("id='1' name='Display Name' desc='An Attribute' type='BOOLEAN'")
	//public var attributeName:Bool;
	
	//Need further help? See: http://www.stencyl.com/help/view/code-mode/
	
	@:attribute("id='1' name='Facing Right' desc='Is the actor facing right?' type='BOOLEAN'")
	public var facingRight:Bool;
	@:attribute("id='2' name='Left Animation' desc='The left animation.' type='ANIMATION'")
	public var leftAnimation:String;
	@:attribute("id='3' name='Right Animation' desc='The right animation.' type='ANIMATION'")
	public var rightAnimation:String;
	
	override public function init()
	{
	}
	
	public inline function update(elapsedTime:Float)
	{
		if(facingRight)
		{
			actor.setAnimation(rightAnimation);
		}
		else
		{
			actor.setAnimation(leftAnimation);
		}
	}
	
	public inline function draw(g:G)
	{
	}
	
	
	//==========================================================
	// Don't edit below unless you know what you're doing
	//==========================================================
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		
		addWhenUpdatedListener(null, onUpdate);
		addWhenDrawingListener(null, onDraw);
	}
	
	public function onUpdate(elapsedTime:Float, list:Array<Dynamic>)
	{
		if(wrapper.enabled)
		{
			update(elapsedTime);
		}
	}
	
	public function onDraw(g:G, x:Float, y:Float, list:Array<Dynamic>)
	{
		if(wrapper.enabled)
		{
			draw(g);
		}
	}
}