From: Alexander =?iso-8859-1?Q?K=F6nig?= <alex@rhlx01.fht-esslingen.de>
Date: Mon, 25 Oct 1999 00:29:19 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94081135904343@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi,

First of: thanks for your patch Benno! Now I applied it but I have a
problem... on my system I get a "no such device"-error. And all my
(mmap)manpage says is: Svr4 documents additional error codes ENXIO and
ENODEV. Do you have any idea what's wrong with my system? I am sorry if
this is a dumb question - I've never used mmap....

Now for the replying:

Benno Senoner wrote:
> for those that are interested:

I am :)

> Yesterday I went on terminatorX's (the scratching app)  homepage (
> http://termX.cjb.net ), and read in the FAQ that it doesn't support strea=
ming
> from disk, because it would require a complete redesign of the app.
> But fortunately Alexander was wrong:
> :-)

Hehe, good to know. Yeah I didn't know how easy this is - dumb me ;)

<..>
> http://www.gardena.net/benno/linux/terminatorX-3.2-mmap.patch

Yeah, ok I have it. Now the problem is I've been working on tX quite a
lot lately and a lot of things have changed. But from looking at your
patch it looks like it should be possible to port your changes to the
new version easily. Please send me a mail, Benno, if you want to have
access to the CVS repository and maybe take a look at the new stuff
yourself. IMHO it would be cool if we could integrate your patch into
the sources, maybe wrapped into some #ifdef USE_MMAP / #endif statements
so the user could decide whether to use mmap or not with a configure
switch....

> Basically what I changed is:
<..>
> With this approach I was able to scratch a 100MB mono file,
> on a 16MB RAM box, running X , KDE and Netscape (what a pain to load nets=
cape :-) ) !
> (using SCHED_FIFO scheduling)

Cool. That definitely helps a lot of people! mmap is really amazing ;)

<..>
> BUGS:
>=20
> - the 44byte WAV header isn't skipped
> - mpg123 and sox support doesn't work (would require decompressing
> to a temporary file)
> - might not work on BIGENDIAN boxes

Well, AFAIK the plain tX 3.2 doesn't work on BIGENDIAN machines
either... (sorry big endian users) I plan to get that fixed before I
release the new version... Oh with mmap()-ed files we need to do the
BIGENDIAN-de/encoding right before actually processing a block and not
the way it's done now while loading. That should be possible... oh but
the usual big endian machines have enough memory, right? ;)

> Suggestions to the author:  (any official word from you Alexander ?)
>
> - always use mmap since it will work well on big RAM boxes too,
> and doesn't eat up all you system memory.

Hmmmm.... Well I'd prefer a configure switch for the following
reasons:

- big endian machines
- the next release of tX will allow you to load MANY (as many as you
want) samples in multiple turntables. If all these are mmap'ed files I
guess your disk-head will jump around like mad when playing.
- And the next release will no longer record into memory (yeah for the
same reason you introduced mmap(), Benno ;) but straight to harddisk -
now that would cause a lot of harddisk action with mmap()ed files too...
- With 6 to 8 tables playing my system is pretty loaded in these cases
it might be a performance win to have the samples in the memory
already.. (well these are just assumptions - we should get your code
applied to the new stuff to see whether it's true...)
- I don't want to drop mp3 and sox support (I know a LOT of people use
this)

So maybe you agree it would make sense giving the user the choice
whether to use mmap or not. And for the sake of mp3-compability I'd even
keep the loading-behaviour as the default behaviour. Well at least for
now...

> -in order to support MP3s and other fileformats decompress/convert this
> files first to a temporary WAV file and mmap() this into mem.

That'll work of course but I guess people with machines with enough mem
might prefer loading the file...

> To speed up things even more you could save a the sample graph into
> a little file the first time you load the audio file, so that on subseque=
nt
> loads, the 100MB audio file will "load" almost istantaneously in to mem.
> (thanks to mmap() ).

Thats a cool idea. Now if that mmap() stuff works nicely with kernel 2.4
and mp3 would work with it (see below) it really would make sense to
switch to mmap completely...=20

> It would be possible to support direct disk streaming of MP3 files,
> but that is not a trivial task since you can't access an MP3 in
<..>

It's done already! Take a look at Andy's brilliant alsaplayer:
http://www.alsa-project.org/~andy/

He does dynamic-mp3 decoding and it works beautifully...

(Hi Andy, I wrote that before I saw you already replied...)

> PS: Now if we could get one of these turntables recorded with special
> static waves (saw waves), we could add add turntable motion detection
> and get the same features as "finalscratch" on BeOS:
> scratching an audiofile in realtime using a real turntable.
> :-)

I've never seen finalscratch. But how do these static waves you're
talking about work? I'd really like to know how that works... Btw I use
a real turntable for scratching with tX BUT you cannot use it like a
real turntable (well while scratching you can, it wouldn't make sense if
you couldn't) but you still have to press space... I've prepared a
html-page (with some photos and explanation) for my tX-site already and
I'd say it finished. I plan to put it up on the page tomorrow... maybe
you want to take a look at that.

So I'm looking forward to hearing from you again, Benno

Bye,
Alex
--=20
_______________________________________________________________________
                            Alexander K=F6nig - alex@42.fht-esslingen.de
                                                  http://termX.cjb.net

[From the Homer Quotables:]
=20
Could this be the best day of my life?

                -- Homer Simpson
                   Homer the Heretic
