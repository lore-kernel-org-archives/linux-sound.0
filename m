From: Paul Barton-Davis <pbd@Op.Net>
Date: Tue, 26 Oct 1999 22:53:51 +0000
Subject: Re: [linux-audio-dev] Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94097843123948@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>  I was using O_RDWR | O_NONBLOCK, under a 2.2 kernel.  I was trying to do

good start ...

>drumrolls, 16th notes, at 140bpm or 150bpm.  It was no good.

hmm. i should try some stuff like this myself, but i haven't written
an audio sequencer yet :)

let me just clarify one thing: so ttrk is an audio+MIDI sequencer ? it
does output audio as well as MIDI (or just audio ?)

>  One requirement for ttrk was that it be able to trigger samples on beat,
>in sync with incomming MIDI.  This is a pain in the ass, since I have to
>know exactly where in the audio output I am in order to do the prediction
>correctly.  The clock on (at least the OSS) /dev/dsp is no good, since it
>gives you no indication of when underruns occur.

assuming you've got the buffering set up right, you shouldn't have any
underruns, and if you do, then you're already in deep water. surely
your situation is just:

     * soundcard has N fragments "queued" in its hardware buffer by 
       the driver
     * you're about to assemble the audio data for the next fragment
     * you check for MIDI data
     * MIDI data is here - you decide to include sample X in the next
       fragment (and future ones too, most likely, since most samples
       last longer than the fragment size).

where is the timing problem ? i am sure i am missing something, given
that my MIDI related work has been almost entirely MIDI-only.

>  Yes, it is a pain, but there should be a better hacked job at least of
>doing it.  When I still had Windows around, Sonic Foundry ACID had no
>trouble at least faking some sync between my two AudioPCI cards.  I can't
>get it as good as they did. :/

ALSA will do a good job. don't know if its "as good".

>  There should also be API support for it.  I hope to soon (within the
>next year) get a soundcard that has multiple dsps inside it, for

do you really mean DSP's ? the only cards I know like this are things
like the Creamware Pulsar and SCOPE, and the Yamaha DSP Factory. Linux
support for these is not likely to be forthcoming (though I may write
the drivers for Creamware).

>outputting multi-track stuff.  I'm really worried about how much I'm going
>to have to code myself though.....

something like the Trident 4D-NX cards under ALSA support this pretty
transparently, since the card does hardware mixing of up to 16 (or 32,
can't recall) audio streams, and ALSA supports multiple open calls -
it just assigns each successive open a new channel on the 4D-NX. the
card costs $39+postage, and ALSA costs nothing :)

--p
