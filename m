From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 23 Aug 1999 20:20:40 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93544141720497@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Mark Hahn wrote:

> > Is it hard to implement unbuffered disk I/O in Linux (at least for reading) on
> 
> this is basically an oxymoron: apps read only from buffers.  the issue is 
> getting the kernel to realize that you're never going to read old buffers
> again.  if you want to help, read the code, don't just complain.

Unfortunately I don't (yet) started kernel hacking, therefore the only thing
I can to now is testing/benchmarking using userspace apps.

> 
> > Another solution could be limiting file buffering on a per-process basis,
> > If the streaming app can tell to the kernel "give me only 4MB of your buffer
> > cache", then the rest of the apps will still get a chunk of the buffer cache so
> 
> yuck!  this would be a grotesque tuning nightmare, and would hold the promise
> of utterly trashing performance in unexpected ways.

This was only an idea I had, it may be dirty but it would work, without
trashing.

 > 
> > I'm afraid, if we want that Linux will be a good multimedia OS, this is a
> > _STRONGLY_NEEDED_  feature.
> 
> debatable.  first, you mean "media _producer_ OS", since media clients
> do not generally mess with this kind of bandwidth.

Ok, playing streaming an AVI video is low-bandwidth , and will not
trash performance of the linux file buffering system.
But what about streaming a DVD movie from the harddisk ?
A DVD movie is made up of GBs of data, and playing back a DVD is not
a media_producer_OS task, it will be very common on every desktop.

>  next, you're also 
> assuming that media production apps should be naive about how they do IO.
> for instance, have you tried using mmap, with explicit munmap's on data
> that you're done with?  or played with some of the parameters on the 
> current code that attempts to prevent cache flushing?

Ah ! thank you for this suggestion,  I will try this mmap() method,
but it is not a very portable way to do disk I/O and makes things a bit more
complicated.
I'm predicting that I will not get much benefits of mmap() due to Murphy's law.
:-) 

Which parameters do you mean ?  /proc/sys/* ?
I did not found anything useful here.

> 
> in short, cache flushing is well-understood and media production is just
> one minor case where it comes up.  hinting (via O_ flags, madvise, ioctl)
> are the right way to turn up the agressiveness of the existing free-behind
> and pre-fetching mechanisms.

I agree, for special situations like this you have to tell the kernel your
intentions, since it's not easy to find out for the kernel through heuristics.
When SCT will release his per-file raw i/o patches then I will rerun my tests.
In the meantime I will play around with mmap().

regards,
Benno.
