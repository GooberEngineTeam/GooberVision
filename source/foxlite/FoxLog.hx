package foxlite;

import haxe.PosInfos;

#if FEATURE_LOG_TRACE
class FoxLog
{
	public static var lastLog:String;
	public static var lastWarning:String;
	public static var lastError:String;

	/**
	 * `origin` never gets used, i just don't want to change the function for every file that uses this
	 */
	public static function log(origin:String, message:String, ?pos:PosInfos):Void
	{
		lastLog = message;
		#if sys
		Sys.println(' INFO '.info() + ' ${haxe.Log.formatOutput(message, pos)}');
		#else
		trace(' INFO '.info() + ' ${haxe.Log.formatOutput(message, pos)}');
		#end
	}

	public static function warning(origin:String, message:String, ?pos:PosInfos):Void
	{
		lastWarning = message;
		#if sys
		Sys.println(' WARN '.warning() + ' ${haxe.Log.formatOutput(message, pos)}'.yellow());
		#else
		trace(' WARN '.warning() + ' ${haxe.Log.formatOutput(message, pos)}'.yellow());
		#end
	}

	public static function error(origin:String, message:String, ?pos:PosInfos):Void
	{
		lastError = message;
		#if sys
		Sys.println(' ERROR '.error() + ' ${haxe.Log.formatOutput(message, pos)}'.red());
		#else
		trace(' ERROR '.error() + ' ${haxe.Log.formatOutput(message, pos)}'.red());
		#end
	}
}
#else
class FoxLog
{
	public static var lastLog:String;
	public static var lastWarning:String;
	public static var lastError:String;

	public static function log(origin:String, message:String):Void {}
	public static function warning(origin:String, message:String):Void {}
	public static function error(origin:String, message:String):Void {}
}
#end