From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 26 Aug 1999 21:53:31 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected
Message-Id: <marc-linux-sound-93570441011749@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 26 Aug 1999, Alan Cox wrote:
> > > 200bytes/sec is just rudiculous , how do you plan to drive an external synth
> > > with that little MIDI bandwidth ?
> > 
> > I need a timer around 2000Hz for some good code. I won't support polling
> > mode (busy loop) in any case.
> 
> Then your code will never be usable. Some hardware sucks, you have to do
> limited polling with a timer backoff. A well tuned polling loop will often
> work out nicely providing you are careful. Remember with irqs on you are
> just like busy in userspace no worse. You can even do
> 
> 	while(poll_input()=0)
> 	{
> 		if(current->need_resched())
> 			schedule();
> 	}
> 
> sort of stuff

Do you think there are some benefits by inserting the re-schedule in the
drivers/sound/mpu401.c file ? ( less CPU usage)

for (timeout = 30000; timeout > 0 && !output_ready(devc); timeout--);

But since the FIFO is only 2 bytes long = 600usecs, 
the schedule() could cause a MIDI bandwidth decrease,
but would keep CPU load down , right ?
Why was the MPU401 code not tuned that way ?

regards,
Benno.
