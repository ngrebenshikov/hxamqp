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
package org.amqp.error;

    #if neko
    import org.amqp.Error;
    #elseif flash9
    import flash.Error;
    #end

    import org.amqp.Frame;
    
    class UnexpectedFrameError extends Error {
        inline static var ID:Int = 666;
        var frame:Frame;
        
        public function new(message:String, frame:Frame)
        {
            super(message, ID);
            this.frame = frame;
        }
    }
