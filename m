From: Benno Senoner <sbenno@gardena.net>
Date: Sat, 11 Sep 1999 16:12:36 +0000
Subject: Re: low-latency benchmarks: excellent results of RTC clock + SIGIO notification, audio-latency now d
Message-Id: <marc-linux-sound-93706635630564@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93706455029492@msgid-missing>
In-Reply-To: <marc-linux-sound-93706455029492@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, 11 Sep 1999, mingo@chiara.csoma.elte.hu wrote:
> On Sat, 11 Sep 1999, Benno Senoner wrote:
> 
> > Seems that under high disk I/O load,
> > (very seldom, about every 30-100secs) the process
> > gets woken up one IRQ period later.
> > Ideas why this happens.
> 
> this could be a lost RTC IRQ. If you are using 2048 Hz RTC interrupts, it
> just needs a single 1msec IRQ delay to lose an RTC IRQ. Especially SCSI
> disk interrupts are known to sometimes cause 1-2 millisecs IRQ delays.  
> But before jumping to conclusions, what exactly are the symptoms, what
> does 'one IRQ period later' mean exactly?
> 
> -- mingo

The RTC benchmark measures the time between 2 calls to the SIGIO handler.
In my example RTC freq 48HZ I used 0.48ms periods, and the max jitter
is exactly 2 * 0.48ms = 0.96ms.

The same thing happens on the audio card:

If I use 1.45ms audio fragments, then max delay between two write() calls is
2.9ms ( 2 * 1.45ms)

When I reduce the fragmentsize to 0.7ms , the max registered peak was 1.4ms 2 * 0.7ms.

Maybe in the audio case, the same phenomen  of "lost IRQ" happens,

But it's interesting that the jitter depends on the IRQ frequency.
(maybe only for very low-latencies)

look at the diagrams , you can see very clearly that the peaks are a multiple 
of the IRQ period.

Maybe on lower IRQ frequencies ( intervals > 5-10ms ), these peaks will
not show up , because that there are  no losses of IRQs ?

But if my HD is blocking the IRQs for max 0.7ms using 0.7ms IRQ period,
why should it block for max 1.45ms by using  1.45ms IRQ periods ?

regards,
Benno.
