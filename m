From: Benno Senoner <sbenno@gardena.net>
Date: Thu, 28 Oct 1999 09:22:50 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94111760112746@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Billy Biggs wrote:
> On Tue, 26 Oct 1999, Paul Barton-Davis wrote:
>   I was using O_RDWR | O_NONBLOCK, under a 2.2 kernel.  I was trying to do
> drumrolls, 16th notes, at 140bpm or 150bpm.  It was no good.

hmmm, really strange:
I wrote a little util called mididelay, which writes a note-on MIDI message on
the midi-out port reads back the message and measures the delay.
Paul got about 1.1ms delay ( = MIDI wire speed = 3 bytes x 350usecs )
on his box:  soundcard 4DNx + ALSA drivers)
I got a bad 11ms on my SB AWE64, and that is because the AWE64 doesn't
have a TX irq and ad FIFO of only 2byte = driver wroks in polling mode
 bad response times + high CPU usage, that means
forget this card for outputting dense MIDI streams.

BTW: which card are you using ?

>   One requirement for ttrk was that it be able to trigger samples on beat,
> in sync with incomming MIDI.  This is a pain in the ass, since I have to
> know exactly where in the audio output I am in order to do the prediction
> correctly.  The clock on (at least the OSS) /dev/dsp is no good, since it
> gives you no indication of when underruns occur.

I'd suggest to use the raw /dev/dsp and the raw /dev/midi interface:
use 2 threads: higher pri for audio, lower pri for midi
use a small fragmentsize x fragmentnum ,
( for example 3 x 256bytes = 4.3ms audio buffer)
then use the PCM playing thread as timer source ( 1.45ms accuracy in this case)
and simply wakeup the MIDI thread (via fifos/semaphore/msgqueues etc) from
the audio theread when you want to send data to MIDI out.
When data comes from MIDI in, put this in a queue ( msgsnd() , or use shmem )
and let the audio thread react on this on the next fragment,
(if you need sample accurate MIDI/audio sync, that is another story .. ).

Do not forget to apply the lowlatency patches, or your timing will simply suck !
even an untuned IDE disk, when it reads/writes a small amount of data from/to
the disk, could cause 20-50ms delay in your app and this is very bad
for MIDI.
( see my tests , especially the non DMA ones = horrible  :-)   ) 

> 
>   Damn annoying.

I think our collective timing/latency annoyance will go away with kernel 2.4,
mainly thanks to Ingo for his excellent work !
:-)

> 
>   I currently have ttrk setup to just 'turn on' the sample as soon as it
> sees the corresponding MIDI sync tick.  It's no good for drum samples or
> loops or anything, but I can trigger cheezy sci-fi samples and they don't
> sound _too_ out of place.  Ugh.

That is the precise reason why we are trying to put toghether the
realtime multimedia API (provided that the kernel delivers good timing
out of the box = kernel 2.4).
No worries anymore, and the system will always choose the optimal
way to transfer data/provide timing information and minimize scheduling
overhead.

> 
> > >  What about syncing multiple soundcards?  I've found this to be next to
> > >impossible under thud using OSS.
> > 
> > as has been discussed here a number of times, this is far from
> > trivial. clock rates from card to card, even the same brand, and even
> > from (warm) day to (cold) day vary, so its not just a matter of
> > finding a way to get them to all start at the same time. 

yes, this is far from trivial, but we will try to provide some usable solution:
mainly activating the cards by using DSP_SET_TRIGGER (if supported,
otherwise it's a real pain),  to minimize starting delays,
and then use one of the soundcards as source (or alternatively other
timer sources), and put the remaining cards into a "slave" mode,
where you measure the sample differences in audio buffers, and
insert additional or drop samples to keep things in sync.

> 
>   Yes, it is a pain, but there should be a better hacked job at least of
> doing it.  When I still had Windows around, Sonic Foundry ACID had no
> trouble at least faking some sync between my two AudioPCI cards.  I can't
> get it as good as they did. :/

You will
> 
>   There should also be API support for it.  I hope to soon (within the
> next year) get a soundcard that has multiple dsps inside it, for
> outputting multi-track stuff.  I'm really worried about how much I'm going
> to have to code myself though.....

Agreed,
I hope that an usable API/engine shows up during the next 6-9months.

I tested the peroformace of most subsystems of linux (involved in realtime
multimedia), and it seems that it is ready for our highend requirements.

Benno.


> 
> --
> Billy Biggs                         vektor@div8.net
> http://www.div8.net/billy       wbiggs@uwaterloo.ca
