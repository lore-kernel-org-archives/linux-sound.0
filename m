From: Billy Biggs <vektor@div8.net>
Date: Tue, 26 Oct 1999 23:21:12 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94098009026124@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Paul Barton-Davis wrote:

> >  I was using O_RDWR | O_NONBLOCK, under a 2.2 kernel.  I was trying to do
> >drumrolls, 16th notes, at 140bpm or 150bpm.  It was no good.
> 
> hmm. i should try some stuff like this myself, but i haven't written
> an audio sequencer yet :)

  I'm sorry, you have me confused.  This was using /dev/midi, only
outputting MIDI notes.

> let me just clarify one thing: so ttrk is an audio+MIDI sequencer ? it
> does output audio as well as MIDI (or just audio ?)

  ttrk is currently only useful as a MIDI sequencer, but it happily opens
all audio devices available and will attempt to play samples on beat.

>      * soundcard has N fragments "queued" in its hardware buffer by 
>        the driver
>      * you're about to assemble the audio data for the next fragment
>      * you check for MIDI data
>      * MIDI data is here - you decide to include sample X in the next
>        fragment (and future ones too, most likely, since most samples
>        last longer than the fragment size).
> 
> where is the timing problem ? i am sure i am missing something, given
> that my MIDI related work has been almost entirely MIDI-only.

  Here's one algorithm I tried to use for a while, you'll see the problem:

   - There are N fragments "queued" by the hardware buffer in the
     soundcard
   - I check to see if i'm at the start of a new beat, if I am then
     - If there are samples to play, start playing them in this fragment
     - If there are MIDI notes to play, queue them to be played at
       time per fragment * N in the future

  The sync problem comes from not getting swapped in enough such that
you'll send out the MIDI data at the instant that the audio out the
soundcard actually gets played.

  This all gets worse once you have to know more about the audio buffer
location, for example, when you're trying to sync to an external MIDI
source, and already have alot of error due to your estimates about the
external sync's tempo and your predicted next beat.

  These days, I'm using three threads.  One for midi, one for audio, and
one for the GUI.

> >  There should also be API support for it.  I hope to soon (within the
> >next year) get a soundcard that has multiple dsps inside it, for
> 
> do you really mean DSP's ? the only cards I know like this are things
> like the Creamware Pulsar and SCOPE, and the Yamaha DSP Factory. Linux
> support for these is not likely to be forthcoming (though I may write
> the drivers for Creamware).

  Drivers had better be forthcomming.  Yes, I'm talking about cards like
those, such as the Event Layla and Darla, etc.  Without them, it makes
Linux pretty useless as a multitrack platform...

  Well, at least pretty annoying.  Personally, I have two AudioPCI cards
and a dedicated MPU-401 card for MIDI.  Each of the AudioPCI cards have
two dsps, giving me four /dev/dsp devices.

--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
