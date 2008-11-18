/**
 * ---------------------------------------------------------------------------
 *   Copyright (C) 2008 0x6e6562
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 * ---------------------------------------------------------------------------
 **/
package org.amqp.methods.queue;

    import org.amqp.Method;
    import org.amqp.LongString;
    import org.amqp.methods.ArgumentReader;
    import org.amqp.methods.ArgumentWriter;
    import org.amqp.methods.MethodArgumentReader;
    import org.amqp.methods.MethodArgumentWriter;
    import org.amqp.impl.ByteArrayLongString;
    import flash.utils.ByteArray;

    /**
     *   THIS IS AUTO-GENERATED CODE. DO NOT EDIT!
     **/
    class Purge extends Method, implements ArgumentReader, implements ArgumentWriter {
         public var nowait(getNowait, setNowait) : Bool;
         public var queue(getQueue, setQueue) : String;
         public var ticket(getTicket, setTicket) : Int;
         public function new() {
         _ticket = 0;
         _queue = "";
         _nowait = false;
         }
         
         var _ticket:Int ;
         var _queue:String ;
         var _nowait:Bool ;

         public function getTicket():Int{return _ticket;}
         public function getQueue():String{return _queue;}
         public function getNowait():Bool{return _nowait;}

         public function setTicket(x:Int):Int{_ticket = x;	return x;}
         public function setQueue(x:String):String{_queue = x;	return x;}
         public function setNowait(x:Bool):Bool{_nowait = x;	return x;}

         public override function hasResponse():Bool {
             return null != getResponse();
         }

         public override function getResponse():Method {
             return new PurgeOk();
         }

         public override function isBottomHalf():Bool {
             return false;
         }

         public override function getClassId():Int{
             return 50;
         }

         public override function getMethodId():Int{
             return 30;
         }

         public override function writeArgumentsTo(writer:MethodArgumentWriter):Void {
             writer.writeShort(_ticket);
             writer.writeShortstr(_queue);
             writer.writeBit(_nowait);
         }

         public override function readArgumentsFrom(reader:MethodArgumentReader):Void {
             _ticket = reader.readShort();
             _queue = reader.readShortstr();
             _nowait = reader.readBit();
         }

         public function dump():Void {
             trace("-------- queue.Purge --------");
             trace("ticket: {" + _ticket + "}");
             trace("queue: {" + _queue + "}");
             trace("nowait: {" + _nowait + "}");
         }
    }
