From: Thomas Kalla <xTx@gmx.de>
Date: Fri, 31 Aug 2001 20:22:35 +0000
Subject: Re: Maybe a emu10k1 memory leak (II)
Message-Id: <marc-linux-sound-99928933411940@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Am Mittwoch, 29. August 2001 19:13 schrieb rui.p.m.sousa@clix.pt:
> On Sat, 25 Aug 2001, Rus V. Brushkoff wrote:
>
> Hi,
>
> Can you send me the output of free before and after this test?
>
>
> Thank you,
> Rui Sousa
>

Hi!

It seems that I also the same problem:

Here my results...

bash-2.05# free

             total       used       free     shared    buffers     cached
Mem:        513576      18160     495416          0       1156       6776
-/+ buffers/cache:      10228     503348
Swap:      1911724          0    1911724

bash-2.05# modprobe emu10k1
bash-2.05# free

             total       used       free     shared    buffers     cached
Mem:        513576      18456     495120          0       1156       6872
-/+ buffers/cache:      10428     503148
Swap:      1911724          0    1911724

bash-2.05# rmmod emu10k1 && insmod emu10k1
bash-2.05# free

             total       used       free     shared    buffers     cached
Mem:        513576      18460     495116          0       1156       6872
-/+ buffers/cache:      10432     503144
Swap:      1911724          0    1911724

bash-2.05# rmmod emu10k1 && insmod emu10k1
bash-2.05# free

             total       used       free     shared    buffers     cached
Mem:        513576      18464     495112          0       1156       6872
-/+ buffers/cache:      10436     503140
Swap:      1911724          0    1911724
 
bash-2.05# rmmod emu10k1 && insmod emu10k1
bash-2.05# free

            total       used       free     shared    buffers     cached
Mem:        513576      18468     495108          0       1156       6872
-/+ buffers/cache:      10440     503136
Swap:      1911724          0    1911724


My system: Althlon 1333Mhz, 512MB, ASUS A7V133, SB Live Player 5.1

Audio driver log:

Creative EMU10K1 PCI Audio Driver, version 0.15, 23:31:08 Aug 13 2001
PCI: Found IRQ 5 for device 00:0a.0
EMU10K1 rev 7 model 0x8061 found, IO at 0xa400-0xa41f, IRQ 5
ac97_codec: AC97 Audio codec, id: 0x8384:0x7608 (SigmaTel STAC9708)

Kernel: 2.4.9-pre2, compiled on GCC 2.95.3, Binutils 2.11, Glibc 2.2.3
(System selfcompiled, based on the LinuxFromScratch project)

Tom
