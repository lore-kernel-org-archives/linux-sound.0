From: Andrea Arcangeli <andrea@suse.de>
Date: Mon, 06 Sep 1999 07:43:49 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency),
Message-Id: <marc-linux-sound-93660371427710@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, 4 Sep 1999 yodaiken@fsmlabs.com wrote:

>on a uniprocessor.   sct pointed out that reschedule_idle
>is very conservative about setting need_resched and this makes Ingo
>correct when he stated that need_resched>0 means that we really do need
>to resched. I'd be happier with some big database tests, and I really think

IMHO this is not the point at all.

need_resched = 1 means you _have_ to reschedule ASAP careless about the
scheduler algorithm at all.

>that database performance should be checked before any such change goes
>into the kernel, but for now, I was flat out wrong.

If honouring the need_resched bit is decreasing performances than it means
you _want_ to change the scheduler and not the code that honour the
need_resched bit. Of course I am supposing the checks itself are not the
source of the slowdown.

Andrea
