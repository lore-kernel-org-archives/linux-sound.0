From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 25 Oct 1999 13:32:49 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94089503826704@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Mon, 25 Oct 1999, Alexander K=F6nig wrote:
> Hi,
>=20
> First of: thanks for your patch Benno! Now I applied it but I have a
> problem... on my system I get a "no such device"-error. And all my
> (mmap)manpage says is: Svr4 documents additional error codes ENXIO and
> ENODEV. Do you have any idea what's wrong with my system? I am sorry if
> this is a dumb question - I've never used mmap....

hmmm that is strange ...
where exactly after the mmap ?
try to check if MYFILESIZE is a valid value (page aligned size of the file),
if fileno(wav_in.handle) is a valid value etc

>=20
> Yeah, ok I have it. Now the problem is I've been working on tX quite a
> lot lately and a lot of things have changed. But from looking at your
> patch it looks like it should be possible to port your changes to the
> new version easily. Please send me a mail, Benno, if you want to have
> access to the CVS repository and maybe take a look at the new stuff
> yourself. IMHO it would be cool if we could integrate your patch into
> the sources, maybe wrapped into some #ifdef USE_MMAP / #endif statements
> so the user could decide whether to use mmap or not with a configure
> switch....


>=20
> > Basically what I changed is:
> <..>
> > With this approach I was able to scratch a 100MB mono file,
> > on a 16MB RAM box, running X , KDE and Netscape (what a pain to load ne=
tscape :-) ) !
> > (using SCHED_FIFO scheduling)
>=20
> Cool. That definitely helps a lot of people! mmap is really amazing ;)
>=20
> <..>
> > BUGS:
> >=20
> > - the 44byte WAV header isn't skipped
> > - mpg123 and sox support doesn't work (would require decompressing
> > to a temporary file)
> > - might not work on BIGENDIAN boxes
>=20
> Well, AFAIK the plain tX 3.2 doesn't work on BIGENDIAN machines
> either... (sorry big endian users) I plan to get that fixed before I
> release the new version... Oh with mmap()-ed files we need to do the
> BIGENDIAN-de/encoding right before actually processing a block and not
> the way it's done now while loading. That should be possible... oh but
> the usual big endian machines have enough memory, right? ;)

Ok skipping the WAV header is really easy , just add the offset to samplebu=
ffer
before you start the engine, but subtract the value before doing any free()
or you will get nice segfaults because you are trying to free inexistent me=
mory
areas.
For BIGENDIAN boxes, I'd suggest to do the byte swapping just before you pr=
ocess
the data, the overhead is very little compared to all the rest.


>=20
> > Suggestions to the author:  (any official word from you Alexander ?)
> >
> > - always use mmap since it will work well on big RAM boxes too,
> > and doesn't eat up all you system memory.
>=20
> Hmmmm.... Well I'd prefer a configure switch for the following
> reasons:
>=20
> - big endian machines

use byte swapping on the fly

> - the next release of tX will allow you to load MANY (as many as you
> want) samples in multiple turntables. If all these are mmap'ed files I
> guess your disk-head will jump around like mad when playing.

the trick is the following:
actually I access to the pages about 10times / sec.
With multiple streams to reduce overhead you have to avoid
that all the files are accessed  10-20times/sec, but you have
to do this sequentially and must use larger in-memory buffers:
that means you should "read" the memory buffers at least
in 128k-256k blocks to keep the disk seeking down.

I esperimented with streaming of 60 mono ( 44khz 16bit) tracks from disk
and I had to use at least 1MB buffer per track to keep things somewhat
reliable.
( PII400 + 256MB RAM + IBM 16GB EDIE HD)
=20

> - And the next release will no longer record into memory (yeah for the
> same reason you introduced mmap(), Benno ;) but straight to harddisk -
> now that would cause a lot of harddisk action with mmap()ed files too...
> - With 6 to 8 tables playing my system is pretty loaded in these cases
> it might be a performance win to have the samples in the memory
> already.. (well these are just assumptions - we should get your code
> applied to the new stuff to see whether it's true...)

How du you plan to keep into mem 8 files of 20MB in len (4min mono file)
=3D 160MB, not everyone has that amount of ram on his box.

Trust me: smart mmap() + mlocking() will work well and reliably on 8 tracks
while saving the mix on the disk, using no more that 500kb-1Mb per track.


> - I don't want to drop mp3 and sox support (I know a LOT of people use
> this)

for mp3:
if this is really true that Andy has managed to play mp3s backwards *CORREC=
TLY*
without any distortion, then if I were You, I would include his mp3 code.

Andy are you saving filterstate information in your alsa player ?
that means what happens if I play the file from the beginning to almost the=
 end,
and then I reverse the playing direction and play the file until it reaches=
 the
start ?
Does all this process sound 100% correctly ?
It would require to save the filter state of every played MPEG frame right ?


SOX: you can provide 2 methods: direct in mem loading or converting to a
temporary file and then mmap() the file into mem.
let's the user take the choice.

>=20
> So maybe you agree it would make sense giving the user the choice
> whether to use mmap or not. And for the sake of mp3-compability I'd even
> keep the loading-behaviour as the default behaviour. Well at least for
> now...

IMHO on low mem boxes, it's better to first decompress the mp3 to a tempora=
ry
wav file and then mmap() this into mem, instead of loading all into mem
(which would swapout almost the entire file to the swaparea), and would take
even more time than the pure decompressing of the mp3 to the wav file.
Remember in your case the probability that swapping might occur is much hig=
her
since your file in memory used up almost all physical memory.
Instead in the mmap()ed case there is still physical memory free for other
things, since mmap() buffers only the most recent pages.

>=20
> > -in order to support MP3s and other fileformats decompress/convert this
> > files first to a temporary WAV file and mmap() this into mem.
>=20
> That'll work of course but I guess people with machines with enough mem
> might prefer loading the file...

Yea, provide both, as you can see from the patch, the pure mmap()ing of
the file requires very little effort: instead of malloc()ing a memory regio=
n=20
and read the file into mem, just mmap() the file in that region.

>=20
> > To speed up things even more you could save a the sample graph into
> > a little file the first time you load the audio file, so that on subseq=
uent
> > loads, the 100MB audio file will "load" almost istantaneously in to mem.
> > (thanks to mmap() ).
>=20
> Thats a cool idea. Now if that mmap() stuff works nicely with kernel 2.4
> and mp3 would work with it (see below) it really would make sense to
> switch to mmap completely...=20

mmap() already worked nicely with most linux kernels, and in 2.4 it will wo=
rk
even better due to the improved LRU paging algorithms.

>=20
> > PS: Now if we could get one of these turntables recorded with special
> > static waves (saw waves), we could add add turntable motion detection
> > and get the same features as "finalscratch" on BeOS:
> > scratching an audiofile in realtime using a real turntable.
> > :-)
>=20
> I've never seen finalscratch. But how do these static waves you're
> talking about work? I'd really like to know how that works... Btw I use
> a real turntable for scratching with tX BUT you cannot use it like a
> real turntable (well while scratching you can, it wouldn't make sense if
> you couldn't) but you still have to press space... I've prepared a
> html-page (with some photos and explanation) for my tX-site already and
> I'd say it finished. I plan to put it up on the page tomorrow... maybe
> you want to take a look at that.
>=20
> So I'm looking forward to hearing from you again, Benno

Finalscratch I have not the link handy=20
 look at http://www.be.com   or http://www.lebuzz.com and search
for finalscratch in the audio apps section and you will find the link.
(or alternatively try a search engine like google or so, should find the URL
too)

Basically as far I understand they sample (using the soundcard) a static wa=
ve
recorded on the turntable and compute the actual rotational speed.
Then just feed this value to the tX engine, and your
mp3 on-turntable scratcher is here.
:-)

In the next days I will add mlock()/munlock() support to tX let's see it th=
ere
are any benefits during high system load.


Alex, if you want to mail me privately you can mail me in german too,
( I'm from Suedtirol  :-)  )

Benno.
