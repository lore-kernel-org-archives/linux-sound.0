From: James Moody <jemoody@home.com>
Date: Thu, 22 Mar 2001 23:01:34 +0000
Subject: es1371 initialization question
Message-Id: <marc-linux-sound-98530293217833@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

I fear I'm missing something trivial. I'm using es1371 in 2.4.2-ac20 as
a module. 

Short question: How can I get it to automatically obtain an IRQ for my
soundcard upon initialization? It doesn't seem to do that automatically.

Long story:

It's an Ensoniq 5880 AudioPCI. ASUS CUSL-2 motherboard. There is no option
in the bios regarding a PNP-aware OS.

I have the following PNP devices that work fine as modules:
-ATI Rage 128
-D-Link 538

By 'work fine' I mean that before loading their respective modules,
lspci -vv shows, for each of them,
	Interrupt: pin A routed to IRQ 0

but during module load I see messages like
PCI: Enabling device 02:09.0 (0004 -> 0007)
PCI: Assigned IRQ 5 for device 02:09.0
PCI: Setting latency timer of device 02:09.0 to 64

and the module loads great, and henceforth lspci -vv shows, e.g.,
	Interrupt: pin A routed to IRQ 5.

Perfect.

This does not work with the sound card. modprobe es1371 fails, saying it
can't find the sound card. Trying to specify "irq=" doesn't help matters
(invalid parm_irq). lspci -vv always reports IRQ 0, so it's obvious that
the IRQ isn't being obtained.


HOWEVER:

I used to use ALSA, and everything worked fine with ALSA's snd-ens1371
module. It prints the requisite

PCI: Enabling device 02:0c.0 (0004 -> 0005)
PCI: Assigned IRQ 10 for device 02:0c.0
PCI: Setting latency timer of device 02:0c.0 to 64

upon loading, and works fine. If, at this point, I unload the alsa modules
and load the standard kernel es1371 module, EVERYTHING IS FINE because
the alsa module already got me an IRQ.

What am I missing? Why won't the es1371 module obtain an IRQ for me?

Thanks a lot for any help,

james
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
