From: Paul Barton-Davis <pbd@Op.Net>
Date: Mon, 25 Oct 1999 21:56:06 +0000
Subject: Re: [linux-audio-dev] Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94088856619315@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94081664808533@msgid-missing>
In-Reply-To: <marc-linux-sound-94081664808533@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In message <38151885.7A650570@42.fht-esslingen.de>you write:
>Paul Barton-Davis wrote:
>> just FYI: my C++ libsoundfile uses mmap(), but still requires
>> applications to "read" the data. it is significantly faster than using
>> read(2) internally, however, so there might be an argument for using
>> mmap regardless of the endianness, and then using arch-dependent
>> macros to fetch the data from the mmapped area. for example, on a
>> little endian machine reading from a little endian RIFF/WAV file, the
>> macros are essentially no-ops.
>
>No-ops? Do you mean you don't generate ANY code for this? If so: HOW?

sorry, not very accurate. for example:

       int16 foo;
       unsigned char *p;

       foo = get_little_endian_int16 (p)

on an LE machine, this is just:

       foo = *((int16 *) p);

on a BE machine, its a bit more complex.

the first case is what i meant by a "noop", not a literal NOOP.

>??? Yeah sure, using a limited buffer will have the same effect but the
>way tX currently does it is like the good ole trackers did it: it loads
>the samples COMPLETELY in RAM so there is no disk-activity at all while
>playing....

not so, unless you use mlockall. you mean, completely in VM. not quite
the same thing.

>> benno's code makes sure it *is* in RAM already. just not all of it
>> at one time.
>
>Yeah, you are right. I guess what I wanted to say was: If you mmap()
>files instead of loading there's a lot of other stuff happening aside
>for audio-rendering (you know like mmap()-code, fs-code, ide-code...)
>Now if you have a lot of turntables and some effects enabled your CPU
>may be pretty busy getting the audio ready for playback and that
>additional code may be too much.. well still: it's just an assumption ;)

unless you mlock(all) the pages on which your soundfile lives, there
is no reason why the CPU has to do anymore work in the mmap(2) case
than in the "malloc(3); read (2)" case, assuming that after mmap() you
touch every page of the mmapped-file (this makes it equivalent to the
"read" case, since there, the reading-in touched very page of the data
too). in both cases, a page may be paged out, and cause a page fault,
requiring the CPU to initiate a fetch. if its not paged out, no extra
cost either way.

--p
