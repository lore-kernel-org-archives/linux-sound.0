From: jlexus@calweb.com
Date: Sun, 03 Jan 1999 20:20:06 +0000
Subject: Ensoniq Soundscape
Message-Id: <marc-linux-sound-91547030017023@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello !!!

I have an Ensoniq Soundscape soundcard which I bought
directly from Ensoniq direct about two years ago. The card
has jumpers all over it so its not pnp :) Since then
I built my computer from the following parts:

Motherboard : Asus T2P5 256K L2 onboard + 256K Coast with the latest bios.
CPU : Intel P5 100Mhz
Ram : 48 Megs Kingston
Hdd : WD 2.5 G Eide (primary master)
CDrom : Matshita CR-581 (primary slave)
Modem : USR 33.6 Internal (Com1, irq4)
Network Card : AN16 NE2000 combo ISA (port 300, irq11)
Soundcard : Ensoniq Soundscape ISA
Video card : Diamond Stealth Video 2500 PCI 2Megs
Video add-on card : Diamond Monster 3D PCI

Ever since slackware 3.2 I can't get my sound to work!
I dual boot to win and got the irq/dma/port numbers for
the soundcard which are:

Midi : Port 330 ; IRQ 9
Wave : Port 534 ; IRQ 5 ; DMA 1

Now I recompiled my kernel many many times but I still can't get any sound 
out of it :(

Right now I put Slackware 3.6 with 2.0.36 kernel.

Do I need to enable MSS or SB16 or what ?

Thanks alot in advance !!!

-Jean
--
E m a i l  :  jlexus@calweb(dot)com
P o w e r e d   b y  Linux   2.0.35
