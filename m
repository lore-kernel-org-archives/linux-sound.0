From: Paul Barton-Davis <pbd@Op.Net>
Date: Thu, 28 Oct 1999 16:13:08 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94113792109390@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In message <Pine.LNX.4.04.9910281054160.1115-100000@shell.dhp.com>you write:
>On Thu, 28 Oct 1999, Paul Barton-Davis wrote:
>
>> no, ALSA has an ioctl to tell you if had underruns or overruns. its
>> The Right Way (TM). OTOH, i haven't written any audio programs that
>> ever use it, because I write them so that if I did have an
>> {over,under}run, it would mean that some totally catastrophic has
>> happened. maybe i don't write the right kinds of applications :)
>
>  How can you get close to that?  Do you always set realtime priority?  I
>get underruns happening when I move the mouse, depending on system load,
>even when the app is setuid root.

*smile* you've got a hardware problem. i know this because i have too :)

when i had to switch (temporarily) from my Matrix G200 AGP video card
to an old ISA-based Diamond Speedstar, the performance of my audio
stuff has gone down the tubes. i can't do *anything* with X and hope
to not get dropouts. this never happened with the Matrox card, and i
am very confident that as soon as Matrox ships me a new one, the
problem will go away.

right now, my system is essentially useless for audio work unless you
avoid using X. totally useless. i can't even play WAV files without
*huge* dropouts, and thats on a *dual* PII-450 !

if i use a text console, things are peachy.

>  I'm not actually talking about MTC, I'm talking about counting 24ppq
>sync pulses and predicting pulses, keeping in sync with them as much as
>possible.  Pretty bad.
>
>  So, it is still ncessary to keep the soundcards in sync with each other,
>then have some objective sense of where in time the audio buffer is such
>that I can tell the card the right thing to play at the time.

either i'm just confused, or you are, or both :)

barring underruns, which (trust me) are a totally separate issue, you
*always* know where you are since you're the one generating the
fragments for the audio buffer. if you asked for 3 fragments, then
other than for the first audio-buffer's worth of stuff (and you
typically fill it with silence when you start to avoid this problem),
you know that when you are working on a particular fragment, there are
2 more ahead of you that have yet to be played.

if you want more precise timing than is implied the fragment size
(which might be in the range of 0.5-2ms), you will need to timestamp
the MIDI messages you receive using, gettimeofday() or a cycle
counter, and do a little math based on the sample rate you configured
the soundcard to use. this way, you can calculate the "exact" sample
that was playing (i.e. emerging on the audio side of a DAC someplace)
when the MIDI message was "received", and then, by knowing how many
fragments are still pending (a fixed number, barring underruns), you
can infer exactly when any output that arises from (or should be
synced to) the MIDI data should emerge.

its pretty simple, really :)

--p
