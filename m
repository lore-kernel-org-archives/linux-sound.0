From: Paul Barton-Davis <pbd@Op.Net>
Date: Tue, 26 Oct 1999 19:59:04 +0000
Subject: Re: [linux-audio-dev] External MIDI Sync using OSS/Free
Message-Id: <marc-linux-sound-94096794410600@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94095789529102@msgid-missing>
In-Reply-To: <marc-linux-sound-94095789529102@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>> advice #1: do not use /dev/sequencer
>[ solution, use /dev/midi* ]
>
>  This is pretty useless IMHO.  My sequencer started off writing out
>/dev/midi, and it was consistently off-sync.  Badly off sync.  Up to half
>a second off sync.  I don't know if you have a significantly better box
>than I do, but mine just puked.

did you open it O_NONBLOCK, and which kernel were you using ? support
for O_NONBLOCK was added (by me) somewhere during the 2.1 development
series. if you tried /dev/midi on 2.0 or earlier, you'll find it works
a *lot* better under 2.2.

previously, the driver would block until there were 32 bytes of data
to read. this is a disaster! if you use select(2) and open
(...O_NONBLOCK...)  i think you'll find you stay totally in sync.

this used to be a standard problem with /dev/midi, which was one
of the reasons I fixed it :)

>  I wish there were a better way to sync audio though, specifically sync
>of audio to MIDI.  /dev/dsp has a crappy interface to this.  Does ALSA
>provide any reasonable mechanism of syncing different inferfaces?

well, it has a more evolved timer interface, but its not clear that
anyone has tried using it for anything real. 

personally, most of my current applications are so phase-locked to a
soundcard DAC that i can get "perfect" sync timing from that. some
applications (and MIDI-only sequencers are a very good example of
them) are not like this, however, since they do no audio output :)

>  In OSS, the clock between outgoing and incomming MIDI aren't the same.
>In ALSA, I'd hope that would be fixed.  Does audio and sequencer also have
>the same clock?

i don't know the answer to either of these questions. jaroslav reads
linux-audio-dev, so he may be able to help you.

>  What about syncing multiple soundcards?  I've found this to be next to
>impossible under thud using OSS.

as has been discussed here a number of times, this is far from
trivial. clock rates from card to card, even the same brand, and even
from (warm) day to (cold) day vary, so its not just a matter of
finding a way to get them to all start at the same time. 

in addition, you *cannot* simultaneously issue a command to every card
to start playing/recording, so unless the soundcard h/w supports a
"start when first sample > XXX is seen" command (not many do), you can
*never* get them truly synchronized. ALSA does let you get pretty
close though. I think that Benno or someone else did some tests of
this.
