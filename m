From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 25 Aug 1999 14:33:00 +0000
Subject: mmap() better than read() fro streaming, Was: Re: Streaming disk I/O kills file buffering and makes
Message-Id: <marc-linux-sound-93559157930421@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93559158330469@msgid-missing>
In-Reply-To: <marc-linux-sound-93559158330469@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 
> > I'm afraid, if we want that Linux will be a good multimedia OS, this is a
> > _STRONGLY_NEEDED_  feature.
> 
> debatable.  first, you mean "media _producer_ OS", since media clients
> do not generally mess with this kind of bandwidth.  next, you're also 
> assuming that media production apps should be naive about how they do IO.
> for instance, have you tried using mmap, with explicit munmap's on data
> that you're done with?  or played with some of the parameters on the 
> current code that attempts to prevent cache flushing?

I adapted my file streaming app to use mmap() instead of using read() to read
chunks of up  to 512k into a buffer.
As you suggested I do basically the following:
- ptr=mmap() at current offset with lenQ2k
- memcpy(targetbuffer,ptr,len)   (I must use the memcpy since targetbuffer has
to   be mlocked() since the audio-playing thread can't tolerate pagefaults
because   it runs in a low-latency cycle.
- munmap(ptr,len)

I must say it works quite well, and firing up apps, or accessing the KDE menus,
is faster, 
launching my famous "xterm" still produces disk accesses, 
(cached files are still trown away after a while, but not so agressively like
in the read() case )
but it's now faster and the system seems more usable,
especially painting into a GIMP window, since gimp uses the hd quite a lot.
I'm now able to stream about 50 mono audio tracks (44kHz 16bit) from my
IBM 16GB EIDE UDMA disk, while browsing the web, very fun !
Of course if I copy a large file in background, sooner of later, I get a
ring-buffer overrun , because the streaming-app and the cp must share disk
bandwidth.  ( I'm missing SGI's  guaranteed rate I/O of XFS , sigh .. :-)  )  

again , thank you for your suggestion !
It was a bit tricky to mess with all this page aligns, and special cases,
but it pretty fun to code ! ( got nice segfaults at the beginning  :-) )

> 
> in short, cache flushing is well-understood and media production is just
> one minor case where it comes up.  hinting (via O_ flags, madvise, ioctl)
> are the right way to turn up the agressiveness of the existing free-behind
> and pre-fetching mechanisms.

Does anyone know if there it/will be a way to do unbuffered mmap()  ?
I think streaming apps would benefit quite a bit from this.
> 
> regards, mark hahn.

regards,
Benno.
