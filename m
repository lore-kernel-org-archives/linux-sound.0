From: <root@styx.bibnat.ro>
Date: Mon, 23 Nov 1998 10:00:08 +0000
Subject: MSS/WSS
Message-Id: <marc-linux-sound-91181534303435@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a Compaq Deskpro XL with integrated sound.
BIOS says the card is on 530, DMA 3, doesn't say anything about IRQ.
OK, windoze 95 works just fine with sound, and says it's on 530/DMA 3/IRQ
9; i compiled my kernel with these values (i checked MSS/WSS ) and it says
at boot that soundcard installation is ok...
But, when i play a file through /dev/dsp it stops after a few seconds and
hits me with that error about IRQ/DRQ ( couldn't paste, i'm running on the
old kernel) and stops... Also, i can 'play' mp3s, but it sounds like it's
playing the same position in the song for a few seconds and then jumps to
another position and plays it repeatedly and so on...

OK, not sure i made my self clear, but i can try pasting and explaining if
anyone wants to help me.
Maybe there is someone out there with the same machine/soundcard and knows
how to solve this problem.
I'm running Slackware 3.6 with 2.0.35 kernel.
Thanks in advance.

Paul <root@bibnat.ro>, who kinda hates the Compaq/Linux combo, but loves
Linux wholeheartedly.
