From: Jaroslav Kysela <perex@suse.cz>
Date: Tue, 26 Oct 1999 12:31:06 +0000
Subject: Re: [linux-audio-dev] Re: streaming from disk to terminatorX added
Message-Id: <marc-linux-sound-94094100806564@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94081664808533@msgid-missing>
In-Reply-To: <marc-linux-sound-94081664808533@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 25 Oct 1999, Paul Barton-Davis wrote:

> In message <38151885.7A650570@42.fht-esslingen.de>you write:
> >Paul Barton-Davis wrote:
> >> just FYI: my C++ libsoundfile uses mmap(), but still requires
> >> applications to "read" the data. it is significantly faster than using
> >> read(2) internally, however, so there might be an argument for using
> >> mmap regardless of the endianness, and then using arch-dependent
> >> macros to fetch the data from the mmapped area. for example, on a
> >> little endian machine reading from a little endian RIFF/WAV file, the
> >> macros are essentially no-ops.
> >
> >No-ops? Do you mean you don't generate ANY code for this? If so: HOW?
> 
> sorry, not very accurate. for example:
> 
>        int16 foo;
>        unsigned char *p;
> 
>        foo = get_little_endian_int16 (p)
> 
> on an LE machine, this is just:
> 
>        foo = *((int16 *) p);
> 
> on a BE machine, its a bit more complex.

Not very much:

	#include <byteswap.h>

	foo = bswap_16(*((int16 *)p));

The defined macros from GLIBC already does byte swapping in the best way
for given architecture.

							Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
