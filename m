From: Billy Biggs <vektor@div8.net>
Date: Tue, 26 Oct 1999 21:06:01 +0000
Subject: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94097346918347@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Paul Barton-Davis wrote:

> >> advice #1: do not use /dev/sequencer, solution, use /dev/midi*
> >
> >  This is pretty useless IMHO.  My sequencer started off writing out
> >/dev/midi, and it was consistently off-sync.  Badly off sync.
> 
> did you open it O_NONBLOCK, and which kernel were you using ?

  I was using O_RDWR | O_NONBLOCK, under a 2.2 kernel.  I was trying to do
drumrolls, 16th notes, at 140bpm or 150bpm.  It was no good.

  Well, I recorded some songs using it, but I had to avoid playing too
many notes in rapid succession on any one track, and damned if I trigger
drums with it.

> personally, most of my current applications are so phase-locked to a
> soundcard DAC that i can get "perfect" sync timing from that. some
> applications (and MIDI-only sequencers are a very good example of
> them) are not like this, however, since they do no audio output :)

  One requirement for ttrk was that it be able to trigger samples on beat,
in sync with incomming MIDI.  This is a pain in the ass, since I have to
know exactly where in the audio output I am in order to do the prediction
correctly.  The clock on (at least the OSS) /dev/dsp is no good, since it
gives you no indication of when underruns occur.

  Damn annoying.

  I currently have ttrk setup to just 'turn on' the sample as soon as it
sees the corresponding MIDI sync tick.  It's no good for drum samples or
loops or anything, but I can trigger cheezy sci-fi samples and they don't
sound _too_ out of place.  Ugh.

> >  What about syncing multiple soundcards?  I've found this to be next to
> >impossible under thud using OSS.
> 
> as has been discussed here a number of times, this is far from
> trivial. clock rates from card to card, even the same brand, and even
> from (warm) day to (cold) day vary, so its not just a matter of
> finding a way to get them to all start at the same time. 

  Yes, it is a pain, but there should be a better hacked job at least of
doing it.  When I still had Windows around, Sonic Foundry ACID had no
trouble at least faking some sync between my two AudioPCI cards.  I can't
get it as good as they did. :/

  There should also be API support for it.  I hope to soon (within the
next year) get a soundcard that has multiple dsps inside it, for
outputting multi-track stuff.  I'm really worried about how much I'm going
to have to code myself though.....

--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
