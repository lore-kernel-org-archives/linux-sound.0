From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 26 Aug 1999 20:42:29 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected 1-1.5ms
Message-Id: <marc-linux-sound-93570014906759@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 26 Aug 1999, Jaroslav Kysela wrote:
>> > A 100% CPU usage for 1sec ?
> > I can't believe this.
> 
> Try it.
> 
> linux/drivers/sound/mpu401.c:
> 
>         /*
>          * Sometimes it takes about 30000 loops before the output becomes ready
>          * (After reset). Normally it takes just about 10 loops.
>          */
> 
>         for (timeout = 30000; timeout > 0 && !output_ready(devc); timeout--);

arrgh, really bad !

 > > 200bytes/sec is just rudiculous , how do you plan to drive an external synth
> > with that little MIDI bandwidth ?
> 
> I need a timer around 2000Hz for some good code. I won't support polling
> mode (busy loop) in any case.

Yes, is there some free timer available in Linux to perform this job ?
It would be nice to be able to use the full MIDI bandwidth without eating
all the CPU power.

> 
> > Many songs uses up much of the 3000 bytes/sec bandwidth, especially
> > when there are many  controller/pitchbend events present.
> > 
> > Do you know if the RX FIFO of the MPU401 has the same problem (no interrupt) or
> > is there an interrupt present ?
> 
> No, MPU401 has Rx interrupt.
Fortunately ! , this means you can still use your PC as a realtime synth/sampler
when played through a MIDI masterkeyboard

> 
> > Does this mean that sequencers running under Windows have the same problems
> > as we in Linux on the AWE64 ?
> 
> I don't know, how is this problem solved under W$.
> 
> 						Jaroslav
certainly in a sub-optimal way.
:-)

regards,
Benno.
