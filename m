From: Emil Stephan <ste@esqhen.su.eunet.de>
Date: Tue, 08 Sep 1998 20:06:20 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90532249805027@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dave Wreski wrote:
> 
> Hi all.  I haven't played with my SB AWE64 in quite a while, so I'm no
> longer sure how to get it going again.
> 
> Can someone tell me how to get the PnP stuff going?  Where do I get
> started?  Whereis the FAQ?  Is the isapnptools necessary under 2.1 still?
> 
> Also, if I was looking for a sound-playing program, where is the best
> place to look?  Is there one program that does CD audio, and other audio
> file formats?
> 
> Thanks,
> Dave
> 
Hello Dave and all,
here is what i did with isapnp to my AWE64Gold:

(CONFIGURE CTL009e/4234717 (LD 0
#     ANSI string -->Audio<--
(INT 0 (IRQ 5 (MODE +E)))
(DMA 0 (CHANNEL 1))
(DMA 1 (CHANNEL 5))
(IO 0 (BASE 0x0220))
(IO 1 (BASE 0x0330))
(IO 2 (BASE 0x0388))
(ACT Y)
))
(CONFIGURE CTL009e/4234717 (LD 1
#     ANSI string -->Game<--
(IO 0 (BASE 0x0200))
(ACT Y)
))
(CONFIGURE CTL009e/4234717 (LD 2
#     ANSI string -->WaveTable<--
(IO 0 (BASE 0x0620))
(IO 1 (BASE 0x0A20))
(IO 2 (BASE 0x0E20))
(ACT Y)
))

A problem might be, that pnpdump is not generating the second and third
io for
the wave table synth. Another on is (for me), that midi output to my
keyboard
(musical not computer :-) ) does not work, neither with OSS/Free nor
with
OSS/Linux.

You can find Your Win95 config in a file named CTPNP.CFG in the Windows
directory
and set the values accordingly to avoid resource conflicts.

Remember that you have to download a sound font bank to the Wave table
with a command like this:

/usr/local/bin/sfxload
/win95/Programme/Creative/ctsnd/sfbank/synthgs.sbk

Bye, Emil.

--

--------------------------------------------------
Emil Stephan, Marktplatz 39, 53773 Hennef, Germany
voice: +49-2242-84438

Accelerate Windows: 9.81 m/sec^2 would be adequate
