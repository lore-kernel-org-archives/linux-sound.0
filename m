From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Fri, 12 Jul 2002 08:20:10 +0000
Subject: Re: Status of ALi5451(trident)?
Message-Id: <marc-linux-sound-102646207317586@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102629084116513@msgid-missing>
In-Reply-To: <marc-linux-sound-102629084116513@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Neale Banks wrote:
> 
> On Wed, 10 Jul 2002, Joern Nettingsmeier wrote:
> 
> > check on www.alsa-project.org, and ask on the alsa-user list. iirc, it's
> > supported.
> 
> Are you suggesting that the current drivers in 2.2 and 2.4 kernels (OSS?)
> aren't worth using?
>
> That is, that I should just give up on those and use ALSA?

basically, yes. the oss drivers are probably perfectly ok, but the whole
alsa architecture is superior to oss, although more complex. if you just
need simple audio playback/recording, oss is fine. for anything more
demanding (low-latency operation, multichannel or even full-duplex with
some cards), go for alsa. 
it's going to be "official" soon, it's already in the current
development kernel.

btw, there is a linux-audio-user list at
http://www.linuxdj.com/audio/lad, in case you have questions concerning
which application to choose for a job etc.
