From: <rui.p.m.sousa@clix.pt>
Date: Fri, 31 Aug 2001 09:50:05 +0000
Subject: Re: [Emu10k1-devel] Re: Maybe a emu10k1 memory leak
Message-Id: <marc-linux-sound-99925149914477@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 29 Aug 2001, Rus V. Brushkoff wrote:

> On Wed, 29 Aug 2001 rui.p.m.sousa@clix.pt wrote:
>
> : Can you send me the output of free before and after this test?
> :
>
> .......
>
>              total       used       free     shared    buffers     cached
> Mem:        255836      72340     183496          0       1724      51548
> -/+ buffers/cache:      19068     236768
> Swap:       168672          0     168672
> [Alice]:root:~ # free
>
> > rmmod emu10k1; insmod emu10k1
>
>              total       used       free     shared    buffers     cached
> Mem:        255836      72444     183392          0       1724      51548
> -/+ buffers/cache:      19172     236664
> Swap:       168672          0     168672
> [Alice]:root:~ # free
>
> > rmmod emu10k1; insmod emu10k1
>
>              total       used       free     shared    buffers     cached
> Mem:        255836      72448     183388          0       1724      51548
> -/+ buffers/cache:      19176     236660
> Swap:       168672          0     168672
> [Alice]:root:~ # free
>
> > rmmod emu10k1; insmod emu10k1
>
>              total       used       free     shared    buffers     cached
> Mem:        255836      72452     183384          0       1724      51548
> -/+ buffers/cache:      19180     236656
> Swap:       168672          0     168672
> [Alice]:root:~ #
>
> .......
>
> As I see the leak is 4k size. Do you see the same or I have a wrong kernel ?
		       ^^

A page size... I will look into this but can you also try to compile your
kernel and driver with a more "realiable" compiler i.e egcs-1.1.2 (gcc
2.91.xx) and see if the problem still shows up.

Thank you,

Rui

>
> My setup : Soltek SL-75KAV-X MB with 1GHz Athlon, emu10k1 -
>
> emu10k1: EMU10K1 rev 8 model 0x8027 found, IO at 0xdc00-0xdc1f, IRQ 10
> ac97_codec: AC97 Audio codec, id: 0x8384:0x7609 (SigmaTel STAC9721/23)
>
> Kernel 2.4.9 compiled with gcc-3.0.1/binutils 2.11.90.0.24. Glibc - v2.2.4
>
> lspci output :
>
> 00:00.0 Host bridge: VIA Technologies, Inc.: Unknown device 0305 (rev 03)
> 00:01.0 PCI bridge: VIA Technologies, Inc.: Unknown device 8305
> 00:07.0 ISA bridge: VIA Technologies, Inc. VT82C686 [Apollo Super] (rev 40)
> 00:07.1 IDE interface: VIA Technologies, Inc. VT82C586 IDE [Apollo] (rev 06)
> 00:07.2 USB Controller: VIA Technologies, Inc. VT82C586B USB (rev 16)
> 00:07.3 USB Controller: VIA Technologies, Inc. VT82C586B USB (rev 16)
> 00:07.4 Bridge: VIA Technologies, Inc. VT82C686 [Apollo Super ACPI] (rev 40)
> 00:07.5 Multimedia audio controller: VIA Technologies, Inc. VT82C686
> [Apollo Super AC97/Audio] (rev 50)
> 00:0a.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8139 (rev 10)
> 00:0c.0 Multimedia audio controller: Creative Labs SB Live! EMU10000 (rev 08)
> 00:0c.1 Input device controller: Creative Labs SB Live! (rev 08)
> 01:00.0 VGA compatible controller: nVidia Corporation GeForce 256 (rev 10)
>
> :
> :
>
> 		Rus
>
>
>
> _______________________________________________
> Emu10k1-devel mailing list
> Emu10k1-devel@opensource.creative.com
> http://opensource.creative.com/mailman/listinfo/emu10k1-devel
>

