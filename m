From: Corris Randall <corris@acc.com>
Date: Tue, 22 Jun 1999 23:57:49 +0000
Subject: Sound problems...
Message-Id: <marc-linux-sound-93009931600847@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I have a Omnibook 5500CS with RedHad 6.0 on it and I want to be able to
play mp3's with mpg123.  

Here are what windows reports as the settings:

DMA	01	Play
DMA	00	Capture
IRQ	05

IO	4232	0534-0537
IO	OPL	0388-038B
IO	SB	0220-022F


MPU-401

IRQ	09
IO	0330-0331

Here is my conf.modules:

alias sound cs4232
pre-install	sound	insmod	sound	dmabuf=1
alias	midi	opl3
options opl3	io=0x388
opeions	cs4232	io=0x534 irq=5 dma=1 dma2=0 mpuio=0x0330 mpuirq=9
synthirq=-1 synthio=-1

It just doesn't do anything when I try to play something, and when I do
sndconfig, it freezes everything up...

anyone?

-Corris

--
Corris Randall
UNIX Systems Administrator
Ericsson, Datacom Networks and IP Services
Access Product Unit
805-961-0654
--
