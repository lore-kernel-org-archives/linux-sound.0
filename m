From: "Peter John Cameron" <peterca@ukgateway.net>
Date: Thu, 21 Oct 1999 21:34:56 +0000
Subject: interrupt conflict with sound and video?
Message-Id: <marc-linux-sound-94055376721818@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I've got a voodoo 3000 video card and an integrated Creative SoundBlaster
AudioPCI 64V. These work without problems in win98. However, no sound is
forthcoming in Linux RH 6.1 (& 6.0) (apart from an odd click here and
there).

I've just noticed that win98 reports the voodoo card as having an IRQ of 11.
The SoundBlaster also has an IRQ of 11. On the other hand, the legacy sound
device has IRQ 7.

In Linux, the voodoo has IRQ 11 and the soundcard (automatically detected as
an ensoniq 1371) is also given IRQ 11.

Is this why I get no sound? IRQ 7 is free on my Linux system, so how should
I go about changing the sound card's IRQ from 11 to 7? Would such a change
affect how sound works in win98? More to the point, would it solve my lack
of Linux sound?

Someone suggested moving the PCI cards around in the slots. The sound card
is integrated onto the motherboard, so this means I have to physically move
the voodoo card? Is this the only solution?

Cheers,
Peter
