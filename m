From: David Olofson <audiality@swipnet.se>
Date: Tue, 26 Oct 1999 00:33:34 +0000
Subject: Re: [linux-audio-dev] Re: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94089946630917@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94081664808533@msgid-missing>
In-Reply-To: <marc-linux-sound-94081664808533@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

On Mon, 25 Oct 1999, Benno Senoner wrote:
> David, your solution looks nicely,
> but I'm more for a plug-n-play solution:
>=20
> 2 turntable players
> 2 soundcards
> 1 PC loaded with mp3
>=20
> use the 2 soundcard's inputs to detect turntable speed (py playing the st=
atic
> waves on the turntable),
> use the 2 audio outputs for the mix and prelisten (phones) channel.
>=20
> IMHO the precision provided by sampling the turnables's static waves
> is enough to get decent scratches, and the use of a "noise gate" when
> the turntable is rotating at default speed will give you the final touch =
of
> perfection.
> :-)

Well, decoding "audio style" signals into speed (or ratherposition) is
*exactly* what my decoding method does. Only, in this case it can
be simplified quite a bit. :-) (I have a carrier frequency to deal
with, and *very* high precision is required. Nice collection of
signal enhacers and trackers already, and I'm still working on it...)

> David, I'cant remember but what would be the optimal method to detect
> the speed of the turntables via audio input ?
>=20
> form of the wave ?
> SAW WAVE , which frequency ?

Two alternatives I can think of right now;

1) A "ramp" (saw) wave.

2) Two sine waves (stereo), 90 degrees out of phase.

> and then the algorithm ?

1) Phase lock to the zero crossings.

2) "angle" =3D atan(left/right). Phase lock and count quadrant.

> couting the number of zero crosses/sign changes ?

1) Yes. (That's about all you can do in any easy way, due to
   the effect the analog cicuitry has on the saw wave...)

2) Yes, for the phase locking. The atan() gives the current
   position within the current quadrant, so you can use a low
   frequency waveform =3D> very high upper speed limit.

> how o detect motion inversion ?

1) Check the ramp climb/fall tendency around the zero
   crossing. Be aware that the signal may not look all that
   much like a saw wave at high speeds!

2) The atan() fixes the high precision part. Check the
   right/left relation to see if you should count up or down
   in the zero crossings. (Note: The zero crossings are
   alternating between left and right; one for each quadrant
   crossing.) A simpler way (if you have nice signals) is to
   just check which one of +90 or -90 degrees places the new
   reading closest to the previous one.

> through looking at the resulting waveform ? :
> if the next value is less than the previous=20
> AND you are not at end of the period (the jump is too big),
> then you detected motion inversion.
> right ?

Yes, but you'd better integrate some (reset when the "jump" is
detected!), or you may not get the result you expect. Next problem;
the jump won't be anything like sharp and easy to detect in real
life, at least not if you're looking for changes in the signal on "DC
dynamis level" at the same time...

> The finalscratch people seemed wrong to think that only BeOS can provide
> the horsepower to run a scratch-mp3s-on-turntable engine.

Hmm... The horsepower is in the *box*. Real time support is the
"only" special feature needed for this - and we're probably beating
them on that by now.

> Seems that linux , will soon even begin to eat marketshare into the DJ se=
ctor.
> :-)
> ( As David said: your next console could be powered by a GPLed audio engi=
ne
> running Linux  :-)  )

Why not? As far as I can see, it's really more about performance and
being able to do it reliably, than about tons of features that will
take years to hack. That is, no one without a real OS performance
edge can compete. Go for it! :-)


//David


 =B7A=B7U=B7D=B7I=B7A=B7L=B7I=B7T=B7Y=B7   P r o f e s s i o n a l   L i n =
u x   A u d i o
-  - ------------------------------------------------------------- -  -
    =B7Rock Solid                                      David Olofson:
    =B7Low Latency    www.angelfire.com/or/audiality   =B7Audio Hacker
    =B7Plug-Ins            audiality@swipnet.se        =B7Linux Advocate
    =B7Open Source                                     =B7Singer/Composer
