From: Roger Larsson <roger.larsson@skelleftea.mail.telia.com>
Date: Fri, 29 Oct 1999 20:16:19 +0000
Subject: Re: [linux-audio-dev] Re: Sync Issues (was Re: External MIDI Sync using
Message-Id: <marc-linux-sound-94123706608962@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org



Benno Senoner wrote:
>=20
> On Thu, 28 Oct 1999, Paul Barton-Davis wrote:

> > to an old ISA-based Diamond Speedstar, the performance of my audio
> > stuff has gone down the tubes. i can't do *anything* with X and hope
> > to not get dropouts. this never happened with the Matrox card, and i
> > am very confident that as soon as Matrox ships me a new one, the
> > problem will go away.
> >
> > right now, my system is essentially useless for audio work unless you
> > avoid using X. totally useless. i can't even play WAV files without
> > *huge* dropouts, and thats on a *dual* PII-450 !
>=20
> Yes,
>=20
> the idiotproof test is the following:
> install 2.2.10 + lowlatency patch  ( not SMP !),
> tune the IDE diskas as described in the README
> and run a testsession
> if the GFX stress graph is the only bad graph,
> then I'm sorry but you have to throw away your videocard if you want
> to do reliable low latency stuff.
> :-)
>=20

Or you can try to find out what part of your video card driver that
destroys latency and correct that.

You can find out the problematic spot with my patch:
 latency-profiling-2.2.10-r6.patch [for Linux 2.2.10]
I will put it on some own web page at the moment you could get it from:

http://www.gardena.net/benno/linux/audio/patches/latency-profiling-2.2.10-r=
5.patch

And remove this part of the patch since it is not correct...
(you should not be tempted to improve things in an instrumentation
patch...)
=20
-       if (tq_scheduler)
+       //RL latency improvement, correct?
+       //RL skip if forced reschedule (a normal will arrive soon...)
+       if (!current->need_resched &&=20
+           tq_scheduler)

The results are messages in 'dmesg', latency time and instruction
pointers
are printed. You then decode the instruction pointers to routine name.
=20
/RogerL

--=20

The Internet interprets Windows as damage,=20
             and routes around it.

Roger Larsson
Skellefte=E5
Sweden
