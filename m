From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 27 Oct 1999 18:03:00 +0000
Subject: Re: mmap()/mlockall()/read()
Message-Id: <marc-linux-sound-94105784218465@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94095888330340@msgid-missing>
In-Reply-To: <marc-linux-sound-94095888330340@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I agree no all topics,

using mlockall(MCL_CURRENT|MCL_FUTURE) on a low mem box,
and trying to mmap a large file would simply not work.

I would definitively use MAP_UNLOCKED on Linux,
becaue it could give us the best possible performance.
(and maybe provide a fallback solution for other OSes) 

I think the best fallback solution is the following (but not 100% reliable
in the case of syscalls):
mlock(MCL_CURRENT);
mlock() malloec()ed aread
( or is there a better way to do this ?)


but strange,
MAP_UNLOCKED seems to not exist on my 2.2.12 kernel !!
I grepped through the entire kernel source and include files but
nothing !!!!!

in /usr/include/bits/mman.h
there are some flags:
----
/* These are Linux-specific.  */
#ifdef __USE_MISC
# define MAP_GROWSDOWN  0x0100          /* Stack-like segment.  */
# define MAP_DENYWRITE  0x0800          /* ETXTBSY */
# define MAP_EXECUTABLE 0x1000          /* Mark it as an executable.  */
# define MAP_LOCKED     0x2000          /* Lock the mapping.  */
# define MAP_NORESERVE  0x4000          /* Don't check for reservations.  */
#endif
----

no MAP_UNLOCKED present ...
is this a 2.3.x feature ?


> > What I'm trying to say: read() doesn't work better than mmap() in terms of
> > behaviour during swapping, because the kernel could easily swap out
> > your buffer where you read() in the data.
> 
> Actually, the last time I tested this extensively (with a 2.0.x kernel
> I think), mmap() was much better performing than read()..for a while.
> When sequential accessing of a file got to a point around my RAM
> limits, the disk activity became insane.  Maybe things are better now.
> 
> > I will add a feature to the pagefaulter thread which uses mlock()/munlock if
> > root privileges are available, so that even
> > Eric is satisfied.
> > :-)
> 
> Eric is hard to satisfy. :)

You are not the only !
:-)

> 
> > PS: mlockall(MCL_CURRENT|MCL_FUTURE) is a bad idea because when you do the
> > mmap() of the large file the process tries to load all into mem,and my scheme
> > would not work. Better to use mlockall(MCL_CURRENT) and mlock()/munlock()
> > areas on demand.
> 
> This is a useful solution in some circumstances.  However, it means I
> can't use malloc()/new, may have trouble with shared libraries or
> dynamically loaded plugins and have to worry about reserving stack
> space.  It's not the way I want to work.

agreed for shared libs, but if you don't make any strange syscalls ,
I think there are not very much problems.
As for malloc : just mlock() the area after the allocation.

regards,
Benno.
