From: D Sen <dsen@research.att.com>
Date: Sat, 12 Dec 1998 15:24:14 +0000
Subject: Re: help needed for cs423x chips
Message-Id: <marc-linux-sound-91351107303897@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91325015828495@msgid-missing>
In-Reply-To: <marc-linux-sound-91325015828495@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

If you are running Window$, you can use the control panel to find out the
IRQ/IO Port/DMA. Once you have that info, you have a few different choices
to get sound going. Look at http://www.levien.com/tp600.html for a
description.

Good luck,
DSs

On Sat, 12 Dec 1998, Tony Nugent wrote:

> On Tue Dec 08 1998 at 23:49, "moc liamtoh" wrote to linux-sound:
> 
> > alright, i cant get my sound to work. i have an aopen MB with built on
> > sound and video. sound chip says cs4235 on the chip but isapnp detects as
> > 4236. i have tried different settings with isapnp and different modules
> > for sound support....i have also tried without modules and just ocmpiling
> > into kernel...i have tried configuration manager alone and with isapnp
> > and modules...basically i was trying about everything i could
> > think...only problem being that i dont know that much yet and therefore
> > am running out off ideas...plus it is taking time to learn stuff to try
> > different things....not that i mind the knowledge but i would like to get
> > sound working quickly =)
> 
> The trick seems to be in getting the dma/irq settings tweaked just right.
> 
> I have a Dell Latitude CP (laptop) here with such a beast in it.  It took
> me ages to get the sound going with the kernel sound driver - but I finally
> did it :)
> 
> It's running RedHat 5.2 (standard kernel from the install), but I have no
> idea how "generic" this solution is.
> 
> The most important thing is to get /etc/conf.modules right.  This is what I
> have in it...
> 
> 
> # turn off unwanted net stuff...
> alias net-pf-3 off	# no ax25
> alias net-pf-4 off	# no ipx
> alias net-pf-5 off	# no appletalk
> alias net-pf-6 off	# no netrom
> # for the CDROM...
> alias iso9660 isofs
> # sound driver
> alias sound cs4232
> options -k cs4232 io=0x530 dma=1 dma2=0 irq=5
> # no midi yet :(
> 
> 
> This works for the audio driver, but I have yet to get the midi to work.
> 
> (Any hints on how to do this would be most appreciated - please Cc any
> replies from linux-laptop as I'm not subscribed to that list, thanx).
> 
> Cheers
> Tony
> 
