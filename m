From: Alexander =?iso-8859-1?Q?K=F6nig?= <alex@rhlx01.fht-esslingen.de>
Date: Tue, 26 Oct 1999 05:11:45 +0000
Subject: Re: [linux-audio-dev] Re: streaming from disk to terminatorX added (via
Message-Id: <marc-linux-sound-94091470511976@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94081664808533@msgid-missing>
In-Reply-To: <marc-linux-sound-94081664808533@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

First of: thanks for explaining all of this... I was looking through the
"api-glasses" and not at what *really* happens (at pageing level) I
guess.

Paul Barton-Davis wrote:
<..>
[byteswapping]
> on an LE machine, this is just:
>=20
>        foo =3D *((int16 *) p);
>=20
> on a BE machine, its a bit more complex.
>=20
> the first case is what i meant by a "noop", not a literal NOOP.

Yeah well was thinking "BE" when I said that would need a little more
work. You know currently (on BE machines) tX byteswaps the (whole) data
while loading. Now this of course is not possible with mmap(). This
means the loop that has to be done in realtime looks like this:
with malloc()/read():=20
	- process_sample
	- bytes_swap_sample // for audiodevice
with mmap():
	- bytes_swap_sample //from wav=20
	- process_sample=20
	- byte_swap_sample // for audiodevice

Well, after considering what "process_sample" actually means (a LOT of
code ;) you are right: byteswapping is nearly a noop, even on BE
machines...

<..>
> >the samples COMPLETELY in RAM so there is no disk-activity at all while
> >playing....
>=20
> not so, unless you use mlockall. you mean, completely in VM. not quite
> the same thing.

Yes, Sorry :)

<..>
> unless you mlock(all) the pages on which your soundfile lives, there
> is no reason why the CPU has to do anymore work in the mmap(2) case
> than in the "malloc(3); read (2)" case, assuming that after mmap() you
> touch every page of the mmapped-file (this makes it equivalent to the
> "read" case, since there, the reading-in touched very page of the data
> too). in both cases, a page may be paged out, and cause a page fault,
> requiring the CPU to initiate a fetch. if its not paged out, no extra
> cost either way.

Yes! Thanks.

So that means:

- Let's say I have a machine that can easily store a certain
sample-setup completely without swapping in memory (with malloc/read).
Now let's say instead of malloc/read I mmap() and "read" through the
whole file before playing the first time (to display the data). Then the
complete file will be in memory just like with malloc/read (still
assuming it fits in memory). This way there will be no disk-activity
while playing, either way, right?

- to get that more precise: The swap-out criteria for a mmap()'ed page
and a malloced()-page (not mlocked()) are the same, right?

Then I agree: mmap()ing wav-files is definitely the better way of doing
it. Thanks for makeing that clear. Still there are those other problems
that would keep me (for now!) from using the mmap-way as the default
way:
- I would have to drop sox/mpg123 (unmapable ;) which would really annoy
a lot of people. Although that could be helped by somehow including
Andy's "magic" mp3-decoding - but I have no idea how complex this would
be.
- And I have no idea wether mmap()ing files is available on other
platforms (where tX will be ported to) - this is of course just a lack
of knowledge
- The "builtin" wav-header analyzing routines are based on wavtools and
they are somewhat problematic. Or no they're not but they force you to
use 16Bit/44Khz/Mono Wav files only and that's a little bit annoying
which is why I went on an used sox... Btw could give me a link to your
libsoundfile?

Well there are solutions to all of these points I guess. We'll see.
Thanks again!

Bye, Alex
--=20
_______________________________________________________________________
                            Alexander K=F6nig - alex@42.fht-esslingen.de
                                                  http://termX.cjb.net

[From the Homer Quotables:]
=20
Twenty of the suckiest minutes of my life.

		-- Homer Simpson
		   Burns, Baby Burns
