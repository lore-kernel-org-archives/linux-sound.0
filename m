From: Alexander =?iso-8859-1?Q?K=F6nig?= <alex@rhlx01.fht-esslingen.de>
Date: Tue, 26 Oct 1999 20:34:09 +0000
Subject: Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94097004913769@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94077890409185@msgid-missing>
In-Reply-To: <marc-linux-sound-94077890409185@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi again...

Benno Senoner wrote:
> > problem... on my system I get a "no such device"-error. And all my
> > (mmap)manpage says is: Svr4 documents additional error codes ENXIO and
> > ENODEV. Do you have any idea what's wrong with my system? I am sorry if
> > this is a dumb question - I've never used mmap....
>=20
> hmmm that is strange ...
> where exactly after the mmap ?
> try to check if MYFILESIZE is a valid value (page aligned size of the fil=
e),
> if fileno(wav_in.handle) is a valid value etc

Oops - just as I expected a *really* dumb question. I changed the
configure script to use mpg123/sox as default if available and that of
course does not work with mmap()... well a --enable-wavonly fixed this
:( Sorry! Oh yeah: it works beautifully on big mem machines ;) So I
guess "no such device" just tells me this FILE* is not on a device (as
it is a pipe)... Yes, see my face red.

<..>
> For BIGENDIAN boxes, I'd suggest to do the byte swapping just before you =
process
> the data, the overhead is very little compared to all the rest.

Yeah - while discussing this with Paul I actually came to the same
conclusion. It's a joke compared to the rest that's done with the
sample...

<..>
> use byte swapping on the fly

Agreed :)

<..>
> I esperimented with streaming of 60 mono ( 44khz 16bit) tracks from disk
> and I had to use at least 1MB buffer per track to keep things somewhat
> reliable.
> ( PII400 + 256MB RAM + IBM 16GB EDIE HD)

Hey we should try to get the mmap()-code to the new tX soon - I'd really
like to see this :)

> How du you plan to keep into mem 8 files of 20MB in len (4min mono file)
> =3D 160MB, not everyone has that amount of ram on his box.

Yeah well, from it's design-idea you actually have shorter and looping
samples (yes and maybe one or two big ones) as only then you can
actually sync those turntables nicely... but: you are right!

> Trust me: smart mmap() + mlocking() will work well and reliably on 8 trac=
ks
> while saving the mix on the disk, using no more that 500kb-1Mb per track.

Yeah. Accepted. Let me see it ;)

> for mp3:
> if this is really true that Andy has managed to play mp3s backwards *CORR=
ECTLY*
> without any distortion, then if I were You, I would include his mp3 code.

Yes actually I'd like to have that... Hi, Andy ;) But if you take a look
at the current tX (it should be avialable via anonymous CVS from=20
:pserver:terminatorX@rhlx01.fht-esslingen.de:/cvs/terminatorX
oh, if you check it out: first step: press "add turntable" ;)
you'll see: I have a lot of other things to do for tX too :( But having
a tX that would allow mmap()ing mono-wavs and streaming mp3s with Andy's
code and the ability to load other audioformats via sox sounds extremly
cool :)

<..>
[real turntables]
> Basically as far I understand they sample (using the soundcard) a static =
wave
> recorded on the turntable and compute the actual rotational speed.
> Then just feed this value to the tX engine, and your
> mp3 on-turntable scratcher is here.
> :-)

Damn and I just destroyed the motor of my turntable for terminatorX...

> In the next days I will add mlock()/munlock() support to tX let's see it =
there
> are any benefits during high system load.
>=20
> Alex, if you want to mail me privately you can mail me in german too,
> ( I'm from Suedtirol  :-)  )

Yes actually I will do that so we can chat about CVS and moving your
code into the next release...

Bye, Alex
--=20
_______________________________________________________________________
                            Alexander K=F6nig - alex@42.fht-esslingen.de
                                                  http://termX.cjb.net

[From the Homer Quotables:]
=20
I don't care if Ned Flanders is the nicest guy=20
in the world.  He's a jerk -- end of story.

		-- Homer Simpson
		   When Flanders Failed
