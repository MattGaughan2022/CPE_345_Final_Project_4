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

#include "Final_Project_4_Sink.h"

Define_Module(Final_Project_4_Sink);

void Final_Project_4_Sink::initialize()
{
    // TODO - Generated method body
                Sink::initialize();
                numjobsReceived = 0;
                delayStats.setName("End-to-End Delay");
}

void Final_Project_4_Sink::handleMessage(cMessage *msg)
{
    // TODO - Generated method body
                Sink::handleMessage(msg);

                simtime_t delay = simTime() - msg->getTimestamp();
                delayStats.record();
                delayStats.collect(delay);

                ++numjobsReceived;
}

void Final_Project_4_Sink::refreshDisplay() const{
    char buf[80];
    sprintf(buf, "received jobs: %d", numjobsReceived);
    getDisplayString().setTagArg("t", 0, buf);
}

void Final_Project_4_Sink::finish()
    {
       EV << "Mean: " << delayStats.getMean()<<endl;
       EV << "Standard deviation: " << delayStats.getStddev()<<endl;

    }
