From: Paul Barton-Davis <pbd@Op.Net>
Date: Sun, 24 Oct 1999 17:07:02 +0000
Subject: Re: [linux-audio-dev] streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94078505714168@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Benno writes:

>Since the kernel loads pages of the file into mem when they are
>needed, it could cause audio-dropouts when working with low audio
>buffer sizes (low latency) since, the playing thread might wait too
>long for the kernel which tries to load the pages into mem.

>One trick to avoid this it to add a low priority thread , which does
>basically read-ahead and read-behind, by accessing to pages before
>and past the actual playing position.  It doesn't matter if this
>thread blocks for a moment, since it doesn't play any audio data.
>The audio thread will always find the needed pages in memory and will
>not drop out.

i know that est@hyperreal.org will have something to say about this :)
well, perhaps not, but he should. oolaboola (sp?) has been evolving
toward some fairly sophisticated memory management to handle this kind
of stuff.
