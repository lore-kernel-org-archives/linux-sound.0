From: Santos Halpar <sjhalpar@yahoo.com>
Date: Thu, 24 Jun 1999 15:04:10 +0000
Subject: Re: ES1371 problems
Message-Id: <marc-linux-sound-93023848305614@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93017242300244@msgid-missing>
In-Reply-To: <marc-linux-sound-93017242300244@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Bill Nottingham <notting@redhat.com> wrote:
>Santos Halpar (sjhalpar@yahoo.com) said: 
> > cat'ing /dev/sndstat gives
> > "cat: /dev/sndstat: No such device", which would indicate that I
> > need to load the appropriate module -- but es1371 isn't one of
the
> > OSS modules, so I'm not too sure about that.
>
> The PCI drivers don't support the /dev/sndstat interface; there
> is no 'appropriate module'.

Okay, I sort of suspected that.

> > If I run "play file.wav", it hangs until I kill the
> > spawned sox process -- sndconfig hangs similarly when it tries
> > to play a sample file.  It's not a volume issue and sound works
> > fine in NT.
> 
> Where does 'strace play file.wav' say that it's hanging?

In wait4, which makes sense since play is just a Bourne shell 
wrapper around sox.  If I kill the sox process it forks, play 
exits fine.  sox hangs in write (while writing to /dev/dsp).  
Relevant portions of the sox trace:

[SNIP -- library mmaping, etc]
open("beethoven.wav", O_RDONLY)         = 3
open("/dev/dsp", O_WRONLY|O_CREAT|O_TRUNC, 0666) = 4
[SNIP -- fds 3 and 4 aren't closed and reopened after this]
read(3, "RIFF", 4)                      = 4
fstat(3, {st_mode2075, st_size=0, ...}) = 0
mmap(0, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x40014000
read(3, "\\\"\1\0WAVEfmt \20\0\0\0\1\0\1\0"..., 4096) = 4096
ioctl(4, SNDCTL_DSP_RESET, 0)           = 0
ioctl(4, SNDCTL_DSP_GETBLKSIZE, 0x80708c4) = 0
ioctl(4, SNDCTL_DSP_SYNC, 0)            = 0
ioctl(4, SNDCTL_DSP_SETFMT, 0xbffff654) = 0
ioctl(4, SNDCTL_DSP_STEREO, 0xbffff654) = 0
ioctl(4, SNDCTL_DSP_SPEED, 0xbffff654)  = 0
brk(0x8093000)                          = 0x8093000
brk(0x809c000)                          = 0x809c000
read(3, "\0002\0009\0009\0003\0#\0\n\0\353"..., 4096) = 4096
read(3, "\0\n\0\340\0\276\0\243\0\215\0\211"..., 4096) = 4096
read(3, "\0)\0$\0\v\0\352\0\333\0\336\0\361"..., 4096) = 4096
read(3, "\0\f\0\0\0\1\0\v\0\373\0\356\0\336"..., 4096) = 4096
write(4, "\0\1\1\377\377\2\0\2\0\2\0\2\377"..., 64) = 64
write(4, "\0\2\0\2\0\2\0\2\376\1\0\1\0\1\0"..., 64) = 64
[SNIP -- many more reads and writes as per above -- reads are all
of 4096 bytes, writes are all of 64 bytes.  18 reads total 73728
bytes, 1024 writes total a suspicious 65536 bytes until...]
read(3, "\0$\0 \0\26\0\20\0\22\0\26\0\32\0"..., 4096) = 608
write(4, "\36\376\30\346\360\342a\372\352\24"..., 64) = 64
write(4, "\0\324\1\325\1\334\0\336\0\334\0"..., 64 <unfinished ...>

The successful write of 64 bytes at the end there is part of the
65536 bytes. The last read is short.  wc and ls -l agree that
beethoven.wav is 74340 bytes in length, which is exactly what the
reads on it total if you throw in the 608 bytes at the end and the
4 bytes for the RIFF magic at the top.  But write() blocks after
exactly 2^16 bytes are written -- maybe a buffer size, and nothing
is actually written out to the hardware?  At any rate, the writes
are blocking before the end of the file.

Just to rule out any bizarre EOF scenarios I tried a larger wav.  It
still blocks after writing 65536 bytes and the reads are nowhere
near EOF (still all 4096 bytes).

If it's not obvious already, I know next to nothing about the
architecture of the sound drivers.

Thanks for your reply.

--Sumner
_________________________________________________________
Do You Yahoo!?
Get your free @yahoo.com address at http://mail.yahoo.com
