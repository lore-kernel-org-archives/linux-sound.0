From: Paul Barton-Davis <pbd@Op.Net>
Date: Fri, 27 Aug 1999 00:24:06 +0000
Subject: Re: [alsa-devel] Re: Bad MIDI performance : 10ms latency instead of the expected 1-1.5ms
Message-Id: <marc-linux-sound-93571438020118@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>200bytes/sec is just rudiculous , how do you plan to drive an external synth
>with that little MIDI bandwidth ?

check with creative that they actually intend this as a use of the
card :)

but seriously, Benno you know the difference between a system in which
a single application can take full control of the machine by having a
callback run in interrupt context and one like Linux. with the former
system, the 2 byte FIFO isn't a problem, or rather, it isn't much of a
problem. 

>If this is true, then I will throw away my AWE64 and buy an AudioPCI :-)

Yes, basically all your problems arise from using consumer
hardware. In particular, consumer hardware that isn't designed to work
correctly in (1) a multi-user, multitasking, virtual memory OS and (2)
isn't really intended to do much more than make noise for games and
sound effects.

As I never tire of saying, Hoontech's card is $39 and its hard to beat.

--p
