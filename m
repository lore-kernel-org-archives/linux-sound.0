From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Date: Mon, 30 Aug 1999 06:55:45 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93599658113382@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sun, 29 Aug 1999 yodaiken@chelm.cs.nmt.edu wrote:

> > there are _no_ extra calls to schedule, only if necessery. Zero, nil,
> 
> Tell me what I misunderstood. As far as I can tell, pre patch behavior
> involves many fewer calls to schedule, post patch behavior for a write, for
> example, can make at least one extra call to the scheduler for every block
> copied. [...]

the thing is, we are simply getting what we asked for. In that benchmark
we have a soundcard-using RT program that gets ~1000 reschedules a second
and 'wastes' CPU cycles (artificially) after every reschedule. The first
benchmark config used an unmodified kernel that has simply violated the
(very tight, 1msec) RT constraints of the RT process. Then we had a kernel
modified by lowlatency-N6+patches, which kernel correctly satisfied the RT
process' requests and rescheduled to it (and away from it) about every
msec or so. No wonder IMO that disk performance might suffer if such tight
RT constraints are satisfied accurately. Do you see my point? Disk
performance does not suffer if 'simple' CPU-using processes are running. 

>                                                     [...] New
> behavior: a screen saver, which is small i/o bound, causes needs resched
> to be set continually, and the write is segmented into many smaller writes.

do you see where you missed the point? We are talking about _RT, CPU-using
high-frequency rescheduling_ processes that cause a measured bandwith
difference. Not screen savers. Not 'simple' CPU hogs. RT processes.

-- mingo
