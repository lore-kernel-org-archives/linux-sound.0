From: Billy Biggs <vektor@div8.net>
Date: Thu, 28 Oct 1999 14:59:07 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94112291221106@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 28 Oct 1999, Paul Barton-Davis wrote:

> no, ALSA has an ioctl to tell you if had underruns or overruns. its
> The Right Way (TM). OTOH, i haven't written any audio programs that
> ever use it, because I write them so that if I did have an
> {over,under}run, it would mean that some totally catastrophic has
> happened. maybe i don't write the right kinds of applications :)

  How can you get close to that?  Do you always set realtime priority?  I
get underruns happening when I move the mouse, depending on system load,
even when the app is setuid root.

  Am I unique in that my apps never seem to be able to keep up?

> >  I don't like using one dsp as the sync master since I always want to be
> >able to sync to something external, like MIDI.
> 
> if you mean MTC, this simply isn't accurate enough for syncing
> soundcards. [...]
> 
> so, i don't think you can "sync soundcards" from MIDI. You can use MTC
> to help inform your own sense of the forward passage of time and to
> dictate MIDI-related tempo, but thats not the same thing that Benno
> was talking about.

  Right, I was being confusing.

  I'm not actually talking about MTC, I'm talking about counting 24ppq
sync pulses and predicting pulses, keeping in sync with them as much as
possible.  Pretty bad.

  So, it is still ncessary to keep the soundcards in sync with each other,
then have some objective sense of where in time the audio buffer is such
that I can tell the card the right thing to play at the time.

--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
