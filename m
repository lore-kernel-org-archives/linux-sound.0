From: Eric Tork <etork@inetnebr.com>
Date: Sun, 14 Mar 1999 21:44:37 +0000
Subject: Re: awe64 not initializing on 2.2.2
Message-Id: <marc-linux-sound-92144142921887@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92139407200837@msgid-missing>
In-Reply-To: <marc-linux-sound-92139407200837@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

As luck would have it, that did the trick.  The module loads, and all
is fine.......but one problem remains.  /dev/audio outputs garble when I
send something to it, like a wav file.  KDE's systems sounds all come
through clear, so I assume that it sends its output through something
else?  Is there something that needs to be done with /dev/audio?

  btw, this is a redhat 5.1 box with an isa pnp soundblaster 64.

Cornelius Creedon wrote:
> 
> this message has occured to me in the past due to inaccurate or
> insufficient options to the module.
> are you specifying io, irq, dma, etc?
> ie "modprobe sb io=0x220 irq=5 dma=1 dma16=5" or whatever...
> if so do these match up with the card's config?
> sounds like a pci card, right? does it appear in /proc/pci?
> 
> -cc
> 
> On Sun, 14 Mar 1999, Eric Tork wrote:
> 
> > I'm having quite a runaround with getting my awe64 to work with a
> > 2.2.2 kernel.  This is what I get when I run modprobe:
> >
> >   /lib/modules/2.2.2/misc/sb.o: init_module: Device or resource busy
> >
> >   if a cat my /dev/sndstat, there's no installed driver, no config
> > options, nada.
> >
> >    I upgraded everything that I needed to upgrade in the Changes file
> > for the kernel, making sure that my modutils was properly installed.
> > Insmod -V returns the correct version number (2.1.121)  I'm at my wit's
> > end.
> >
> >   Thanx in advance
> >    - E
> > --
> > __________________________________
> > Eric A. Tork
> > "The Man Behind the Machine"
> > Network Technician, Central Community College
> > Hastings, Ne.   (402) 461-2576
> >
> > "The only thing we learn from history
> > is that we don't learn from history"
> > ___________________________________
> >

-- 
__________________________________
Eric A. Tork
"The Man Behind the Machine"
Network Technician, Central Community College
Hastings, Ne.   (402) 461-2576

"The only thing we learn from history
is that we don't learn from history"
___________________________________
