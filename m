From: Kronos <kronos@hefnerlabs.com>
Date: Sat, 27 Apr 2013 18:32:16 +0000
Subject: Trying to get surround sound working on my Dell L702x Laptop
Message-Id: <517C19B0.6000808@hefnerlabs.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a Dell L702x Laptop with an Intel Cougar Point HD Audio 
soundcard. In windows you are able to put it in analog surround sound 
mode - that is you have 3 3.5mm jacks running as output with 2 channels 
each. I am trying to replicate this behaviour so I can use the card as a 
6 channel output device with jack audio and ardour


(my setup works in stereo mode - now if i could just get the card to 
show 6 channels instead of just 2 - heck even 4 channels would be an 
improvement)
What do I need to do to make this work?

relevant sound routing:
soundcard > alsa > jack > aurdour  < pulse

  (I basically route all my sound through aurdor for effects processing 
- then out to the soundcard)



I'm running on Fedora 18
Dell XPS 17 L702x
i7 2670qm
16GB ram
265GB ssd

# lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation 2nd Generation Core 
Processor Family DRAM Controller [8086:0104] (rev 09)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200/2nd Generation 
Core Processor Family PCI Express Root Port [8086:0101] (rev 09)
00:02.0 VGA compatible controller [0300]: Intel Corporation 2nd 
Generation Core Processor Family Integrated Graphics Controller 
[8086:0126] (rev 09)
00:16.0 Communication controller [0780]: Intel Corporation 6 Series/C200 
Series Chipset Family MEI Controller #1 [8086:1c3a] (rev 04)
00:1a.0 USB controller [0c03]: Intel Corporation 6 Series/C200 Series 
Chipset Family USB Enhanced Host Controller #2 [8086:1c2d] (rev 05)
00:1b.0 Audio device [0403]: Intel Corporation 6 Series/C200 Series 
Chipset Family High Definition Audio Controller [8086:1c20] (rev 05)
00:1c.0 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series 
Chipset Family PCI Express Root Port 1 [8086:1c10] (rev b5)
00:1c.1 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series 
Chipset Family PCI Express Root Port 2 [8086:1c12] (rev b5)
00:1c.3 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series 
Chipset Family PCI Express Root Port 4 [8086:1c16] (rev b5)
00:1c.4 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series 
Chipset Family PCI Express Root Port 5 [8086:1c18] (rev b5)
00:1c.5 PCI bridge [0604]: Intel Corporation 6 Series/C200 Series 
Chipset Family PCI Express Root Port 6 [8086:1c1a] (rev b5)
00:1d.0 USB controller [0c03]: Intel Corporation 6 Series/C200 Series 
Chipset Family USB Enhanced Host Controller #1 [8086:1c26] (rev 05)
00:1f.0 ISA bridge [0601]: Intel Corporation HM67 Express Chipset Family 
LPC Controller [8086:1c4b] (rev 05)
00:1f.2 SATA controller [0106]: Intel Corporation 6 Series/C200 Series 
Chipset Family 6 port SATA AHCI Controller [8086:1c03] (rev 05)
00:1f.3 SMBus [0c05]: Intel Corporation 6 Series/C200 Series Chipset 
Family SMBus Controller [8086:1c22] (rev 05)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation Device 
[10de:1246] (rev ff)
03:00.0 Network controller [0280]: Intel Corporation Centrino Wireless-N 
1030 [Rainbow Peak] [8086:008a] (rev 34)
04:00.0 USB controller [0c03]: NEC Corporation uPD720200 USB 3.0 Host 
Controller [1033:0194] (rev 04)
0a:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. 
RTL8111/8168 PCI Express Gigabit Ethernet controller [10ec:8168] (rev 06)


# uname -a
Linux localhost 3.8.5-201.fc18.x86_64 #1 SMP Thu Mar 28 21:01:19 UTC 
2013 x86_64 x86_64 x86_64 GNU/Linux


# lspci -nn |grep Audio
00:1b.0 Audio device [0403]: Intel Corporation 6 Series/C200 Series 
Chipset Family High Definition Audio Controller [8086:1c20] (rev 05)

# lspci -vnn -d 8086:1c20
00:1b.0 Audio device [0403]: Intel Corporation 6 Series/C200 Series 
Chipset Family High Definition Audio Controller [8086:1c20] (rev 05)
     Subsystem: Dell Device [1028:0571]
     Flags: bus master, fast devsel, latency 0, IRQ 56
     Memory at f3c00000 (64-bit, non-prefetchable) [sizeK]
     Capabilities: [50] Power Management version 2
     Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
     Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
     Capabilities: [100] Virtual Channel
     Capabilities: [130] Root Complex Link
     Kernel driver in use: snd_hda_intel

# rpm -qa |grep alsa
alsa-lib-1.0.26-2.fc18.i686
alsa-plugins-pulseaudio-1.0.26-2.fc18.x86_64
alsa-tools-firmware-1.0.26.1-1.fc18.x86_64
alsa-lib-1.0.26-2.fc18.x86_64
alsa-utils-1.0.26-1.fc18.x86_64
alsa-firmware-1.0.25-2.fc18.noarch
alsa-lib-devel-1.0.26-2.fc18.x86_64
wine-alsa-1.5.24-1.fc18.x86_64
bluez-alsa-4.101-6.fc18.x86_64

# rpm -qa |grep jack
jack-audio-connection-kit-dbus-1.9.9.5-1.fc18.x86_64
qjackmmc-4-5.fc18.x86_64
qjackctl-0.3.9-3.fc18.x86_64
jack-audio-connection-kit-example-clients-1.9.9.5-1.fc18.x86_64
jack-keyboard-2.7.1-2.fc18.x86_64
jack-audio-connection-kit-1.9.9.5-1.fc18.x86_64
pulseaudio-module-jack-2.1-6.fc18.x86_64
jack-audio-connection-kit-devel-1.9.9.5-1.fc18.x86_64
jack-rack-1.4.7-12.fc18.x86_64
vlc-plugin-jack-2.0.5-5.fc18.x86_64
jack_capture-0.9.61-2.fc18.x86_64

