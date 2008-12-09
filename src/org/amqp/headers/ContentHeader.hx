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
package org.amqp.headers;

    import haxe.io.Input;
    import haxe.io.Output;

    class ContentHeader
     {
        public function readFrom(input:Input):Int {
            var weight:Int = input.readUInt16();
            // TODO this is a workaround because AS doesn't support 64 bit integers
            var bodySizeUpperBytes:Int = input.readInt31();
            var bodySize:Int = input.readInt31();
            readPropertiesFrom(new ContentHeaderPropertyReader(input));
            return bodySize;
        }

        public function writeTo(out:Output, bodySize:Int):Void{
            out.writeUInt16(0); // weight

            // This is a hack because AS doesn't support 64-bit integers
            // The java code calls out.writeLong(bodySize)
            // so to fake this, write out 4 zero bytes before writing the body size
            out.writeInt31(0);
            out.writeInt31(bodySize);

            var writer:ContentHeaderPropertyWriter = new ContentHeaderPropertyWriter();
            writePropertiesTo(writer);
            writer.dumpTo(out);
        }

        public function getClassId():Int{
            return -1;
        }

        public function readPropertiesFrom(reader:ContentHeaderPropertyReader):Void{}

        public function writePropertiesTo(writer:ContentHeaderPropertyWriter):Void{}
    }
