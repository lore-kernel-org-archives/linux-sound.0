From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 28 Oct 1999 23:46:13 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94117721616371@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 28 Oct 1999, Billy Biggs wrote:
> Benno, you kick ass,

HEHE, thank you !
:-)

> 
> > >   I was using O_RDWR | O_NONBLOCK, under a 2.2 kernel.  I was trying to do
> > > drumrolls, 16th notes, at 140bpm or 150bpm.  It was no good.
> > 
> > hmmm, really strange:
> > I wrote a little util called mididelay, which writes a note-on MIDI message on
> > the midi-out port reads back the message and measures the delay.
> 
>   Can I get a copy of this program?  Are you just using gettimeofday()
> before and after, or are you using ptrace or some other hackery?

the mididelay-0.1 is here:  ( read the README)

http://www.gardena.net/benno/linux/mididelay-0.1.tgz

> 
> > BTW: which card are you using ?
> 
>   For MIDI I'm using a Roland MPU-IPC-T card.  MPU-401.

Jaroslav do you know if there are similar problems on this card with too little
MIDI TX/RX FIFO size  , and/or lack of an IRQ connected to it ?

> 
> > Do not forget to apply the lowlatency patches, or your timing will
> > simply suck ! even an untuned IDE disk, when it reads/writes a small
> > amount of data from/to the disk, could cause 20-50ms delay in your app
> > and this is very bad for MIDI. ( see my tests , especially the non DMA
> > ones = horrible :-)  )
> 
>   What lowlatency patches??  kernel patches??  That's just ugly.  Where
> can I get them?

http://www.gardena.net/benno/linux/audio

read the entire page carefully and look at the old tests too,
then you will realize why I'm so confident that Linux will be
one of the best performing multimedia OSes around.

kernel patch ugly ?
If somethinfg is broken, we have to fix it:
Actually Ingo made the 2.2.10-lowlatency patch as a "demo" what can be done
with Linux.  :-)  
He told me he will integrate the changes into 2.3.x which will become 2.4
that means , ultra-low latency (down to 2.1ms on a P133) for regular
processes running with SCHED_FIFO policy, without messing around with
modules running in kernel space which could crash your entire system in case
if there is a bug. ( = see DirectX = blue screen in case of driver crashes  :-)
 )


> 
> > > > >  What about syncing multiple soundcards?
> > 
> > yes, this is far from trivial, but we will try to provide some usable
> > solution: mainly activating the cards by using DSP_SET_TRIGGER (if
> > supported, otherwise it's a real pain), to minimize starting delays,
> > and then use one of the soundcards as source (or alternatively other
> > timer sources), and put the remaining cards into a "slave" mode, where
> > you measure the sample differences in audio buffers, and insert
> > additional or drop samples to keep things in sync.
> 
>   How can you tell if you've underrun under OSS?  Using ALSA, I guess you
> can use it's time stuff to calculate if you've missed a frame, but even
> that seems hacky.

DSP_GETOSPACE tells you the bytes left in the audio buffer,
but if you want only detect overrruns, just use the RDTSC pentium cyclecounter
and measure if the time between two subsequent write()s to /dev/dsp is
bigger than the time it takes to play the entire audio buffer.
(I used this method in my latencytest and it works fairly well)


> 
>   Do you just always use gettimeofday() math to keep track of how much
> stuff you've written, and when skips have occured?

you can use gettimeofday() too,
I made the code portable so that on x86 you can use RDTSC, on other
architectures you can use gettimeofday(), which is more than adquate
for these purposes (but I saved a few machine cycles (and avoided a syscall) by
using RDTSC. 
(I was testing pure scheduling performance, therefore I had to avoid any
syscalls, except the audio ones)

> 
>   I don't like using one dsp as the sync master since I always want to be
> able to sync to something external, like MIDI.
> 
>   So, the problem becomes, how do you sync many soundcards and have it all
> synced off external MIDI. :)

That is no problem too: just use the MIDI clock as source, and drop/insert
samples on all dsp devices if you detect any drift.


Benno.
