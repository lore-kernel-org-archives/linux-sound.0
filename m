From: Benno Senoner <sbenno@gardena.net>
Date: Wed, 27 Oct 1999 20:10:34 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94105780118397@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 26 Oct 1999, Andy Lo A Foe wrote:

> A segment holds a number of decoded frames (usually 2 or 3) and also
> remembers the number of the first frame. So lets say we want to play 
> a mp3 backwards starting at frame 1000. The tricky part is to keep the
> ringbuffer full with the right frames all the time. As soon as one segment
> is used up by the audio reader thread it releases a semaphore on which the
> audio decoder thread is blocking on. The audio decoder thread wakes up and
> check if there are any segments that needs to be filled. But wait you say,
> what if you need to fill a segment with frames 1000 to 998? Decoding frame
> 1000, then 999 and then 998 won't work because of the way mp3s are
> encoded. What do you do then? You seek to frame 995 and start decoding
> from there. You throw all data away up to and including frame 997. By this
> time your mp3 decoding engine is recovered from the 'seek' operation. Now
> you store the next 3 frames in your ringbuffer. The audio reader thread,
> when detecting negative speed, simply reads a segment backwards so in
> this case it starts at frame 1000. The segment before the current one
> must contain frame 995 to 997 (first jump to frame 992, decode 3
> frames and discard them, decode the needed data), and so on...
> The decoder thread is also a couple of segments ahead of the reader
> thread. So when you do rapid positive and negative speed switching
> (scratching) the decoder thread is actually idling since none of the
> segments get discarded. 
> 
> Comments? :)

Ok, but what are then the general rule for decoding mp3 backwards: 
assume that you are at frame n:

point1:
decode frames: n-5 , n-4 n-3 , n-2 , n-1 , n  ( 6 frames)
throw away frames n-5,n-4,n-3
fill buffers with frames n-2 , n-1 , n  (this is thwe usable data)
n=n-3
return to point 1

right ?
(correct me pleasse if I'm wrong)

of course playing backward requires 2x the CPU horsepower, but with today's CPUs
combined with optimized x86 assembly code like the mpg123's one , this is not a
major problem except if you want to decode lots of tracks backwards.

regards,
Benno.
