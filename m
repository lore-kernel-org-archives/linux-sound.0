From: Hannu Savolainen <hannu@opensound.com>
Date: Wed, 12 May 1999 08:56:41 +0000
Subject: Re: Playing a sine wave
Message-Id: <marc-linux-sound-92652810730306@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92649832906805@msgid-missing>
In-Reply-To: <marc-linux-sound-92649832906805@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 12 May 1999, Hrafnkell Eiriksson wrote:

> Hi
> 
> Is it possible to use the sequencer stuff in the OSS sound driver
> to let the sound card play a sine wave of a given frequency?
In theory it's possible to play sine waves using the OPL3 FM synth chip
available on most older (ISA) soundcards. However this is very inpractical
way.

A much easier way is using /dev/dsp. You only need to construct few cycles
of sine wave at given frequency to a buffer. Then just keep writing this
buffer to /dev/dsp as many times as you need. In fact it may even be
possible that somebody has already written this kind of app (look at
ftp://sunsite.unc.edu/pub/Linux/apps/sound).

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
