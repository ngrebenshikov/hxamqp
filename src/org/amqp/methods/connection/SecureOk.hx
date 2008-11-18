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
package org.amqp.methods.connection;

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
    class SecureOk extends Method, implements ArgumentReader, implements ArgumentWriter {
         public var response(getResponse, setResponse) : LongString;
         public function new() {
         _response = new ByteArrayLongString(new ByteArray());
         }
         
         var _response:LongString ;

         public function getResponse():LongString{return _response;}

         public function setResponse(x:LongString):LongString{_response = x;	return x;}

         public override function hasResponse():Bool {
             return null != getResponse();
         }


         public override function isBottomHalf():Bool {
             return true;
         }

         public override function getClassId():Int{
             return 10;
         }

         public override function getMethodId():Int{
             return 21;
         }

         public override function writeArgumentsTo(writer:MethodArgumentWriter):Void {
             writer.writeLongstr(_response);
         }

         public override function readArgumentsFrom(reader:MethodArgumentReader):Void {
             _response = reader.readLongstr();
         }

         public function dump():Void {
             trace("-------- connection.SecureOk --------");
             trace("response: {" + _response + "}");
         }
    }
