From: Billy Biggs <vektor@div8.net>
Date: Thu, 28 Oct 1999 13:47:52 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94111859014288@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Benno, you kick ass,

> >   I was using O_RDWR | O_NONBLOCK, under a 2.2 kernel.  I was trying to do
> > drumrolls, 16th notes, at 140bpm or 150bpm.  It was no good.
> 
> hmmm, really strange:
> I wrote a little util called mididelay, which writes a note-on MIDI message on
> the midi-out port reads back the message and measures the delay.

  Can I get a copy of this program?  Are you just using gettimeofday()
before and after, or are you using ptrace or some other hackery?

> BTW: which card are you using ?

  For MIDI I'm using a Roland MPU-IPC-T card.  MPU-401.

> >   One requirement for ttrk was that it be able to trigger samples on beat,
> 
> I'd suggest to use the raw /dev/dsp and the raw /dev/midi interface:
> [...]

  Thanks for your suggestions.  I'm hacking at it now...

> Do not forget to apply the lowlatency patches, or your timing will
> simply suck ! even an untuned IDE disk, when it reads/writes a small
> amount of data from/to the disk, could cause 20-50ms delay in your app
> and this is very bad for MIDI. ( see my tests , especially the non DMA
> ones = horrible :-)  )

  What lowlatency patches??  kernel patches??  That's just ugly.  Where
can I get them?

> > > >  What about syncing multiple soundcards?
> 
> yes, this is far from trivial, but we will try to provide some usable
> solution: mainly activating the cards by using DSP_SET_TRIGGER (if
> supported, otherwise it's a real pain), to minimize starting delays,
> and then use one of the soundcards as source (or alternatively other
> timer sources), and put the remaining cards into a "slave" mode, where
> you measure the sample differences in audio buffers, and insert
> additional or drop samples to keep things in sync.

  How can you tell if you've underrun under OSS?  Using ALSA, I guess you
can use it's time stuff to calculate if you've missed a frame, but even
that seems hacky.

  Do you just always use gettimeofday() math to keep track of how much
stuff you've written, and when skips have occured?

  I don't like using one dsp as the sync master since I always want to be
able to sync to something external, like MIDI.

  So, the problem becomes, how do you sync many soundcards and have it all
synced off external MIDI. :)

--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
