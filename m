From: est@hyperreal.org
Date: Sun, 24 Oct 1999 20:32:41 +0000
Subject: Re: [linux-audio-dev] streaming from disk to terminatorX added (via
Message-Id: <marc-linux-sound-94079724725307@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94078505714168@msgid-missing>
In-Reply-To: <marc-linux-sound-94078505714168@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Paul Barton-Davis discourseth:
> Benno writes:
> 
> >Since the kernel loads pages of the file into mem when they are
> >needed, it could cause audio-dropouts when working with low audio
> >buffer sizes (low latency) since, the playing thread might wait too
> >long for the kernel which tries to load the pages into mem.
> 
> >One trick to avoid this it to add a low priority thread , which does
> >basically read-ahead and read-behind, by accessing to pages before
> >and past the actual playing position.  It doesn't matter if this
> >thread blocks for a moment, since it doesn't play any audio data.
> >The audio thread will always find the needed pages in memory and will
> >not drop out.
> 
> i know that est@hyperreal.org will have something to say about this :)

Yes, I've been busy vacationing (which I still am :)

I don't see how mmap() can be reliable for this sort of thing.  Even
if you touch pages to bring them in, you could get unlucky.  Also,
this assumes we aren't mlocked to begin with which means that *any*
part of our process could be paged with resultant delays.  If we *do*
mlock() everything, the we need enough RAM for the entire sound file
and I'm not even sure exactly what would happen when doing the mmap().

> well, perhaps not, but he should. oolaboola (sp?)

Indeed..that's the usual translitteration. :)

> has been evolving
> toward some fairly sophisticated memory management to handle this kind
> of stuff.

Yes, and it's all ultimately based around intelligent advance `file'
(meaning `slow device') reads.  alsaplayer's buffering scheme may (as
Andy suggests) also be adequate.  oola has more support for loops and
marks but it doesn't yet handle negative rates.

Eric
