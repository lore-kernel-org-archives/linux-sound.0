From: "Stephen C. Tweedie" <sct@redhat.com>
Date: Mon, 30 Aug 1999 11:13:02 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93601180925552@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

On Mon, 30 Aug 1999 00:09:51 -0600, yodaiken@chelm.cs.nmt.edu said:

> I don't see how your code avoids reschedules from non SCHED_FIFO/RR 
> processes. And I'm not convinced tha even then, it is reasonable to 
> allow this. But first explain why a screen saver will not trigger
> the same behavior. The screen saver will do fast writes to the screen,
> and these will trigger io for X and for the saver itself. Both operations
> will set needs_resched. So we expect io performance to get worse 
> in this case. Right?

Is the screensaver consuming significant CPU time?  If so, it is running
with fewer scheduling credits than (say) the bdflush code.  A wakeup of
the screensaver will not cause need_resched to be set (reschedule_idle
doesn't set need_resched unless the woken process has significantly more
scheduling credits than the running task).

Is the screensaver using even less CPU than bdflush?  In that case, it
is assumed to be a more latency-critical task, and if woken up, it will
set need_resched.  With Ingo's diff, the only change here is that the
reschedule will now occur sooner rather than later, which is exactly
correct for a mostly-idle task.  If the screensaver is in fact waking up
like this all the time, then it should rapidly consume enough scheduling
credits to fall below the bdflush priority and to stop preempting.

I don't understand why this behaviour is undesirable.

--Stephen
