From: Paul Barton-Davis <pbd@Op.Net>
Date: Wed, 27 Oct 1999 02:16:43 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94099060303318@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>  Here's one algorithm I tried to use for a while, you'll see the problem:
>
>   - There are N fragments "queued" by the hardware buffer in the
>     soundcard
>   - I check to see if i'm at the start of a new beat, if I am then
>     - If there are samples to play, start playing them in this fragment
>     - If there are MIDI notes to play, queue them to be played at
>       time per fragment * N in the future
>
>  The sync problem comes from not getting swapped in enough such that
>you'll send out the MIDI data at the instant that the audio out the
>soundcard actually gets played.

right, and the (or at least, *a*) solution (used in SoftWerk) is easy:
don't do forward queuing of MIDI data in /dev/sequencer. just output
it at the right time yourself, along with the audio data. the swapping
in/out problem is a separate issue - you may need to mlock() some of
the critical data in place. 

[ as an aside: a pet peeve: very few linux systems these days ever
swap. they do paging all the time, but thats different, well, sort
of. ]

your time resolution will be dictated by the fragment size used by the
soundcard driver/soundcard h/w, and it will way better than the kernel
sequencer offers, since its based on the timer interrupt (20ms typically).

SoftWerk's problem is even more acute: because one MIDI track can
control another's output data (e.g. one track controls the volume for
another track's NoteOn messages), and because the tracks run at
different speeds and may not ever be in sync, it is *impossible* to
use any kernel sequencer for any useful work. why ? because until time
T arrives, its impossible to compute what should actually be
sent. this means that you can't queue anything in the kernel
sequencer: you just have to wait for the "tick" to come around, and
compute what MIDI data should be sent (if any) on that tick.

in SoftWerk's case, because it doesn't process audio data in any way,
I use sigitimer(2) to give me a periodic async signal every so often
(typically 20-100ms: its controllable in the UI). i use this to
measure the passage of time, and compute when a beat/tick is
happening.  soon, i will use the RTC with select(2), which will be
more accurate and permit much faster tempos than sigitimer can.

if SoftWerk *did* handle audio data (which i hope it never does!), it
could use the timing from the soundcard DAC (or ADC) to get much more
precise timing. in such a system, external MIDI clock would just be
used as a master sync for tempo - i.e. each interval between 2 MIDI
clocks byte represents 1/24 (is that right ?) of a 1/4 beat.  we can
measure the time interval, and continue on with that tempo for our
calculations until the time between two MIDI clock bytes
changes. meanwhile, all actual scheduling of MIDI output data would be
done from the timebase of the soundcard DAC.

well, that's my approach anyway.

>  These days, I'm using three threads.  One for midi, one for audio, and
>one for the GUI.

sounds about right, although given the low speed of MIDI data, and the
fact that you can really only sensibly check for it between processing
audio fragments, you might be able to get away with just two.

>  Drivers had better be forthcomming.  Yes, I'm talking about cards like
>those, such as the Event Layla and Darla, etc.  Without them, it makes
>Linux pretty useless as a multitrack platform...

the manufacturers of such cards don't have much of an interest in
Linux. i did a little work at AES to try to change that, but its going
to be a long uphill battle.

>  Well, at least pretty annoying.  Personally, I have two AudioPCI cards
>and a dedicated MPU-401 card for MIDI.  Each of the AudioPCI cards have
>two dsps, giving me four /dev/dsp devices.

if you had 2 4D-NX's, you'd have 64 openable (mono) channels for
playback (*)...  is that enough for you ? :))) total cost $78+postage,
plus you'd have two excellent MIDI interfaces as well.

(*) but just 4 mono channels for recording, sigh.

--p
