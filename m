From: Rolf Fokkens <rolf@flits102-126.flits.rug.nl>
Date: Sun, 06 Dec 1998 14:16:13 +0000
Subject: ESS 1887 & ESS chipsets in general
Message-Id: <marc-linux-sound-91298307728954@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a DEC PC 5500 with an onboard ESS1887 sound chip. The Linux
sounddriver recognizes this chip as a 1688 chip.

Though the ESS1887 has several controls for recording levels on WinNT
(Mic, Line, Midi...) it has not a single one on Linux. Even the hardware
documentation states that these registers exist, but the Linux driver
apparently doesn't do anything with them. I managed to patch the driver
into having a RECLEV control which controlled the recording level of the
CD input, but now I want to know how te make it work in general.

* Are people taking care of this already?
* Who has an ESS chip and cannot control recording levels on Linux too?
* What recording levels do exist on the 1688 chip (on WinNT, Win95
etc.)?
* Can anyone send me the register descriptions of the 1688 chip?
* Please send me register descriptions of whatever ESS soundchips!
* I have some 1887 docu, but it's "preliminary". Can anyone send me more
technical documentation about it?
* I looked into the OSS api. I can't figure out how recording levels of
in puts are controlled for several devices, independent of
"playback" levels. Any Ideas?

Thanks,

Rolf.
