From: srinu@portalplayer.com
Date: Mon, 07 Feb 2000 03:07:53 +0000
Subject: Porting Linux x86 sound driver to MIPS platform
Message-Id: <marc-linux-sound-94989241826706@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

 

    Here is the problem.. As everybody know, Linux is more popular

among x86 based machines and it is well settled and matured on

x86 machines.

    But there are Linux ports available for Alpha processors, MIPS

processor. I have got one server that is based on MIPS and runs

Linux ( Kernel 2.0.34). The server is just like a box and doesn't

have any Monitor or KB. The adminstration is done through Web Interface.

The vendor of the server is Cobalt Systems (http://www.cobaltnet.com).

The model name is Qube2.

    Qube2 is basically targetted at .com market. It has got one

PCI slot. We are trying to put a Creative Sound card into that slot.

The Creative sound driver is not available for MIPS-Linux platform.

I am using the sound driver that comes along with Red Hat Linux 6.1

on my x86 machine and working fine.

    Now I have to port the sound driver to MIPS platform so that the

sound module can be plugged into my Qube2 kernel. Basically, I have

to segreate the Creative sound card specific code from the Sound driver

that comes with Linux. Once I have done with, I have to again segregate

the code that is specific to x86 architecture. And finally, I have to

port that code to MIPS platform.

    I am ready to provide my Qube2, the Creative sound card and the

x86 sound card driver source code. So anybody, irrespective of his

place can work on this.

    I am looking for somebody, who can help me in this regard. I
contacted

one chigaco based fellow, who is at this kind of work. He is ready to
work.

But the sad thing is that he is busy with his current schedules and will

not be available for 3 weeks. I have to complete the work before that
period.

So I am looking for somebody on the list who can bail me out.

    Indian Linux gurus.... Please help me. I am from a silicon Valley
based

start-up company (www.portalplayer.com) PortalPlayer Inc, which has got
one

office in Hyderabad (portalplayer Pvt. Ltd.)

    Nobody has done this work in the world. We are the first time doing
that.

Anybody who is willing to take up this work will have edge in the in the

community.

    Intersted persons can contact me  at 'srinu@portalplayer.com' or can

call me at 91-40-3542927/3542928.

    I would love to provide more information if neccessary..

cheers,

Srinivas
