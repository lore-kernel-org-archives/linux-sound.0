From: est@hyperreal.org
Date: Wed, 27 Oct 1999 16:33:14 +0000
Subject: sequencer timing issues
Message-Id: <marc-linux-sound-94104534231553@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Paul Barton-Davis discourseth:
>
> SoftWerk's problem is even more acute: because one MIDI track can
> control another's output data (e.g. one track controls the volume for
> another track's NoteOn messages), and because the tracks run at
> different speeds and may not ever be in sync, it is *impossible* to
> use any kernel sequencer for any useful work. why ? because until time
> T arrives, its impossible to compute what should actually be
> sent. this means that you can't queue anything in the kernel
> sequencer: you just have to wait for the "tick" to come around, and
> compute what MIDI data should be sent (if any) on that tick.

Hmm..sounds like you're already paying much of the price of the
hyperseq approach..might as well go all the way. :)

> in SoftWerk's case, because it doesn't process audio data in any way,
> I use sigitimer(2) to give me a periodic async signal every so often
> (typically 20-100ms: its controllable in the UI). i use this to
> measure the passage of time, and compute when a beat/tick is
> happening.  soon, i will use the RTC with select(2), which will be
> more accurate and permit much faster tempos than sigitimer can.

Wouldn't you say that an HZ > 100 kernel is the cleanest solution?

Re RTC: I'm about to post (just to linux-audio-dev) an idea about how
*you* can use it without stopping *my* app from using it. :)

Eric
