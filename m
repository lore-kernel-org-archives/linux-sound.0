From: "Ezhik Lesnoy" <ezhik@hotbox.ru>
Date: Thu, 28 Feb 2002 16:59:41 +0000
Subject: SiS 7018 audio problem
Message-Id: <marc-linux-sound-101491818427524@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello everybody!
I have a laptop computer with SiS 630 chipset.
My audio card is PCI SiS 7018, integrated in this chipset.
I've tried very hard to get it working, but all in vain.
I would be very grateful if someone helps me to solve this problem...

Card specifications:

/proc/pci:
  Bus  0, device   1, function  4:
    Multimedia audio controller: Silicon Integrated Systems [SiS] SiS PCI
Audio Accelerator (rev 1).
      IRQ 5.
      Master Capable.  Latency8.  Min Gnt=2.Max Lat$.
      I/O at 0x1000 [0x10ff].
      Non-prefetchable 32 bit memory at 0x38003000 [0x38003fff].

scanpci:
pci bus 0x0000 cardnum 0x01 function 0x04: vendor 0x1039 device 0x7018
 SiS  Device unknown

Linux initialization information:

...
PCI: Cannot allocate resource region 0 of device 00:01.4
...
PCI: Found IRQ 5 for device 00:01.6
PCI: Sharing IRQ 5 with 00:01.4
PCI: Sharing IRQ 5 with 00:0c.1
...

It shares IRQ with WinModem and with "CardBus bridge: Texas Instruments
PCI1420".

My kernel is  2.4.17, I recompiled sound modules with a lot of debug output.
When I use trident kernel module, it loads correctly, but the card is
absolutely silent.
Output from dmesg is as follows:

Trident 4DWave/SiS 7018/ALi 5451,Tvia CyberPro 5050 PCI Audio, version
0.14.9d, 23:57:36 Feb 24 2002
PCI: Found IRQ 5 for device 00:01.4
PCI: Sharing IRQ 5 with 00:01.6
PCI: Sharing IRQ 5 with 00:0c.1
trident: SiS 7018 PCI Audio found at IO 0x1000, IRQ 5
ac97_codec: AC97  codec, id: 0x0000:0x0000 (Unknown)
...

When I copy  .au file to /dev/dsp  or  'play' .wav file, it does not produce
any sound, writes a lot of debug information. I placed it at the end of my
message.

A few things to add:
  I had the Red Hat 7.0 and Mandrake 8.0, but their precompiled kernels and
sound setup utilities never worked too.
  I tried to use different Alsa trident modules, but they could not even
detect my sound card - very strange.


Full output from dmesg when I
1) modprobe trident module
2) copy  .au  file to /dev/dsp
3) play  .wav file with "play"

Trident 4DWave/SiS 7018/ALi 5451,Tvia CyberPro 5050 PCI Audio, version
0.14.9d, 23:57:36 Feb 24 2002
PCI: Found IRQ 5 for device 00:01.4
PCI: Sharing IRQ 5 with 00:01.6
PCI: Sharing IRQ 5 with 00:0c.1
trident: SiS 7018 PCI Audio found at IO 0x1000, IRQ 5
ac97_codec: AC97  codec, id: 0x0000:0x0000 (Unknown)
ac97_codec: wrote OSS mixer  0 (Primary ac97 register 0x02), left vol:67,
right vol:67: 0x1515 -> 0x0000
ac97_codec: wrote OSS mixer  4 (Primary ac97 register 0x18), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer  5 (Primary ac97 register 0x0a), left vol:67,
right vol:67: 0x000a -> 0x0000
ac97_codec: wrote OSS mixer  6 (Primary ac97 register 0x10), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer  7 (Primary ac97 register 0x0e), left vol: 0,
right vol: 0: 0x8000 -> 0x0000
ac97_codec: wrote OSS mixer  8 (Primary ac97 register 0x12), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer 12 (Primary ac97 register 0x1c), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer 14 (Primary ac97 register 0x16), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer 20 (Primary ac97 register 0x0c), left vol:67,
right vol:67: 0x000a -> 0x0000
ac97_codec: wrote OSS mixer 21 (Primary ac97 register 0x06), left vol:67,
right vol:67: 0x0015 -> 0x0000
ac97_codec: wrote OSS mixer 22 (Primary ac97 register 0x14), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: AC97  codec, id: 0x0000:0x0000 (Unknown)
ac97_codec: wrote OSS mixer  0 (Secondary ac97 register 0x02), left vol:67,
right vol:67: 0x1515 -> 0x0000
ac97_codec: wrote OSS mixer  4 (Secondary ac97 register 0x18), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer  5 (Secondary ac97 register 0x0a), left vol:67,
right vol:67: 0x000a -> 0x0000
ac97_codec: wrote OSS mixer  6 (Secondary ac97 register 0x10), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer  7 (Secondary ac97 register 0x0e), left vol: 0,
right vol: 0: 0x8000 -> 0x0000
ac97_codec: wrote OSS mixer  8 (Secondary ac97 register 0x12), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer 12 (Secondary ac97 register 0x1c), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer 14 (Secondary ac97 register 0x16), left vol:67,
right vol:67: 0x0a0a -> 0x0000
ac97_codec: wrote OSS mixer 20 (Secondary ac97 register 0x0c), left vol:67,
right vol:67: 0x000a -> 0x0000
ac97_codec: wrote OSS mixer 21 (Secondary ac97 register 0x06), left vol:67,
right vol:67: 0x0015 -> 0x0000
ac97_codec: wrote OSS mixer 22 (Secondary ac97 register 0x14), left vol:67,
right vol:67: 0x0a0a -> 0x0000
trident: Enable Loop Interrupts, globctl = 0x10000000
trident: called trident_set_dac_rate : rate = 8000
trident: open virtual channel 0, hard channel 63
trident: trident_write called, count = 4096
trident: allocated 32768 (order = 3) bytes at c0228000
trident: trident_play_setup, LBA = 0x00228000, Delta = 0x000002ab, ESO 0x00007fff, Control = 0x00001000
trident: prog_dmabuf(63), sample rate = 8000, format = 0, numfrag = 4,
fragsize = 8192 dmasize = 32768
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 4096
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: closing virtual channel 0, hard channel 63
trident: stop voice on channel 63, STOP_B = 0x00000000(addr:B8)
trident: disabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: called trident_set_dac_rate : rate = 8000
trident: open virtual channel 0, hard channel 63
trident: trident_ioctl, command =  1, arg = 0x4005f3f9
trident: trident_ioctl, command =  0, arg = 0x00000000
trident: stop voice on channel 63, STOP_B = 0x00000000(addr:B8)
trident: disabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: trident_ioctl, command =  4, arg = 0x00000000
trident: allocated 32768 (order = 3) bytes at c0228000
trident: trident_play_setup, LBA = 0x00228000, Delta = 0x000002ab, ESO 0x00007fff, Control = 0x00001000
trident: prog_dmabuf(63), sample rate = 8000, format = 0, numfrag = 4,
fragsize = 8192 dmasize = 32768
trident: trident_ioctl, command =  1, arg = 0x00000000
trident: trident_ioctl, command =  5, arg = 0x00000008
trident: stop voice on channel 63, STOP_B = 0x00000000(addr:B8)
trident: disabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: trident_ioctl, command =  3, arg = 0x00000000
trident: stop voice on channel 63, STOP_B = 0x00000000(addr:B8)
trident: disabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: trident_ioctl, command =  2, arg = 0x00005622
trident: stop voice on channel 63, STOP_B = 0x00000000(addr:B8)
trident: disabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: called trident_set_dac_rate : rate = 22050
trident: trident_write called, count = 8192
trident: trident_play_setup, LBA = 0x00228000, Delta = 0x0000075a, ESO 0x00007fff, Control = 0x00001000
trident: prog_dmabuf(63), sample rate = 22050, format = 0, numfrag = 4,
fragsize = 8192 dmasize = 32768
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 8192
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 8192
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 8192
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: trident_write called, count = 8192
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: playback schedule timeout, dmasz 32768 fragsz 8192 count 32768
hwptr 0 swptr 0
trident: enabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)
trident: start voice on channel 63, START_B = 0x00000000(addr:B4)
trident: closing virtual channel 0, hard channel 63
trident: stop voice on channel 63, STOP_B = 0x00000000(addr:B8)
trident: disabled IRQ on channel 63, AINTEN_B = 0x00000000(addr:DC)



That seems to be it. May be you could give me some advise.
Good-bye!



