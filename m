From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 02 Nov 2011 18:54:21 +0000
Subject: Re: HDA Intel microphone regression in 3.1.0
Message-Id: <s5hy5vyl5ia.wl%tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20111102102554.1f443b9c@laptop.homenet>
	<20111102105442.GA30355@gere.osrc.amd.com>
	<s5hd3da6asw.wl%tiwai@suse.de>
	<20111102170742.059f04ed@laptop.homenet>
In-Reply-To: <20111102170742.059f04ed@laptop.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Vine <chris@cvine.freeserve.co.uk>
Cc: Borislav Petkov <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org

At Wed, 2 Nov 2011 17:07:42 +0000,
Chris Vine wrote:
> 
> On Wed, 02 Nov 2011 12:09:03 +0100
> Takashi Iwai <tiwai@suse.de> wrote:
> > At Wed, 2 Nov 2011 11:54:42 +0100,
> > Borislav Petkov wrote:
> > > 
> > > (adding some more people to Cc)
> > > 
> > > On Wed, Nov 02, 2011 at 10:25:54AM +0000, Chris Vine wrote:
> > > > My Lenovo S12 IdeaPad netbook uses a HDA Intel sound card with
> > > > Realtek ALC269 chip.  With the 3.1.0 kernel, all microphone input
> > > > (both with the internal microphone and any external microphone)
> > > > is permanently muted, although sound output works OK.  Microphone
> > > > input works correctly with the 3.0 and earlier kernels.
> > > > 
> > > > The only obvious difference between the 3.0 and 3.1 kernels is
> > > > that with kernel 3.0.7, 'dmesg | grep HDA' gives this:
> > > > 
> > > >  HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ
> > > > 22 HDA Intel 0000:00:1b.0: setting latency timer to 64
> > > >  input: HDA Digital PCBeep
> > > > as /devices/pci0000:00/0000:00:1b.0/input/input10 input: HDA
> > > > Intel Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
> > > > input: HDA Intel Headphone
> > > > as /devices/pci0000:00/0000:00:1b.0/sound/card0/input12
> > > > 
> > > > whereas with kernel 3.1.0 it just gives:
> > > > 
> > > >  input: HDA Digital PCBeep
> > > > as /devices/pci0000:00/0000:00:1b.0/input/input9 input: HDA Intel
> > > > Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
> > > > input: HDA Intel Headphone
> > > > as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
> > 
> > It's just a red herring.
> > 
> > > > lspci -v gives the following audio hardware information:
> > > > 
> > > >  00:1b.0 Audio device: Intel Corporation N10/ICH 7 Family High
> > > > Definition Audio Controller (rev 02) Subsystem: Lenovo Device 3be9
> > > > 	Flags: bus master, fast devsel, latency 0, IRQ 22
> > > > 	Memory at fc140000 (64-bit, non-prefetchable) [sizeK]
> > > > 	Capabilities: [50] Power Management version 2
> > > > 	Capabilities: [60] MSI: Enable- Count=1/1 Maskable- 64bit+
> > > > 	Capabilities: [70] Express Root Complex Integrated
> > > > Endpoint, MSI 00 Capabilities: [100] Virtual Channel
> > > > 	Capabilities: [130] Root Complex Link
> > > > 	Kernel driver in use: snd_hda_intel
> > > > 	Kernel modules: snd-hda-intel
> > 
> > Please give alsa-info.sh outputs taken from both 3.0 and 3.1 kernels.
> 
> Attached as below (warning, this is long).

Thanks.  Could you try to pass model=auto option to snd-hda-intel module?


Takashi
