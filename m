From: Derrick J Brashear <shadow@DEMENTIA.ORG>
Date: Sun, 29 Nov 1998 02:19:05 +0000
Subject: Re: sound driver for Dell Latitude CP (and other laptops)
Message-Id: <marc-linux-sound-91233752326767@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91182489707241@msgid-missing>
In-Reply-To: <marc-linux-sound-91182489707241@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a Dell Latitude CPi; Based on what you said I assume the audio is
the same. I'm ucrrently using ALSA with the following configuration:
add to /etc/conf.modules:
alias char-major-14 snd
alias snd-minor-oss-0 snd-card-cs4232
alias snd-minor-oss-3 snd-pcm1-oss
alias snd-minor-oss-4 snd-pcm1-oss
alias snd-minor-oss-5 snd-pcm1-oss
alias snd-minor-oss-12 snd-pcm1-oss
alias snd-card-0 snd-card-cs4232
options snd snd_major snd_cards_limit=1
options snd-card-cs4232 snd_index=1 snd_port=0x530 snd_irq=5 snd_dma1=1 snd_dma2=0

Then:
modprobe snd-card-0

Then go; You will need to unmute the sound card before you can use it; 
cat /proc/asound/0/mixer0 | sed s/mute// > /proc/asound/0/mixer0

Note that I needed to configure e.g. the parallel port from within windows
to be not ECPP or something like that; Basically, if Windows can do duplex
audio, this will work, otherwise there are 3 things you must pick from,
which are ECPP, duplex audio, and something else, and I don't remember how
I discovered what was what.

-D
