From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 27 Oct 1999 20:39:18 +0000
Subject: Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94105770018211@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94104909204283@msgid-missing>
In-Reply-To: <marc-linux-sound-94104909204283@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 27 Oct 1999, Paul Barton-Davis wrote:
> >> >Wouldn't you say that an HZ > 100 kernel is the cleanest solution?
> >> 
> >> its the cleanest, but not the best. HZ = 1000 adds about 8% overhead
> >> to IRQ processing *all the time*.
> >
> >Are you *sure* about this?  I seem to remember there was some debate
> >about that figure on linux-kernel.
> 
> Ed Hall measured it, and my overall impression of Ed is that I'd trust
> him to do this correctly. what did the l-k folks think ?

It depends on your box, a P133 might suffer much more than a PII400.
On a PII400 the performance his is very little IMHO (no actual numbers)

But we can't assume that HZ00 for our multimedia apps.
Therefore my proposal is the following:
(similar to Eric's proposed rtcd)
In our upcoming multimedia API we will run the audio daemon
not only for providing PCM/MIDI services but precise timers too.
This could be implemented by choosing the most efficient method
at the moment:
that means: if you are runnnig with 1ms audio buffer sizes,
instead of firing up the RTC device, use the soundcard's timer
(combined with RDTSC) , to wakeup your clients.

comments ?

Benno.
 
