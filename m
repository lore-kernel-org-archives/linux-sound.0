From: Paul Barton-Davis <pbd@Op.Net>
Date: Mon, 25 Oct 1999 01:57:32 +0000
Subject: Re: [linux-audio-dev] Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94081664808533@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

 [ re: mmap ]

>Hmmmm.... Well I'd prefer a configure switch for the following
>reasons:
>
>- big endian machines

just FYI: my C++ libsoundfile uses mmap(), but still requires
applications to "read" the data. it is significantly faster than using
read(2) internally, however, so there might be an argument for using
mmap regardless of the endianness, and then using arch-dependent
macros to fetch the data from the mmapped area. for example, on a
little endian machine reading from a little endian RIFF/WAV file, the
macros are essentially no-ops. likewise for reading bigendian AIFF's
on bigendian machines. but for the opposite cases, the macros can do
the work necessary, and i think you'll still find mmap to be your
friend.

except, as est noted, if you're using mlockall ...

>- the next release of tX will allow you to load MANY (as many as you
>want) samples in multiple turntables. If all these are mmap'ed files I
>guess your disk-head will jump around like mad when playing.

actually, no more than it would if you use a 4K memory buffer :) 

>- With 6 to 8 tables playing my system is pretty loaded in these cases
>it might be a performance win to have the samples in the memory
>already.. (well these are just assumptions - we should get your code
>applied to the new stuff to see whether it's true...)

benno's code makes sure it *is* in RAM already. just not all of it
at one time.

--p
