From: est@hyperreal.org
Date: Tue, 26 Oct 1999 17:20:29 +0000
Subject: mp3 seeking
Message-Id: <marc-linux-sound-94096104300746@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Andy Lo A Foe discourseth:
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
> time your mp3 decoding engine is recovered from the 'seek' operation.

Andy,

First, I must thank you for alsaplayer since I'm using an adaptation
of your adaptation of the mpg123 code in the next major release of
oolaboola.  I'm encapsulating it in a separate process (called
mp3serv) to get re-entrancy.  I may move to the xing decoder but the
process interface will remain the same.

Now to the question of seeking. :)

My understanding was that it *may* take more than 3 frames of priming
to resynchronize.  One of the xing/freemap people got me the logic but
I haven't implemented it yet.

Another issue is how to find a given frame in the first place.  Given
that each frame may have an extra byte of padding, a multiplication is
(audibly!) unreliable.  I've implemented a table-of-contents mechanism
to deal with this.

Best,

Eric
