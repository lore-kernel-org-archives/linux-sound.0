From: Sangohn Christian <sango-ch@reze-1.rz.rwth-aachen.de>
Date: Mon, 28 Sep 1998 02:08:46 +0000
Subject: Re: AWE32 initialization wiht isapnp
Message-Id: <marc-linux-sound-90703509605379@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90692428831897@msgid-missing>
In-Reply-To: <marc-linux-sound-90692428831897@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 27 Sep 1998, Bill Nottingham wrote:
>Alexis DOMJAN (disco@igaia.ch) said: 
>> In order to use the wavetable device of my AWE32 I was starting under
>> MSDOS, executing ctpnp to configure the card and then I was running
>> loadlin and the Wavetable was properly detected.
>> 
>> However I only want to use lilo, so I'm using isapnp to configure the
>> awe32 (audio and wavetable) and then I "modprobe" sound module. Then the
>> audio device (dsp, opl2/3) is correclty detected, but the AWE32 Wavetable
>> on port 0x620 is not detected (according to /proc/ioports).
>
>Find the line in your isapnp.conf file that says:
>
>	(IO 0 (BASE 0x0620))
>	
>Add right after it:
>
>	(IO 1 (BASE 0x0A20)) (IO 2 (BASE 0x0E20))
>	
>pnpdump, for whatever reason, doesn't see all the IO ports for
>the EMU chip on the AWE.

Her is an excerpt of my /etc/isapnp.conf
(CONFIGURE CTL0042/83463
	(LD 3
	#     ANSI string -->WaveTable<--
		(IO 0 (BASE 0x0620))
		(IO 1 (BASE 0x0A20))
		(IO 2 (BASE 0x0E20))
		(ACT Y)
	)
)

But I still have the problem.

>
>Bill
