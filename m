From: Bill Nottingham <notting@redhat.com>
Date: Sun, 27 Sep 1998 19:31:48 +0000
Subject: Re: AWE32 initialization wiht isapnp
Message-Id: <marc-linux-sound-90692495332028@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90692428831897@msgid-missing>
In-Reply-To: <marc-linux-sound-90692428831897@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Alexis DOMJAN (disco@igaia.ch) said: 
> In order to use the wavetable device of my AWE32 I was starting under
> MSDOS, executing ctpnp to configure the card and then I was running
> loadlin and the Wavetable was properly detected.
> 
> However I only want to use lilo, so I'm using isapnp to configure the
> awe32 (audio and wavetable) and then I "modprobe" sound module. Then the
> audio device (dsp, opl2/3) is correclty detected, but the AWE32 Wavetable
> on port 0x620 is not detected (according to /proc/ioports).

Find the line in your isapnp.conf file that says:

	(IO 0 (BASE 0x0620))
	
Add right after it:

	(IO 1 (BASE 0x0A20)) (IO 2 (BASE 0x0E20))
	
pnpdump, for whatever reason, doesn't see all the IO ports for
the EMU chip on the AWE.

Bill
