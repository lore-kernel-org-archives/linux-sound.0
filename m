From: "Michael B. Trausch" <mtrausch@wcnet.org>
Date: Sun, 14 Mar 1999 20:04:42 +0000
Subject: Re: awe64 not initializing on 2.2.2
Message-Id: <marc-linux-sound-92144173622023@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92139407200837@msgid-missing>
In-Reply-To: <marc-linux-sound-92139407200837@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Some .WAV files (most notably any that were introduced in the Windows 95
era) don't play at all-- they're just garble.

And many, if they're not garble, they play at 1/2 the speed of normal
playback.  Solution:  Get a program that supports these files.

I'm not sure where to look, but I'm sure that Freshmeat wouldn't be a bad
place to start.

	- Mike

--------------------------------------------------------------------------
Michael B. Trausch                                      mtrausch@wcnet.org
http://www.wcnet.org/~mtrausch                100% Microsoft Free on a PC!
--------------------------------------------------------------------------

On Sun, 14 Mar 1999, Eric Tork wrote:

ET>Date: Sun, 14 Mar 1999 13:44:37 -0800
ET>From: Eric Tork <etork@inetnebr.com>
ET>To: linux-sound@vger.rutgers.edu
ET>Subject: Re: awe64 not initializing on 2.2.2
ET>
ET>As luck would have it, that did the trick.  The module loads, and all
ET>is fine.......but one problem remains.  /dev/audio outputs garble when I
ET>send something to it, like a wav file.  KDE's systems sounds all come
ET>through clear, so I assume that it sends its output through something
ET>else?  Is there something that needs to be done with /dev/audio?
ET>
ET>  btw, this is a redhat 5.1 box with an isa pnp soundblaster 64.
ET>
ET>Cornelius Creedon wrote:
ET>> 
ET>> this message has occured to me in the past due to inaccurate or
ET>> insufficient options to the module.
ET>> are you specifying io, irq, dma, etc?
ET>> ie "modprobe sb io=0x220 irq=5 dma=1 dma16=5" or whatever...
ET>> if so do these match up with the card's config?
ET>> sounds like a pci card, right? does it appear in /proc/pci?
ET>> 
ET>> -cc
ET>> 
ET>> On Sun, 14 Mar 1999, Eric Tork wrote:
ET>> 
ET>> > I'm having quite a runaround with getting my awe64 to work with a
ET>> > 2.2.2 kernel.  This is what I get when I run modprobe:
ET>> >
ET>> >   /lib/modules/2.2.2/misc/sb.o: init_module: Device or resource busy
ET>> >
ET>> >   if a cat my /dev/sndstat, there's no installed driver, no config
ET>> > options, nada.
ET>> >
ET>> >    I upgraded everything that I needed to upgrade in the Changes file
ET>> > for the kernel, making sure that my modutils was properly installed.
ET>> > Insmod -V returns the correct version number (2.1.121)  I'm at my wit's
ET>> > end.
ET>> >
ET>> >   Thanx in advance
ET>> >    - E
ET>> > --
ET>> > __________________________________
ET>> > Eric A. Tork
ET>> > "The Man Behind the Machine"
ET>> > Network Technician, Central Community College
ET>> > Hastings, Ne.   (402) 461-2576
ET>> >
ET>> > "The only thing we learn from history
ET>> > is that we don't learn from history"
ET>> > ___________________________________
ET>> >
ET>
ET>-- 
ET>__________________________________
ET>Eric A. Tork
ET>"The Man Behind the Machine"
ET>Network Technician, Central Community College
ET>Hastings, Ne.   (402) 461-2576
ET>
ET>"The only thing we learn from history
ET>is that we don't learn from history"
ET>___________________________________
ET>
