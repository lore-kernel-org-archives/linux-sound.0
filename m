From: Alexander =?iso-8859-1?Q?K=F6nig?= <alex@rhlx01.fht-esslingen.de>
Date: Mon, 25 Oct 1999 21:15:00 +0000
Subject: Re: [linux-audio-dev] Re: streaming from disk to terminatorX added (via
Message-Id: <marc-linux-sound-94088610016328@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94081664808533@msgid-missing>
In-Reply-To: <marc-linux-sound-94081664808533@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Paul Barton-Davis wrote:
> just FYI: my C++ libsoundfile uses mmap(), but still requires
> applications to "read" the data. it is significantly faster than using
> read(2) internally, however, so there might be an argument for using
> mmap regardless of the endianness, and then using arch-dependent
> macros to fetch the data from the mmapped area. for example, on a
> little endian machine reading from a little endian RIFF/WAV file, the
> macros are essentially no-ops.

No-ops? Do you mean you don't generate ANY code for this? If so: HOW?

<..>
> >- the next release of tX will allow you to load MANY (as many as you
> >want) samples in multiple turntables. If all these are mmap'ed files I
> >guess your disk-head will jump around like mad when playing.
>=20
> actually, no more than it would if you use a 4K memory buffer :)

??? Yeah sure, using a limited buffer will have the same effect but the
way tX currently does it is like the good ole trackers did it: it loads
the samples COMPLETELY in RAM so there is no disk-activity at all while
playing....

> >- With 6 to 8 tables playing my system is pretty loaded in these cases
> >it might be a performance win to have the samples in the memory
> >already.. (well these are just assumptions - we should get your code
> >applied to the new stuff to see whether it's true...)
>=20
> benno's code makes sure it *is* in RAM already. just not all of it
> at one time.

Yeah, you are right. I guess what I wanted to say was: If you mmap()
files instead of loading there's a lot of other stuff happening aside
for audio-rendering (you know like mmap()-code, fs-code, ide-code...)
Now if you have a lot of turntables and some effects enabled your CPU
may be pretty busy getting the audio ready for playback and that
additional code may be too much.. well still: it's just an assumption ;)

Bye, Alex
--=20
_______________________________________________________________________
                            Alexander K=F6nig - alex@42.fht-esslingen.de
                                                  http://termX.cjb.net

[From the Homer Quotables:]
=20
I'll work from midnight to eight, come home, sleep for
five minutes, eat breakfast, sleep six more minutes,
shower, then I have ten minutes to bask in Lisa's love,
then I'm off to the power plant fresh as a daisy.

		-- Homer Simpson
		   Lisa's Pony
