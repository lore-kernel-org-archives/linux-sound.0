From: Neale Banks <neale@lowendale.com.au>
Date: Fri, 12 Jul 2002 14:34:55 +0000
Subject: Re: Status of ALi5451(trident)?
Message-Id: <marc-linux-sound-102648433906886@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102629084116513@msgid-missing>
In-Reply-To: <marc-linux-sound-102629084116513@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 12 Jul 2002, Joern Nettingsmeier wrote:

> Neale Banks wrote:
[...]
> > Are you suggesting that the current drivers in 2.2 and 2.4 kernels (OSS?)
> > aren't worth using?
> >
> > That is, that I should just give up on those and use ALSA?
> 
> basically, yes. the oss drivers are probably perfectly ok,

'tis not my experience :-(

> but the whole
> alsa architecture is superior to oss, although more complex. if you just
> need simple audio playback/recording, oss is fine. for anything more
> demanding (low-latency operation, multichannel or even full-duplex with
> some cards), go for alsa. 

My immediate requirements are fairly mediochre:

1) audio for mpeg video playback
2) midi synth for rosegarden

> it's going to be "official" soon, it's already in the current
> development kernel.

Yes, ALSA appears to be coming in 2.5 - but my interest right now is in
2.2 and 2.4.

I'm somewhat astonished that (a) OSS sound doesn't want to work for me in
2.2 and (b) MIDI code appears to be missing from the OSS driver in 2.4.

I have that awful Arthur Dentish feeling that I've missed something
here....

> btw, there is a linux-audio-user list at
> http://www.linuxdj.com/audio/lad, in case you have questions concerning
> which application to choose for a job etc.

Not one of my immediate problems, but thanks for the pointer.

Regards,
Neale.

