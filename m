From: Tony Nugent <tony@growzone.com.au>
Date: Wed, 03 May 2000 07:13:53 +0000
Subject: Re: Sound devices in /dev/
Message-Id: <marc-linux-sound-95733885419989@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95731069101401@msgid-missing>
In-Reply-To: <marc-linux-sound-95731069101401@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue May 02 2000 at 17:33, Craig Wright wrote:

> I just got a soundblaster 16 pci and after some trouble got it working a
> little bit.  I can play CD's with workman and the sound comes out of the
> card.  That's good :), but I'm missing /dev/audio and /dev/sndstat and any
> other sound device that I may need.  (I don't know what the others may

They aren't used with this driver (es1371), it's pci and therefore a
very different beast.

> be, /dev/dsp?)  Anyway I've run /dev/MAKEDEV and nothing new is created.
> I'm at a hurdle I can't jump by myself.  Can anyone help me?  I've tried
> using mknod myself, but don't know why they mean by minor and major device
> numbers mean.

See the docs in /usr/src/linux/Documentation/sound/*

For the pci sound cards, use /proc and other such tools to get the
info you need.

> Here is the output from the kernel on bootup:
> 
> es1371: version v0.19 time 00:44:39 May  1 2000
> es1371: found adapter at io 0xe000 irq 5
> es1371: features: joystick 0x200
> es1371: codec vendor CRY revision 19
> es1371: codec features Headphone out 20bit DAC 18bit ADC
> es1371: stereo enhancement: Crystal Semiconductor 3D Stereo Enhancement

Cool, it's not a bad card (got one myself here).  The 3D stuff is
awesome with windows games that know about it, and the switches are
there for linux to use it too.  (Although I must admit that I've never
tried the 3D sound for linux - anyone got a program or sound file that
will "show it off" ?)

> I think this is all relevant, but I don't know for sure.  Can anyone
> help?

I'm no sound driver guru, so perhaps someone else might want to make
things a lot clearer than I have.  AFAIK, /dev/sndstat and co. are
obselete and don't work for pci-based sound cards, they only have
relevance for the older isa sound cards.

Cheers
Tony
