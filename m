From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 25 Aug 1999 14:21:08 +0000
Subject: Re: mmap() better than read() fro streaming, Was: Re: Streaming disk I/O kills file buffering and ma
Message-Id: <marc-linux-sound-93559158330469@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> As you suggested I do basically the following:
> - ptr=mmap() at current offset with lenQ2k
> - memcpy(targetbuffer,ptr,len)   (I must use the memcpy since targetbuffer has
> to   be mlocked() since the audio-playing thread can't tolerate pagefaults
> because   it runs in a low-latency cycle.
> - munmap(ptr,len)

You can do 
	ptr=mmap(blah)
	mlock(ptr, ...)
	munmap(ptr, len)

> Does anyone know if there it/will be a way to do unbuffered mmap()  ?
> I think streaming apps would benefit quite a bit from this.

mmap requires buffering - you are sharing the page with the system page
cache. If you mean you want an mgoaway() to go with munmap() thats what
madvise() provides on some other systems but not Linux yet
