//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network Network3
{
    @display("bgb=1130,730");
    submodules:
        SourceA: Source {
            @display("p=88,158");
        }
        SourceB: Source {
            @display("p=88,344");
        }
        SourceC: Source {
            @display("p=88,536");
        }
        passiveQueue: PassiveQueue {
            @display("p=245,156");
        }
        passiveQueue1: PassiveQueue {
            @display("p=250,342");
        }
        passiveQueue2: PassiveQueue {
            @display("p=247,538");
        }
        classifier: Classifier {
            @display("p=683,341");
        }
        final_Project_4_SinkA: Final_Project_4_Sink {
            @display("p=876.396,136.524");
        }
        final_Project_4_SinkB: Final_Project_4_Sink {
            @display("p=877.864,309.74802");
        }
        final_Project_4_SinkC: Final_Project_4_Sink {
            @display("p=871.992,506.46002");
        }
        server: Server {
            @display("p=496.18402,113.036");
        }
        server1: Server {
            @display("p=496.18402,303.876");
        }
        server2: Server {
            @display("p=497.652,465.35602");
        }
        server3: Server {
            @display("p=481.504,628.304");
        }
    connections:
        SourceA.out --> passiveQueue.in++;
        SourceB.out --> passiveQueue1.in++;
        SourceC.out --> passiveQueue2.in++;
        passiveQueue.out++ --> server.in++;
        passiveQueue.out++ --> server1.in++;
        passiveQueue.out++ --> server2.in++;
        passiveQueue.out++ --> server3.in++;
        passiveQueue1.out++ --> server.in++;
        passiveQueue1.out++ --> server1.in++;
        passiveQueue1.out++ --> server2.in++;
        passiveQueue1.out++ --> server3.in++;
        passiveQueue2.out++ --> server.in++;
        passiveQueue2.out++ --> server1.in++;
        passiveQueue2.out++ --> server2.in++;
        passiveQueue2.out++ --> server3.in++;
        server.out --> classifier.in++;
        server1.out --> classifier.in++;
        server2.out --> classifier.in++;
        server3.out --> classifier.in++;
        classifier.out++ --> final_Project_4_SinkA.in++;
        classifier.out++ --> final_Project_4_SinkB.in++;
        classifier.rest --> final_Project_4_SinkC.in++;
}
