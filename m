From: Zack Smith <zts2@axe.humboldt.edu>
Date: Tue, 27 Apr 1999 04:23:22 +0000
Subject: sound cards for linux
Message-Id: <marc-linux-sound-92518713312599@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi,

I recently had an aweful experience trying to get an AWE-64 card
to work on my system. This was a PnP ISA card, and the isapnptools
could only recognize the SB16 registers and not the wave table,
joystick etc. And SB16 performance was plagued by distortion.

I have been trying to find a sound card for my system which is not
plug and play, but I have had no luck. Every vendor I go to
says they no longer sell sound cards which are not PnP.
Can you perhaps tell me if being plug and play is really 
the kiss of death as far as Linux goes? It certainly was
in the case of my AWE64.

Mind you I prefer to boot up as Linux with LILO, so I am not
intersted in booting under DOS to get the sound function to work.

Another question: Would a PCI card work alright despite being PnP? 

Also, I would like to have access to an FM synthesizer and
a MIDI emulator chip for playing MIDI files. Is there a
good card for that as well which will definitely work with
Linux?

One last question: I once read in a newsgroup that there was
interest in creating a generic interface for sound software
which would look the same regardless of the card. Has this
been accomplished yet?

Thanks for any info.

Zack Smith
