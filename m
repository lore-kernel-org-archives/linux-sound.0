From: Bill Nottingham <notting@redhat.com>
Date: Sun, 31 Jan 1999 17:38:28 +0000
Subject: Re: Problem with cs4232.o
Message-Id: <marc-linux-sound-91780471919128@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91722163016425@msgid-missing>
In-Reply-To: <marc-linux-sound-91722163016425@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Miles Lane (root@amazon.com) said: 
> A reminder:  this is the problem where I get the
> 	Sound: DMA (output) timed out -IRQ/DRQ config error?
> when accessing my sound card after booting and logging in.
> 
> Unloading the cs4232.o module and then running "modprobe cs4232" 
> fixes the problem.  I'd like to fix this so the driver loads 
> correctly on boot.
<snip>
> MODULES:
<snip>
> 	pcmcia_core            35384   0 [serial_cs cb_enabler ds i82365]

I'd guess that pcmcia is stomping on the card ports 
(and perhaps IRQ/DMA channels) when it gets loaded.
Try editing /etc/pcmcia/config.opts, and changing
the "include port" line from "0x100-0x4ff"  (the default)
to "0x100-0x1ff". (You'd have to unload/reload pcmcia to
have this take effect, and possibly reboot.)
Does this help?

BIll
