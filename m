From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Wed, 21 Oct 1998 09:56:24 +0000
Subject: Re: soundcard confusion
Message-Id: <marc-linux-sound-90897754002457@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90887944325515@msgid-missing>
In-Reply-To: <marc-linux-sound-90887944325515@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

'Terra NovA' B. Loeding wrote:

> Ok. First question. I've got a SB Awe64PCI.
> What is the difference between the es1370 driver
> and the es1371 driver?

One driver is for the ES1370 ASIC and the other
one for the ES1371 ASIC :-)  The main difference
between these chips is the codec interface.

The latter supports the generic AC97 interface,
which means it has to have built in sample
rate converters.

> and I have sound... kind of. I can play audio CD's
> fine but the volume is so low I can barely hear it.
> The same goes for sound samples but I also find a
> large drop in sound quality too.

use a tool like xmixer to increase the volume.
Also enable CD as a recording source.

> What's the difference between /dev/audio and /dev/dsp?

The default sample format for /dev/audio is ALAW (or was
it ULAW?), which is not supported by the es137* drivers.
/dev/dsp's default is linear 8bit.

> Why do most command line sound programs want to output
> to /dev/audio by default?

Maybe inherited from old Sun audio hardware.

> Why I'm I not getting any sound from /dev/dsp?

maybe because the mixer volume is too low?

> Why is the lineout channel (dsp1) so low on volume?

Same as above probably

> How do I tell the es1370 driver to have the joystick port
> ON by default?

Joystick might be a bit of a problem currently, you might
need to delete the request_region for the joystick ports

> How do I use /dev/midi? Nothing seems to work.

/dev/midi is possibly not what you want, it is a
raw interface to the MIDI UART. If you just want
to play midi files, use eg. timidity.

Tom
