From: Peter Leif Rasmussen <plr@cedara.com>
Date: Tue, 18 Apr 2000 13:52:01 +0000
Subject: Missing 16bit DMA channel
Message-Id: <marc-linux-sound-95606803212331@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have mentioned this before and I'm sure you are sick of it, but having
investigated some more I am actually more confused about this issue than ever.

It seems to me from reading documentation, linux/Documentation/sound files
and the sound HOWTO, and reading posts on this list that sound cards are
supposed to have one 8bit DMA channel and one 16bit if it has two DMA channels
and all drivers expect that?

As I am unfortunate enough to have a Socket7 mobo with a SB Vibra 16 chip on
it, which I can't disable, and that chip has two 8bit DMA channels instead of
one 8bit and one 16bit, I looked if I could get it to work with another
soundcard.

I found in my pile of stuff an ESS1868 soundcard, which should be very SB
compatible and an Opti925 soundcard. They are both ISA PNP cards. I also found
that those two only have two 8bit DMA channels as well and I had some problems
getting them to work on the mentioned mobo (using module sound drivers and the
isapnp tool or letting the kernel ISA PNP module take care of things, which it
didn't seem to really be able to).

In any case this has got to mean that there are lots of sound cards out there
that only have 8bit DMA channels, and not only the SB16 Vibra as I once thought,
so why is the design of the Linux sound subsystem made to expect 16bit for the
second DMA channel? At least that is what it looks like to me?

I could get the kernel (2.3.99-pre5) to detect the Opti925 card upon bootup,
with the drivers mentioned in the "sound/Opti" file compiled in and ISA PNP
also compiled in, but after that there was nothing that showed that there was
a sound device (/proc/dma, /proc/interrupts, /proc/ioports) even though
/proc/isapnp showed the presence of the Opti card.

Could someone please tell me what I am missing here?

Thank you very much,

Peter
