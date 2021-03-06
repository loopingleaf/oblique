package ent;

import h2d.col.Point;

class Entity
{
	public var pos : h2d.col.Point;
	public var width : Int;
	public var height : Int;
	public var cx(get, set) : Float;
	public var cy(get, set) : Float;

	public var velocity : Point;
	#if debug
	public var debugRect : h2d.Graphics;
	#end

	public function new(x : Float, y : Float, width = 0, height = 0)
	{
		pos = new Point(x, y);
		this.width = width;
		this.height = height;
		velocity = new Point();
		#if debug
		debugRect = new h2d.Graphics(Game.INSTANCE.s2d);
		drawBox(debugRect);
		#end
	}

	public function update(dt : Float)
	{
		pos.x += velocity.x * dt;
		pos.y += velocity.y * dt;
		#if debug
		drawBox(debugRect);
		#end
	}

	inline function get_cx()
		return pos.x + width / 2.;

	inline function get_cy()
		return pos.y + height / 2.;

	function set_cx(value : Float)
	{
		pos.x = value - width / 2.;
		return cx;
	}

	function set_cy(value : Float)
	{
		pos.y = value - width / 2.;
		return cy;
	}

	#if debug
	function drawBox(gphx : h2d.Graphics)
	{
		gphx.clear();
		gphx.beginFill(0x2C5AFF, 0.);
		gphx.lineStyle(1., 0x2C5AFF);
		gphx.drawRect(pos.x, pos.y, cast(width, Float), cast(height, Float));
		gphx.endFill();
	}
	#end
}
