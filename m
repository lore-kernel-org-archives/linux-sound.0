From: yodaiken@fsmlabs.com
Date: Sat, 04 Sep 1999 20:41:01 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93647720909076@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Ok. I ran lmbench and some other tests and fail to find any problems
on a uniprocessor.   sct pointed out that reschedule_idle
is very conservative about setting need_resched and this makes Ingo
correct when he stated that need_resched>0 means that we really do need
to resched. I'd be happier with some big database tests, and I really think
that database performance should be checked before any such change goes
into the kernel, but for now, I was flat out wrong.


On Mon, Aug 30, 1999 at 11:45:54AM +0200, Ingo Molnar wrote:
> 
> On Mon, 30 Aug 1999 yodaiken@chelm.cs.nmt.edu wrote:
> 
> > It absolutely is something new. In the current kernel, we check for
> > preemption only at points where we are about to do a context
> > switch anyways [...]
> 
> huh? We have a preemption point after every system call. Typically we
> execute tens of thousands of system calls per second on a moderately
> loaded system, and only tens/hundreds of context switches per second. A
> system call is not a context switch. I dont really see where this
> discussion is going to. If you believe there is something weird going on,
> please download the patch and prove it. The only thing that 'changed' is
> the behavior of high-frequency-rescheduling RT tasks, but this is very
> much intended.
> 
> > That is the logic is:
> >                      before commit to a switch to user, see
> >                      if there is a hint to call the scheudler
> 
> sorry, a switch to user-space is nowhere near a context switch. A context
> switch is when we schedule from one process (thread) to another one. There
> is about an order of magnitude between the cost of them, and about two
> orders of magnitude between the typical frequency of them. (user-kernel
> entries being much cheaper and much more frequent)
> 
> > This is not the same as
> >                      before copy a block check to see if there
> >                      is a hint to call the scheduler.
> 
> we have thousands of system calls executed between every typical
> reschedule. Go check it yourself. So wether one out of those final system
> calls is 'partial' or not makes no difference. If it makes a difference
> then the patch has unearthed some kernel bug which we want to fix anyway.
> 
> > > [btw. 99% of the time the X client gets rescheduled is not due to
> > > need_resched but due to the unix-domain socket buffer running out of write
> > > space. And this is true globally, need_resched itself is resposible for a
> > > small fraction of reschedules only.]
> > 
> > In the current system, yes. After your patch, it is not at all clear.
> 
> huh? it is absolutely true both for the current kernel and for the patched
> kernel. The patch does not generate _any_ new need_resched 'events'. It
> only shortens the time we 'respond' to need_resched, thats all. 
> need_resched is rarely used in a typical (or benchmarked) system, whenever
> some process is trying to naturally preempt a currently running process.
> 
> if you think about it, many 'need_resched events' can happen at a large
> scale only if there is a higher-statical-priority (not necesserily RT)
> process around that does high frequency rescheduling. Nothing in a typical
> system does that - and if it does than the priority difference very much
> mandates the kernel to reschedule ASAP. In fact, with the patch i see much
> better interactive behavior under X when i load the system, interactive
> events (which have higher priority) get executed much faster.
> 
> -- mingo
> 
> --- [rtl] ---
> To unsubscribe:
> echo "unsubscribe rtl" | mail majordomo@rtlinux.cs.nmt.edu OR
> echo "unsubscribe rtl <Your_email>" | mail majordomo@rtlinux.cs.nmt.edu
> ----
> For more information on Real-Time Linux see:
> http://www.rtlinux.org/~rtlinux/
