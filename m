From: "Adam Watson" <linuxacolyte@hotmail.com>
Date: Mon, 22 Oct 2001 20:55:15 +0000
Subject: Re: Broken EMU10K1 Driver in 2.4.8+
Message-Id: <marc-linux-sound-100378427717504@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-100360658701245@msgid-missing>
In-Reply-To: <marc-linux-sound-100360658701245@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org





>Am Samstag, 20. Oktober 2001 21:36 schrieb Adam Watson:
> > I noticed this around 2.4.8 but thought it to be just a glitch or that 
>my
> > sound card had crapped out on me.  So I tested SBLive card under Windows
> > and it worked without a hitch.
> >
> > My problem:
> >
> > Kernel 2.4.12 recognizes the card but does not set the devices.  
>Following
> > the Sound-HOWTO, I ran every test that it requested.  It passed all 
>except
> > when I would cat /dev/sndstat.
> >
> > Output:
> >
> > cat: /dev/sndstat: No such device
>
>Hello!
>
>AFAIK, this is correct because the sndstat device was supposed to support 
>ISA
>cards. It doesn'T exist in 2.4.X kernels any more (at least not for PCI
>devices)
>
>
> > All device files are present and showing the right permissions. And the
> > kernel recognizes the card at every boot up?  Has something changed
> > recently that I need to reconfigure in my kernel?
> >
> > Please help,
> > Adam W.
>
>May be you have to set the mixer! I'm using a SB Live! Player 5.1 without 
>any
>problems once the mixer volumes are set.

I tried but no luck.  All my mixer settings are all the way up.  Is there 
another way to set them other than in X?


_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp

