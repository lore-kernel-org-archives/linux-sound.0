From: Peter Leif Rasmussen <plr@cedara.com>
Date: Tue, 15 Feb 2000 21:22:14 +0000
Subject: SB, PNP, kernel, etc.
Message-Id: <marc-linux-sound-95065092731265@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95071956214609@msgid-missing>
In-Reply-To: <marc-linux-sound-95071956214609@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Recently I had to upgrade my main machine and went from a 486 with PNP BIOS
to a P233 also with PNP BIOS, because the old one looked like it was becoming
flaky, but I still have problems.

In the new motherboard (PC Partner) there is a SB16 Vibra already, but it
looks like it works like any other SB16 AT-bus card.

I'm running recent kernels (2.3.45 being the most recent) and I can't figure
out if I have a kernel, sounddriver or some other kind of problem.

I also have an NE1000 card (it is old I know, but it does its job, I think)
and an AHA1542B SCSI adapter (AT-bus) and they seem to be conflicting in some
way even though I can't figure out why?

1.The NE1000 card uses IRQ5 and IO=0x300
2.The AHA1542B is set up to use IRQ11, DMA7 and IO=0x340

It therefore seems like the only IRQ I have left is IRQ9 and the SB wants to use
IO=0x220 (it is PNP, but that port is the first on the list when checkin out
/proc/isapnp).

So I have tried to compile the SB driver into the kernel (and also ISA PNP
support) with IRQ9, DMA=1, DMA16=5 and UART401=0x330, but without any luck.

I have also tried to compile the SB driver as a module, run isapnp with the
isapnp.conf file that came out of using "pnpdump -c", but edited to use the
same values as when compiling the driver into the kernel. And then attempting
to load the driver with depmod (and I also attempted insmod). Here I usually
get a message that there isn't any PNP device, and that puzzles me because
executing "isapnp isapnp.conf" went all right?

Is there anyone who has some kind of advice? Especially if it doesn't say that
I should buy new hardware :-) I need to use both the network card and the
SCSI adapter, where I have no documentation on the network card so I can't
change the IRQ and IO settings, but I have on the AHA1542B adapter so if
that needs to change I could do that. IRQ: 1,2,3,4,7,10,12,14,15 are reserved
as far as I can see (keyb, mouse, serial, video, hd, parallel).

Thanks,

Peter
