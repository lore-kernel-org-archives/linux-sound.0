From: Dan_Lasley@hilton.com
Date: Tue, 11 Jul 2000 14:37:19 +0000
Subject: Ensonic AudioPCI sound card problems
Message-Id: <marc-linux-sound-96332630904955@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



I have an old, scrounged Aztec ISA sound card that works just fine in a
Gateway P5-133.  I bought an Ensoniq AudioPCI and I can't make it
work!

I'm using Red Hat Linux 6.0 and I'm trying to install the sound card
with "sndconfig".  sndconfig worked like a charm for the old sound
card, but I've tried the following configurations with the new card
and neither will work:

     Ensoniq AudioPCI 1370 (SoundBlaster 64/128 PCI)

     Creative/Ensoniq AudioPCI 1371

I get this error for the first:

     The following error occurred running the modprobe program:
     /lib/modules/2.2.5-15/misc/es1370.o:
     init_module: Device or resource busy

And this error for the second:

     The following error occurred running the modprobe program:
     /lib/modules/2.2.5-15/misc/es1371.o:
     init_module: Device or resource busy

I don't find any other information in /var/log/messages.

I am using the kernel which comes with Red Hat 6.0, so it should have
support for all known sound cards.  Again, I had *no* problems in
configuring and running another sound card in this system.

I've checked /usr/src/linux/Documentation/sound/* and I found no
help on this particular sound card.

Can anyone furnish a clue?

Thanks.

Dan
