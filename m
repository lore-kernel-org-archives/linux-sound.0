From: yodaiken@chelm.cs.nmt.edu
Date: Sun, 29 Aug 1999 20:48:20 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93596292226360@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, Aug 29, 1999 at 09:15:19AM +0200, Ingo Molnar wrote:
> 
> On Sat, 28 Aug 1999 yodaiken@fsmlabs.com wrote:
> 
> > I'm concerned that the major improvement has come from additional 
> > calls to schedule instead of from some basic improvements in algorithm.
> 
> there are _no_ extra calls to schedule, only if necessery. Zero, nil,
> nada. Please check out the patch.

Tell me what I misunderstood. As far as I can tell, pre patch behavior
involves many fewer calls to schedule, post patch behavior for a write, for
example, can make at least one extra call to the scheduler for every block
copied. If "needs_resched >0" it is still not necessarily true that the
call to the scheduler is "necessary".  Consider, a long running data base
program is writing backing store out to disk. Old behavior: the write
absorbs as much free memory as possible to optimize disk behavior. New
behavior: a screen saver, which is small i/o bound, causes needs resched
to be set continually, and the write is segmented into many smaller writes.
We now have, like NT, optimized the screen saver on a server while hammering
file system performance. Isn't that correct?
