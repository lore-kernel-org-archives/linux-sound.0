From: Neale Banks <neale@lowendale.com.au>
Date: Wed, 17 Jul 2002 08:04:48 +0000
Subject: Re: Ali5451 and MIDI synth
Message-Id: <marc-linux-sound-102689299713553@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102687407901788@msgid-missing>
In-Reply-To: <marc-linux-sound-102687407901788@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On 17 Jul 2002, Alan Cox wrote:

> On Wed, 2002-07-17 at 03:51, Neale Banks wrote:
> > * linux-2.2 has MIDI support in the code (v0.14.5c of trident.c) - but
> > this driver (a) doesn't work for basic audio[1] and (b) doesn't register a
> > MIDI synth device (and MIDI players complain of no device).
> 
> ALSA supports the synth facilities of the device, but not as "midi". The
> trident synth doesn't talk midi.

Pardon the naive question, but does that mean that apps looking for
(IIRC) /dev/sequencer are going to be workable with this chip or not?

If yes, what do I need to read up on?

Thanks,
Neale.

