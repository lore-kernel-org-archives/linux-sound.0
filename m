From: chin hooi chee <hcchin@csam.com.my>
Date: Sun, 09 May 1999 15:35:13 +0000
Subject: SB16 pnp
Message-Id: <marc-linux-sound-92629686810981@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have problem with configuring my Sound Card with kernel 2.0.30.
My sound card is Sound Blaster 16, I am not very sure wheter the sound card is plug & play or not. But I install it in Windows'95 it shows SB16 PnP.

So I use isapnptools v1.17 and config

% isapnp /etc/isapnp.conf

Board 1 has Identity d7 00 00 15 f5 24 00 8c 0e:  CTL0024 Serial No 5621 [checksum d7]
CTL0024/5621[0]{Audio               }: Ports 0x220 0x330 0x388; IRQ5 DMA1 DMA5 --- Enabled OK

% lsmod 

Module:        #pages:  Used by:
sound             10		0
ppp                5		0
slip               2		0
slhc               2	[ppp slip]	0
lp                 2		0

BUT
% cat /dev/sndstat

Sound Driver:3.5.4-960630 (Tue Mar 2 05:22:12 SGT 1999 root,

Config options: 0

Installed drivers: 

Card config: 

Audio devices:

Synth devices: NOT ENABLED IN CONFIG

Midi devices: NOT ENABLED IN CONFIG

Timers:

Mixers:

So I can't use the device, what is going wrong?
