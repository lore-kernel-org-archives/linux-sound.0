From: Leonard Michlmayr <lmichlma@radon.mat.univie.ac.at>
Date: Wed, 24 Feb 1999 08:30:33 +0000
Subject: MSS / wrong device in `/dev/sndstat' ?
Message-Id: <marc-linux-sound-91984539403691@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


 After many trials i didn't bring sound to work. I hope that someone is
able to help me.

 I have a Microsoft Windows Sound System card *ducks* and i cannot play
any sounds by piping something to /dev/audio and i hear some very silent
noise if i pipe soume sound to /dev/dsp.

 Did i miss something about configuring the volume, or did something else
go wrong ?

Details:
--------

 I have compiled the 2.2.2 kernel without module support and with the
MSS/WSS support enabled (0x530, IRQ 10, DMA 1, secondary DMA 0)
(using `make xconfig')

 When booting the kernel reports to detect MSS at 0x534, but /dev/sndstat
reports a Compaq Deskpro XL at 0x530 irq 10 drq 1,1

 Recording sound with `dd bs=8k count=4 if=/dev/audio of=test.au' works,
as far as i can say without hearing test.au

 Sound works fine with Windows.

Thank You !

Leonard Michlmayr
