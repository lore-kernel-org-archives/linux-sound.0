From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 26 Aug 1999 20:41:56 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected
Message-Id: <marc-linux-sound-93570642713729@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> > 		if(current->need_resched())
> > 			schedule();
> > 	}
> Do you think there are some benefits by inserting the re-schedule in the
> drivers/sound/mpu401.c file ? ( less CPU usage)
> 
> for (timeout = 30000; timeout > 0 && !output_ready(devc); timeout--);
> 
> But since the FIFO is only 2 bytes long = 600usecs, 
> the schedule() could cause a MIDI bandwidth decrease,
> but would keep CPU load down , right ?
> Why was the MPU401 code not tuned that way ?

Hannu tuned MPU401, Im not precisely sure how he tuned it, but it should
be sufficiently short the need_resched check isnt needed
