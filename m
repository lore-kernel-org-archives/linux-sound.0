From: Tony Nugent <Tony.Nugent@usq.edu.au>
Date: Wed, 23 Jun 1999 04:36:59 +0000
Subject: Re: Sound problems...
Message-Id: <marc-linux-sound-93011173209187@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93009931600847@msgid-missing>
In-Reply-To: <marc-linux-sound-93009931600847@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue Jun 22 1999 at 16:57, Corris Randall wrote:

> I have a Omnibook 5500CS with RedHad 6.0 on it and I want to be able to
> play mp3's with mpg123.
> 
> Here are what windows reports as the settings:
> 
> DMA	01	Play
> DMA	00	Capture
> IRQ	05
> 
> IO	4232	0534-0537
> IO	OPL	0388-038B
> IO	SB	0220-022F
> 
> 
> MPU-401
> 
> IRQ	09
> IO	0330-0331
> 
> Here is my conf.modules:
> 
> alias sound cs4232
> pre-install	sound	insmod	sound	dmabuf=1
> alias	midi	opl3
> options opl3	io=0x388
> opeions	cs4232	io=0x534 irq=5 dma=1 dma2=0 mpuio=0x0330 mpuirq=9
> synthirq=-1 synthio=-1
> 
> It just doesn't do anything when I try to play something, and when I do
> sndconfig, it freezes everything up...
> 
> anyone?

Those settings are very likely for PnP, so you'll probably need to
comment out the sound-related lines in /etc/conf.modules and run
sndconfig again.  (Oh yeah, do this after rmmod'ing any sound
modules).

The sndconfig utility with RH6 will run the appropriate isapnptools
programs to set all this up for you.

If this isn't your problem, then it might be worth going to
http://www.redhat.com/support/ and following the hardware links to get
the latest and greatest sndconfig utilities.

Cheers
Tony
