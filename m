From: Scott Murray <scott@spiteful.org>
Date: Sun, 12 Mar 2000 04:12:15 +0000
Subject: Re: Sound problems in 2.3.50
Message-Id: <marc-linux-sound-95283432517668@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95272621612831@msgid-missing>
In-Reply-To: <marc-linux-sound-95272621612831@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 10 Mar 2000, Dave Caswell wrote:

> 
> I've got no sound in 2.3.50.
> 
> My Toshiba notebook has a OPL3-SA3 chip which was working with
> kernel 2.3.49 sound drivers built into the kernel.  
> 
> With 2.3.50, none of the sound devices including /dev/sndstat worked.
[snip]

Well, Christoph Hellwig is apparently adapting the sound drivers to the
newer module initialization scheme, which should make it easier to just
configure drivers into the kernel.  An additional change was the removal
of /dev/sndstat and /proc/sound, so that explains that part of the problem.

> So, is there a new configuration file that I need to tweak? Or is
> something broken?

Well, from what I can tell, your opl3sa2 append line for lilo.conf should
have gotten things working, but there was some talk of general sound issues
with 2.3.50 on linux-kernel.  Could you try 2.3.51 and see if that works?
It contains a bunch more patches to the sound system.

Scott



-- 
======================================Scott Murray                                        email: scott@spiteful.org
http://www.interlog.com/~scottm                       ICQ: 10602428
-----------------------------------------------------------------------------
     "Good, bad ... I'm the guy with the gun." - Ash, "Army of Darkness"
