From: Derrick J Brashear <shadow@dementia.org>
Date: Tue, 27 Jul 1999 19:33:43 +0000
Subject: Re: MP3s and Dell Latitude CPi D300XT
Message-Id: <marc-linux-sound-93310458716151@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93250171720342@msgid-missing>
In-Reply-To: <marc-linux-sound-93250171720342@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 20 Jul 1999, Matthew White wrote:

> Hello All-
> 
> I'm having a bit of a problem getting my Dell to play MP3 files.
> I've tried using both OSS/Free and ALSA drivers with no luck.  With
> mpg123 all I get is:

did you unmute alsa when you tried it? I'm using an alsa cvs snapshot:
# ALSA portion
alias char-major-116 snd
alias snd-card-0 snd-card-cs4232
options -k snd snd_major6 snd_cards_limit=1
options -k snd-card-cs4232 snd_index=1 snd_port=0x530 snd_irq=5 snd_dma1=1
snd_d
ma2=0
# OSS/Lite portion
alias char-major-14 soundcore
alias sound-slot-0 snd-card-0
alias sound-service-0-3 snd-pcm1-oss
alias sound-service-0-12 snd-pcm1-oss

I used --with-oss=yes. using amixer I did:
amixer eset 'PCM Switch',0,Switch1 on
amixer eset 'PCM Volume',0,Volume1 63

and all was then well

-D
