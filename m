From: yodaiken@chelm.cs.nmt.edu
Date: Mon, 30 Aug 1999 08:18:10 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93600508519610@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Aug 30, 1999 at 09:30:04AM +0200, Ingo Molnar wrote:
> 
> On Mon, 30 Aug 1999 yodaiken@chelm.cs.nmt.edu wrote:
> 
> > I don't see how your code avoids reschedules from non SCHED_FIFO/RR
> > processes. [...]
> 
> i dont really understand your point. _if_ current->need_resched is set we
> should reschedule ASAP - thats all. Thats a generic kernel rule - it's up

No. If current->need_resched is set, we should reschedule at a preemption
point. What your patch does is dramatically increase the number of
preemption points -- that changes the meaning.

> to the scheduling code to balance timeslices and priorities properly. The
> patch is only enforcing this rule more accurately than old kernels. But if
> you think this is something new then you are wrong.

It absolutely is something new. In the current kernel, we check for
preemption only at points where we are about to do a context
switch anyways - from k to user modulo some places like mem.c .
That is the logic is:
                     before commit to a switch to user, see
                     if there is a hint to call the scheudler
This is not the same as
                     before copy a block check to see if there
                     is a hint to call the scheduler.



> >              [...] But first explain why a screen saver will not trigger
> > the same behavior. The screen saver will do fast writes to the screen,
> > and these will trigger io for X and for the saver itself. Both operations
> > will set needs_resched. So we expect io performance to get worse 
> > in this case. Right?
> 
> wrong. The behavior of X & screensaver does not change the slightest from
> current kernels. The patch adds no additional behavior! We check for

The patch is not intended to add additional behavior.  I know that. I
still don't see why the screen saver i/o ops that will either set needs
rescehd directly or schedule a bottom half task will not cause extra
context switches.


> need_resched at _every_ system-call return (or IRQ return to user-space,
> or signal delivery) anyway. The patch only shortens certain longer
> 'scheduling atoms' by either splitting them up into smaller pieces or by
> redesigning them. But this does not cause any macro-effect - apart from
> situations of course which are now behaving correctly.

How do you know?

> [btw. 99% of the time the X client gets rescheduled is not due to
> need_resched but due to the unix-domain socket buffer running out of write
> space. And this is true globally, need_resched itself is resposible for a
> small fraction of reschedules only.]

In the current system, yes. After your patch, it is not at all clear.
