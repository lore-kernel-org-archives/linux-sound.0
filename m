From: Paul Barton-Davis <pbd@Op.Net>
Date: Thu, 28 Oct 1999 14:45:09 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94112190919473@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>  What lowlatency patches??  kernel patches??  That's just ugly.  Where
>can I get them?

not ugly! the kernel folks, well Ingo Molnar in particular, recognized
that the kernel wasn't well tuned for low latency requirements. Ingo
believes that his patches will be in kernel 2.4.

look at http://www.gardena.net/benno/linux/audio for more details.

>  How can you tell if you've underrun under OSS?  Using ALSA, I guess you
>can use it's time stuff to calculate if you've missed a frame, but even
>that seems hacky.

no, ALSA has an ioctl to tell you if had underruns or overruns. its
The Right Way (TM). OTOH, i haven't written any audio programs that
ever use it, because I write them so that if I did have an
{over,under}run, it would mean that some totally catastrophic has
happened. maybe i don't write the right kinds of applications :)

>  I don't like using one dsp as the sync master since I always want to be
>able to sync to something external, like MIDI.

if you mean MTC, this simply isn't accurate enough for syncing
soundcards. you can use MTC as a master clock for tempo, but between
MIDI clock messages you will still have to be prepared to do the
actual syncing of soundcards. Given that a MTC messages take on the
order of 1ms to arrive (!), its not a high-quality sync source.

so, i don't think you can "sync soundcards" from MIDI. You can use MTC
to help inform your own sense of the forward passage of time and to
dictate MIDI-related tempo, but thats not the same thing that Benno
was talking about.

--p
