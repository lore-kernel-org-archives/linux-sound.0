From: Jaroslav Kysela <perex@suse.cz>
Date: Thu, 26 Aug 1999 18:42:55 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected
Message-Id: <marc-linux-sound-93569822804151@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 26 Aug 1999, Benno Senoner wrote:

> On Thu, 26 Aug 1999, Jaroslav Kysela wrote:
>  
> > > I wrote this to measure the MIDI output-to-input delay.
> > > I tried both with blocking I/O and non-blocking I/O.
> > > Unfortunately I get bad values in both modes:
> > > about 11.5ms , and this is exactly the MIDI transfer time (1.3ms) plus
> > > 10ms = 1 jiffie.
> > > If I run the test on a HZ00 kernel I get about 2ms.
> > 
> > MPU401 is very bad hardware for transmit, because it doesn't use interrupt
> > to determine that Tx FIFO is free. Some vendors offers large FIFOs
> > (8,12,16 bytes), but unfortunately guys at Creative designed SB AWE with
> > 2 byte FIFO.
> 
> Hmm .. so you are saying that this is a HARDWARE limitiation ?
> How does Windoze manage this ?

Did you see W$ sources? I didn't.

> > This doesn't explain why your latencies are so big for OSS/Free, because
> > OSS/Free code uses polling mode (busy loop for transmit).
> 
> What is the main drawback of this ?
> What happens when I send a block of 3000 bytes to the midi device under
> OSS/Free ?
> A 100% CPU usage for 1sec ?
> I can't believe this.

Try it.

linux/drivers/sound/mpu401.c:

        /*
         * Sometimes it takes about 30000 loops before the output becomes ready
         * (After reset). Normally it takes just about 10 loops.
         */

        for (timeout = 30000; timeout > 0 && !output_ready(devc); timeout--);

> > ALSA uses system timer to avoid busy loop, but the performance depends on
> > your HZ value:
> > 
> > 100Hz, 2 byte FIFO = 200bytes/sec
> > 100Hz, 8 byte FIFO = 1600bytes/sec
> > 100Hz, 12 byte FIFO = 2400bytes/sec
> > 100Hz, 16 byte FIFO = 3200bytes/sec
> 
> 200bytes/sec is just rudiculous , how do you plan to drive an external synth
> with that little MIDI bandwidth ?

I need a timer around 2000Hz for some good code. I won't support polling
mode (busy loop) in any case.

> Many songs uses up much of the 3000 bytes/sec bandwidth, especially
> when there are many  controller/pitchbend events present.
> 
> Do you know if the RX FIFO of the MPU401 has the same problem (no interrupt) or
> is there an interrupt present ?

No, MPU401 has Rx interrupt.

> Does this mean that sequencers running under Windows have the same problems
> as we in Linux on the AWE64 ?

I don't know, how is this problem solved under W$.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
