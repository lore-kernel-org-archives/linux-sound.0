From: Danny Cox <danny@compgen.com>
Date: Mon, 05 Jun 2000 11:26:47 +0000
Subject: Creative Labs SoundBlaster 128 PCI Hangs
Message-Id: <marc-linux-sound-96020510409340@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello!

	I've just recently joined linux-sound, and have been "lurking" up
until now.

	I have a Creative Labs SoundBlaster 128 PCI.  It dosn't work.  It
will begin playing a wav file, but an indeterminite time later (10-40
seconds), it hangs the system.  The only recovery is a reset.  When it 
hangs, there is a high pitched tone, about 20% volume, that sounds like 
a square wave to me.

	I've read everything I can get my hands on, and have only one clue
so far: in .../drivers/sound/es1371.c, there is a comment about adding code
to handle Rev 7 boards.  My board reports itself as Rev 8.  Curious, no?

	The Sound-HOWTO mentions this very behavior, playing awhile, then
hanging, perhaps with a never-ending tone.  The cause is an IRQ or DMA
conflict.  Since this is the PCI bus, I don't think this is the problem.

	Can someone point me in further possible directions?  I'd be
willing to try most anything.

	Thanks!

Danny Cox
