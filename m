From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Date: Mon, 30 Aug 1999 07:30:04 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93599790014265@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Mon, 30 Aug 1999 yodaiken@chelm.cs.nmt.edu wrote:

> I don't see how your code avoids reschedules from non SCHED_FIFO/RR
> processes. [...]

i dont really understand your point. _if_ current->need_resched is set we
should reschedule ASAP - thats all. Thats a generic kernel rule - it's up
to the scheduling code to balance timeslices and priorities properly. The
patch is only enforcing this rule more accurately than old kernels. But if
you think this is something new then you are wrong.

>              [...] But first explain why a screen saver will not trigger
> the same behavior. The screen saver will do fast writes to the screen,
> and these will trigger io for X and for the saver itself. Both operations
> will set needs_resched. So we expect io performance to get worse 
> in this case. Right?

wrong. The behavior of X & screensaver does not change the slightest from
current kernels. The patch adds no additional behavior! We check for
need_resched at _every_ system-call return (or IRQ return to user-space,
or signal delivery) anyway. The patch only shortens certain longer
'scheduling atoms' by either splitting them up into smaller pieces or by
redesigning them. But this does not cause any macro-effect - apart from
situations of course which are now behaving correctly.

[btw. 99% of the time the X client gets rescheduled is not due to
need_resched but due to the unix-domain socket buffer running out of write
space. And this is true globally, need_resched itself is resposible for a
small fraction of reschedules only.]

-- mingo
