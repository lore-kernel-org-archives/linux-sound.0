From: Andy Lo A Foe <andy@alsa-project.org>
Date: Tue, 26 Oct 1999 07:50:37 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94092433921273@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 25 Oct 1999, Benno Senoner wrote:

> for mp3:
> if this is really true that Andy has managed to play mp3s backwards *CORRECTLY*
> without any distortion, then if I were You, I would include his mp3 code.
> 
> Andy are you saving filterstate information in your alsa player ?

No

> that means what happens if I play the file from the beginning to almost the end,
> and then I reverse the playing direction and play the file until it reaches the
> start ? Does all this process sound 100% correctly ?

Yes

> It would require to save the filter state of every played MPEG frame right ?

It works like this: the ringbuffer I use is segmented;

		
	disk/cdrom based mp3/cdda/wav/etc		
		|
		|
	audio decoder thread
	decodes mp3/cdda/wav/etc
	fills the framebuffer segments
		|
		|

[|---------|---------|---------|----------|---------|] ringbuffer
             segment			
					|
					|
				audio reader thread
				reads framebuffer segments
				and feeds the soundcard
					|
					|
				    soundcard	


A segment holds a number of decoded frames (usually 2 or 3) and also
remembers the number of the first frame. So lets say we want to play 
a mp3 backwards starting at frame 1000. The tricky part is to keep the
ringbuffer full with the right frames all the time. As soon as one segment
is used up by the audio reader thread it releases a semaphore on which the
audio decoder thread is blocking on. The audio decoder thread wakes up and
check if there are any segments that needs to be filled. But wait you say,
what if you need to fill a segment with frames 1000 to 998? Decoding frame
1000, then 999 and then 998 won't work because of the way mp3s are
encoded. What do you do then? You seek to frame 995 and start decoding
from there. You throw all data away up to and including frame 997. By this
time your mp3 decoding engine is recovered from the 'seek' operation. Now
you store the next 3 frames in your ringbuffer. The audio reader thread,
when detecting negative speed, simply reads a segment backwards so in
this case it starts at frame 1000. The segment before the current one
must contain frame 995 to 997 (first jump to frame 992, decode 3
frames and discard them, decode the needed data), and so on...
The decoder thread is also a couple of segments ahead of the reader
thread. So when you do rapid positive and negative speed switching
(scratching) the decoder thread is actually idling since none of the
segments get discarded. 

Comments? :)

Andy

PS. On my lowly PII 233 I can actually play quite a few mp3's (tested with
7), each with different speed, simultaneously. This is with ALSA and a Trident
4DWave NX card that does hardware mixing.
--
AlsaPlayer, http://www.alsa-project.org/~andy/
