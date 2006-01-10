From: Hannu Savolainen <hannu@opensound.com>
Date: Tue, 10 Jan 2006 14:05:00 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601101550390.24146@zeus.compusonic.fi>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.LNX.4.61.0601081007550.9470@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081007550.9470@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 10 Jan 2006, Jaroslav Kysela wrote:

> > 
> > Then you can include a libOSSlib.o library in ALSA with all the OSS 
> > emulation stuf inside.
> 
> You should do the clear statement that the direct using of syscalls is not 
> recommented for application developers. Unfortunately at this time, I 
> admit, it would be very difficult to change the existing applications.
Sorry. That breaks backward compatibility with systems that don't have 
libOSSlib (all current and past Linux distros, all BSD variants, 
everything but systems with our official OSS package installed). Such 
statement can be added in 2010 but provided that all Linux distros and 
other environments having OSS compatible implementations add the osslib_* 
routines within this year.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
OH2GLH QTH: Karkkila, Finland LOC: KP20CM
