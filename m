From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Date: Sun, 29 Aug 1999 07:13:26 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93591069728288@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 28 Aug 1999, Linus Torvalds wrote: 

> Guys, if anybody thinks we're competing with BeOS, then wake up. BeOS is
> a niche OS that isn't worth competing against, and at most we can try to
> find out what it's good at and see if we can emulate some of it. But 25%
> disk IO decrease is definitely not something we want to even consider. 

definitely. The patches are 'work in progress', and i know they are only
acceptable for inclusion if they: 

	1) cause no measureable slowdown _anywhere_

	2) fixes 'buggy' latencies by redesigning the latency source, not
	   by intruding the latency core with conditional reschedule
	   points.

i'm quite certain both 1) and 2) are very much possible, Benno's reported
25% slowdown (which btw. i think is not a pure bandwith degradation, but a
slowdown in certain, not necesserily well understood circumstances) is
simply a bug in my patch.

the patch in it's current form is just a 'demo' that shows that good
in-kernel latencies (the example to follow is not BeOS but QNX i think)
are indeed possible without architectural impact. On my box i've killed
all latencies that are bigger than 0.5 msec. (i'll try to fix the 2.9msec
peak reported as well) I'll send an updated and fixed patch (in smaller
pieces) for 2.3.

-- mingo
