From: Cornelius Creedon <neil@box1.staller.sunysb.edu>
Date: Sun, 14 Mar 1999 12:17:34 +0000
Subject: Re: awe64 not initializing on 2.2.2
Message-Id: <marc-linux-sound-92141443808574@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92139407200837@msgid-missing>
In-Reply-To: <marc-linux-sound-92139407200837@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


this message has occured to me in the past due to inaccurate or
insufficient options to the module.
are you specifying io, irq, dma, etc?
ie "modprobe sb io=0x220 irq=5 dma=1 dma16=5" or whatever...
if so do these match up with the card's config?
sounds like a pci card, right? does it appear in /proc/pci?

-cc

On Sun, 14 Mar 1999, Eric Tork wrote:

> I'm having quite a runaround with getting my awe64 to work with a
> 2.2.2 kernel.  This is what I get when I run modprobe:
> 
>   /lib/modules/2.2.2/misc/sb.o: init_module: Device or resource busy
> 
>   if a cat my /dev/sndstat, there's no installed driver, no config
> options, nada.  
> 
>    I upgraded everything that I needed to upgrade in the Changes file
> for the kernel, making sure that my modutils was properly installed. 
> Insmod -V returns the correct version number (2.1.121)  I'm at my wit's
> end.
> 
>   Thanx in advance
>    - E
> -- 
> __________________________________
> Eric A. Tork
> "The Man Behind the Machine"
> Network Technician, Central Community College
> Hastings, Ne.   (402) 461-2576
> 
> "The only thing we learn from history
> is that we don't learn from history"
> ___________________________________
> 
