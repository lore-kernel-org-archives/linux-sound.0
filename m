From: gonzal <gonzal@unicamp.br>
Date: Thu, 31 Dec 1998 02:46:15 +0000
Subject: Re: I can't play audio CD
Message-Id: <marc-linux-sound-91510182131275@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

 > I've installed the alsa drivers for the CMI8330.

> > I can play *.au e *.wav files, but I can't play
> > audio CD's.
> >
> > Can you play audio CD's.

Jaroslav Kysela <perex@jcu.cz> wrote:

>I'm sorry, this chip isn't fully supported due to lacking docs..


David Mansell wrote:

> Actually playing audio CDs is part of the CD-ROM drivers rather
> than the sound driver.  Does the audio CD play at all (e.g. can you
> hear sound through the headphone socket on the front?)

> ALSA tends to use hardware muting so you might not be able to

> hear the CD even though it is actually working, you need a mixer
> which understands ALSA (e.g. alsamixer which is available from
> the same site as ALSA itself) to unmute the relevant channels,
> OSS mixers (e.g. xmix) won't be able to do this.
>

I use the alsamixer and I use aplay to play *.au, *.wav, and so on.
The sound is very good. When I using (by example) the workman,
I set the device to /dev/hdd (where my CD-ROM is). Then the
workman play the CD, there is no signal in the line out of the
back, but if I plug in the front of the CD-drive, I can heart the
music normally. I can also change the track of the CD and the
other functions of the workman.
