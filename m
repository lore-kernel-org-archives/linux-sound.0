From: Chad Paco Walker <walker@hermes.noses.org>
Date: Tue, 27 Apr 1999 16:37:21 +0000
Subject: Re: sound cards for linux
Message-Id: <marc-linux-sound-92523075618453@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92518713312599@msgid-missing>
In-Reply-To: <marc-linux-sound-92518713312599@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Zack,

There is an excellent piece of information about the AWE64 that clears
your problem up.  (I'm looking for it now.)

This is a bug in the hardware design of the AWE64 that causes it to not
report all information back when you do a pnpdump. Specifically, it
doesn't report all the I/O bases for (you guessed it...) the wave
table.

I'll see if I can dig up what you need and post it to the list.

You simply need to add three lines to the isapnp.conf file and everything
will be just fine.  (I have an AWE64 in my machine, and already went
through this).

As for the distortion, get a UPS.  You'll remove your self from the
increasingly noisey power lines in your house/apartment (apartments are
worse) and you'll get a super clean signal through the bettery in the UPS.

regards,
Chad Walker

> 
> Hi,
> 
> I recently had an aweful experience trying to get an AWE-64 card
> to work on my system. This was a PnP ISA card, and the isapnptools
> could only recognize the SB16 registers and not the wave table,
> joystick etc. And SB16 performance was plagued by distortion.
> 
> I have been trying to find a sound card for my system which is not
> plug and play, but I have had no luck. Every vendor I go to
> says they no longer sell sound cards which are not PnP.
> Can you perhaps tell me if being plug and play is really 
> the kiss of death as far as Linux goes? It certainly was
> in the case of my AWE64.
> 
> Mind you I prefer to boot up as Linux with LILO, so I am not
> intersted in booting under DOS to get the sound function to work.
> 
> Another question: Would a PCI card work alright despite being PnP? 
> 
> Also, I would like to have access to an FM synthesizer and
> a MIDI emulator chip for playing MIDI files. Is there a
> good card for that as well which will definitely work with
> Linux?
> 
> One last question: I once read in a newsgroup that there was
> interest in creating a generic interface for sound software
> which would look the same regardless of the card. Has this
> been accomplished yet?
> 
> Thanks for any info.
> 
> Zack Smith
> 
