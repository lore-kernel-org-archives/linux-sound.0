From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 25 Oct 1999 12:58:29 +0000
Subject: Re: [linux-audio-dev] streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94089511526785@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94078505714168@msgid-missing>
In-Reply-To: <marc-linux-sound-94078505714168@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 24 Oct 1999, est@hyperreal.org wrote:

> I don't see how mmap() can be reliable for this sort of thing.  Even
> if you touch pages to bring them in, you could get unlucky.  Also,
> this assumes we aren't mlocked to begin with which means that *any*
> part of our process could be paged with resultant delays.  If we *do*
> mlock() everything, the we need enough RAM for the entire sound file
> and I'm not even sure exactly what would happen when doing the mmap().
> 
> > well, perhaps not, but he should. oolaboola (sp?)
> 
> Indeed..that's the usual translitteration. :)
> 
> > has been evolving
> > toward some fairly sophisticated memory management to handle this kind
> > of stuff.
> 
> Yes, and it's all ultimately based around intelligent advance `file'
> (meaning `slow device') reads.  alsaplayer's buffering scheme may (as
> Andy suggests) also be adequate.  oola has more support for loops and
> marks but it doesn't yet handle negative rates.
> 

Eric,
when not mlock()-ing the entire process (or at least the RT relevant data),
you have no chance to give ANY guarantee thet some pages could
not be swapped out.

What I'm trying to say: read() doesn't work better than mmap() in terms of
behaviour during swapping, because the kernel could easily swap out
your buffer where you read() in the data.
Your argument is not a valid argument to me.

Of course an even better solution than my "pagefaulter" thread ,
(but it will require root privileges), is to use a
thread which basically mlock() / munlock() the region around the 
actual playing position.
It's very easy to add to the pagefaulter thread:
instead of accessing to the pages just do the following in the while() loop:
(for example)

munlock() old range  ( old_start, old_len)

new_start=&samplebuffer[current_pos-100k];
new_len 0k;
( chekc the boundaries of start and len !)
mlock() new range (new_start,new_len)  


easy eh ?

SCHED_FIFO plus the above mlock()/munlock() is almost bulletproof.

normal scheduling plus the pagefaulter thread touching the pages is as reliable
as doing regular reads().
But here comes the linux low-latency problem:

In my tests using a buffer size of 100ms in terminator-X  (SCHED_FIFO) ,
I was able to play dropout-free audio on a 16MB RAM box,
running RH6.1 , X , KDE , netscape , 
10 processes which do  for(;;);   = CPU wasting loop
plus a cat /usr/bin/* >/dev/null running continuously 

of course 100ms is way too much for scratching in realtime,
but apply the lowlatency patches to the kernel and tune the disk and I'm sure
you can scratch trouble-free with 5ms latency or less.

I will add a feature to the pagefaulter thread which uses mlock()/munlock if
root privileges are available, so that even
Eric is satisfied.
:-)

someone still sceptic ?
:-)

PS: mlockall(MCL_CURRENT|MCL_FUTURE) is a bad idea because when you do the
mmap() of the large file the process tries to load all into mem,and my scheme
would not work. Better to use mlockall(MCL_CURRENT) and mlock()/munlock()
areas on demand.

regards,
Benno.
 
