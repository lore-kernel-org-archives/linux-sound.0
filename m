From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 25 Aug 1999 15:02:31 +0000
Subject: Re: mmap() better than read() fro streaming, Was: Re: Streaming disk I/O kills file buffering and ma
Message-Id: <marc-linux-sound-93559335100491@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93559158330469@msgid-missing>
In-Reply-To: <marc-linux-sound-93559158330469@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 25 Aug 1999, Alan Cox wrote:
> > As you suggested I do basically the following:
> > - ptr=mmap() at current offset with lenQ2k
> > - memcpy(targetbuffer,ptr,len)   (I must use the memcpy since targetbuffer has
> > to   be mlocked() since the audio-playing thread can't tolerate pagefaults
> > because   it runs in a low-latency cycle.
> > - munmap(ptr,len)
> 
> You can do 
> 	ptr=mmap(blah)
> 	mlock(ptr, ...)
> 	munmap(ptr, len)

will mlock() automatically cause all pages to be read from the file ?
(I don't think)

But since I already do an mlockall() at the beginnig, there is no need of
additional mlock()s

I had an additional idea: mmap()ing the data directly into the circular-buffer
and dirty the pages through writing one word for each page, it might be a
bit faster, because you avoid a memcpy() , but
the problem is that since the audio thread acesses this buffer, I have to
implement some communication to signal the disk thread to unmap the region,
or alternatively keep track of previously mapped regions in the disk thread,
which makes things more complicated.
I'm dealing with a data rate of about 5MB/sec (from disk), therefore the main
bottleneck is the disk not the memcpy() performance.
But I will try to mmap()/munmap() tracking and mmap() directly into the
circular-buffer, let's see if I can lower the CPU load of an additional 1-2%.
:-)

BTW, does anyone know the best method to measure the real % of CPU idle time,
since top is pretty unreliabe.

> 
> > Does anyone know if there it/will be a way to do unbuffered mmap()  ?
> > I think streaming apps would benefit quite a bit from this.
> 
> mmap requires buffering - you are sharing the page with the system page
> cache. If you mean you want an mgoaway() to go with munmap() thats what
> madvise() provides on some other systems but not Linux yet

This will be nice, similar to O_DIRECT performance,
I will use whatever comes first. 
:-) 

regards,
Benno.
