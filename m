From: Dave Mielke <dave@mielke.cc>
Date: Fri, 19 Nov 1999 04:29:42 +0000
Subject: Re: AWE64
Message-Id: <marc-linux-sound-94298584204148@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91965172830159@msgid-missing>
In-Reply-To: <marc-linux-sound-91965172830159@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by Heikki Kallasjoki on November 19, 1999, at 00:38]

>Another possible problem with sbAWE64, that many people seem to have, is
>the fact that pnpdump fails to recognize correctly those IO-ports for the
>wavetable part of the card. I have never used Red Hat personally, so I
>don't know much about how configuring it goes, but when you get the card
>working so that sound can be heard, if you then notice that the wavetable
>driver doesn't find the card, and it is a PnP version, (is there a
>non-PnP-awe64?) the cause might be this.

I have a RedHat system, and RedHat's "sndconfig" works just fine with my PNP
AWE64 card. Even the wave tables work.

The relevant part of "/etc/conf.modules" is:

   alias sound sb
   pre-install sound insmod sound dmabuf=1
   options opl3 io=0x388
   alias midi awe_wave
   post-install awe_wave /bin/sfxload /etc/midi/GU11-ROM.SF2
   options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330

The relevant parts of "/etc/isapnp.conf" are:

   (CONFIGURE CTL00c5/63091016 (LD 0
   #     ANSI string -->Audio<--
     (INT 0 (IRQ 5 (MODE +E)))
     (DMA 0 (CHANNEL 1))
     (DMA 1 (CHANNEL 5))
     (IO 0 (SIZE 16) (BASE 0x0220))
     (IO 1 (SIZE 2) (BASE 0x0330))
     (IO 2 (SIZE 4) (BASE 0x0388))
    (NAME "CTL00c5/63091016[0]{Audio               }")
     (ACT Y)
   ))
   (CONFIGURE CTL00c5/63091016 (LD 2
   #     ANSI string -->WaveTable<--
   (IO 0 (BASE 0x0620)) (IO 1 (BASE 0x0A20)) (IO 2 (BASE 0x0E20))
    (NAME "CTL00c5/63091016[2]{WaveTable           }")
     (ACT Y)
   ))

>Now, AWE64 uses also ports 0xA20 and 0xE20 in addition to 0x620, and all
>implementations of pnpdump I've seen have been unable to detect that. 

As you can see from tyhe above, REdHat's "sndconfig" utility did find all of
the ports just fine.

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
