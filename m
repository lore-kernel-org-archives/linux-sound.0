From: Emil Stephan <ste@esqhen.su.eunet.de>
Date: Wed, 09 Sep 1998 19:40:08 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90539711302957@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello Dave,

Dave Wreski wrote:
> ...
> 
> After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
> complain, but there was also no information available in the normal /proc files,
> such as /proc/{interrupts,dma,ioports} etc..  Should there be, or only after the
> sound module is installed?

In /proc You really see nothing, if the driver is not loaded. Same with
other
modules here, e.g. those loaded by kerneld.

But did You use pnpdump to create a prototype isapnp.conf or did You use
the one,
that came with Your Linux distribution ?

> 
> > You can find Your Win95 config in a file named CTPNP.CFG in the Windows
> > directory and set the values accordingly to avoid resource conflicts.
> 
> Umm... yeah.. No windows here..
> 
> > Remember that you have to download a sound font bank to the Wave table
> > with a command like this:
> >
> > /usr/local/bin/sfxload
> > /win95/Programme/Creative/ctsnd/sfbank/synthgs.sbk

Oh Sorry, these are only used if Your AWE64 has RAM on board. These come
with
the win95 drivers of the card. But since You have no Win95, they aren't
installed.
Have a look at the AWE drivers web site:
http://bahamut.mm.t.u-tokyo.ac.jp/~iwai/awedrv/

You'll find the sources for sfxload there and some links to sound banks,
i hope.

Another fine site for linux sound is:
http://www.bright.net/~dlphilp/linux_soundapps.html

There are many links to sound apps for Linux.

> Where can I find these necessary files?
> 
> Any idea why an RPM hasn't been created for the SBAWE64 yet?  I would think this
> methodical process would be easy to create an RPM for...
> 
> Thanks,
> Dave

Bye, Emil.
-- 
--------------------------------------------------
Emil Stephan, Marktplatz 39, 53773 Hennef, Germany
voice: +49-2242-84438

Accelerate Windows: 9.81 m/sec^2 would be adequate
