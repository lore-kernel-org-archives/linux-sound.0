From: yodaiken@chelm.cs.nmt.edu
Date: Mon, 30 Aug 1999 06:09:51 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93599728313885@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Aug 30, 1999 at 08:55:45AM +0200, Ingo Molnar wrote:
> > Tell me what I misunderstood. As far as I can tell, pre patch behavior
> > involves many fewer calls to schedule, post patch behavior for a write, for
> > example, can make at least one extra call to the scheduler for every block
> > copied. [...]
> 
> the thing is, we are simply getting what we asked for. In that benchmark

so what happens if we ask for more than one thing?

> we have a soundcard-using RT program that gets ~1000 reschedules a second
> and 'wastes' CPU cycles (artificially) after every reschedule. The first
> benchmark config used an unmodified kernel that has simply violated the
> (very tight, 1msec) RT constraints of the RT process. Then we had a kernel
> modified by lowlatency-N6+patches, which kernel correctly satisfied the RT
> process' requests and rescheduled to it (and away from it) about every
> msec or so. No wonder IMO that disk performance might suffer if such tight
> RT constraints are satisfied accurately. Do you see my point? Disk
> performance does not suffer if 'simple' CPU-using processes are running. 

I don't see how your code avoids reschedules from non SCHED_FIFO/RR 
processes. And I'm not convinced tha even then, it is reasonable to 
allow this. But first explain why a screen saver will not trigger
the same behavior. The screen saver will do fast writes to the screen,
and these will trigger io for X and for the saver itself. Both operations
will set needs_resched. So we expect io performance to get worse 
in this case. Right?

> 
> >                                                     [...] New
> > behavior: a screen saver, which is small i/o bound, causes needs resched
> > to be set continually, and the write is segmented into many smaller writes.
> 
> do you see where you missed the point? We are talking about _RT, CPU-using
> high-frequency rescheduling_ processes that cause a measured bandwith
> difference. Not screen savers. Not 'simple' CPU hogs. RT processes.

I know that that is your intention, but I don't understand how you expect
to limit the effects of the changes to RT tasks. That's why I ask for
Lmbench data and also database benchmarks.

By the way, I don't mean to be too critical here - this is very important work
and if we had millisecond soft rt tasks in Linux, it would really be
useful for RTLinux  too -- people ask for it all the time. My caution is
that simply adding new premption points to the kernel is not simple and
has far reaching effects.
