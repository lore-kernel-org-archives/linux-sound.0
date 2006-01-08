From: Hannu Savolainen <hannu@opensound.com>
Date: Sun, 08 Jan 2006 22:47:22 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601090010090.31763@zeus.compusonic.fi>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.LNX.4.61.0601081007550.9470@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081007550.9470@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 8 Jan 2006, Jaroslav Kysela wrote:

> I don't think so. The library can do such conversions (and alsa-lib does) 
> quite easy. If we have a possibility to remove the code from the kernel 
> space without any drawbacks, then it should be removed. I don't see any 
> advantage to have such conversions in the kernel.
The advantage is that you don't need any libraries. 
 
> Bad decision. Again, I feel you're hidding the flexibility against
> your feeling that the kernel API is the best enough for applications.
> Imagine that the API redirection is or can be also flexible for your 
> future development.
Past 13 years have proven that kernel only API has been very successfull.
There are 1000's of applications supporting it and being a kernel 
only API has not caused any problems. If something cannot be implemented 
in kernel (like effect plugins) then a library can be implemented on top 
of the OSS kernel API which has already been done by other developers.
 
Right. Emulating OSS API in userland is difficult in this way. I just 
couldn't imagine that somebody wants to do that. It can be considered as 
my fault.

> > Actually I have forgotten what was the reason why you wanted to get the 
> > OSS API emulated in userland rather than using the previous snd-oss 
> > module (which worked well other than the API version you emulated was too 
> > old)?
> 
> Stream mixing. We have user space solution while you insist to put this 
> code to kernel. Simply, we need to go through our library.
I wonder if foing mixing (summing) of streams in kernel really causes more 
problems than emulating a kernel API in user space.

> >From the end user perspective, don't you think that having an opportunity 
> to change the API entry point from one to multiple (user space library - 
> preferred, direct kernel space - last resort) is more flexible for 
> developers and users? Please, consider this question without any flames 
> line which API is better and what's better for audio subsystem architects 
> and what's better for your commercial work.
It's too late to discuss about this. This decision could have been made in 
1992-1993 before large number of applications were already written. 
Unfortunately the whole issue was raised just recently.

There has been definitions for routines like osslib_open(), etc in 
soundcard.h for years. Also the libOSSlib.so library contains such 
routines. If an OSS application is compiled without -DOSSLIB then they are 
defined as open, etc. Unfortunately this version of soundcard.h was not 
accepted by the kernel OSS maintainers so the stock Linux version doesn't 
have these definitions.

If you like to get OSS apps to go through this library API you can do the 
following:

- Get the latest soundcard.h from our OSS package to be included in the 
stock kernel.
- Do the same for libOSSlib (sources shipped with OSS).
- Tell all OSS developers to change all OSS system calls to use their 
osslib_ counterparts. And to recompile against the latest soundcard.h
with -DOSSLIB. Make sure all distributions have done the changes before 
that.

Then you can include a libOSSlib.o library in ALSA with all the OSS 
emulation stuf inside.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
OH2GLH QTH: Karkkila, Finland LOC: KP20CM
