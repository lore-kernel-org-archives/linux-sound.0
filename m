From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 08 Sep 1999 13:55:20 +0000
Subject: Re: [alsa-devel] Re: MidiShare and ALSA sequencer
Message-Id: <marc-linux-sound-93679717712022@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 08 Sep 1999, Eli Brandt wrote:
> Paul Barton-Davis wrote:
> > The problem is that the Unix/POSIX API provides for only 1/HZ timer
> > resolution. Expiration of a timer (either via select(2) or via
> > setitimer(2)) constitutes a scheduling event that may/will result in
> > preemption and rescheduling. But there is no way to get a timer event
> > whose resolution is below 1/HZ seconds, not from the standard system
> > timer, at least.
> 
> So if I understand correctly, patched Linux has good RT guarantees for
> user-space interrupt latency (witnessed by Benno's blocking write()s);
> the trouble for timer-driven tasks is that there's no interrupt coming
> in at the desired time.
> 
> Then a select() has good timing when it wakes up on a fd, but not on
> timeout?  So a software synthesizer, including one driven by MIDI,
> ought to do well, but a sequencer loses.


This seems rather inconsistent to me that one is able to get good
timing by waking up on the soundcards interrupt, but not by setting
precise timers. (greater than 10ms precison)

(One solution of an audio/MIDI sequencer could be to base the MIDI timing
on the PCM audio interrupts (using short fragments to get msec precision)
plus checking the TSC counter to get more accurate MIDI timing,
but this is not as elegant as UTIME) 

The KURT people showed that UTIME has little overhead
and the time-drift (over a day) is comparable to the standard-timer.

Does anyone know the reasons because the UTIME patches
can't be included in the kernel ?

> 
> > The UTIME patches change this, incredibly nicely from a user-level
> > point of view (they allow microsecond timer resolution). Likewise,
> > running at HZ00 gives you millisecond resolution. Finally, as I
> > mentioned and David Olofson expanded on a little, we could also have a
> > simple kernel module that handle interrupts from a high-frequency
> > timer source, and marked any tasks waiting in its read queue as
> > ready-to-run (or alternatively delivered SIGALRM to them). So there
> > are a number of solutions. 
> 
> With such a fix, say the existing UTIME patch, do you have any
> remaining concerns about Linux's millisecond-range RT?

With the low-latency patches + UTIME patches in the mainstream kernel , as a
userspace RT programmer I would be very happy.

regards,
Benno.
