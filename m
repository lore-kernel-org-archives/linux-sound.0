From: James Thomas <jthomas_44303@yahoo.com>
Date: Wed, 19 May 1999 23:02:56 +0000
Subject: Re: SB AWE32 & RH 6.0, MIDI not working!
Message-Id: <marc-linux-sound-92727026309214@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92692079727967@msgid-missing>
In-Reply-To: <marc-linux-sound-92692079727967@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

I believe that you may be hearing the FM synthesizer
and not the wavetable on the AWE card.  I believe that
the OSS/Free drivers do NOT support the wavetable on
the AWE cards so you have to use FM synthesis to play
MIDI.  I know that if you purchase the OSS driver for
the AWE cards with the EMU8000 (wavetable) extension
from the makers of the OSS drivers (4front-tech) that
the wavetable will be fully supported and you won't
need isapnptools for your sound card at all.  Nor will
you need sound support compiled into your kernel.

--- Ricardo Peres <rjperes@student.dei.uc.pt> wrote:
> Yep, thanks, I had already found!
> By the way, my MIDI sound is not very good... Using
> Windows I can choose
> between 2 (or 3...) MIDI devices, and AWE Synth
> gives much better sound.
> How do I do this with Linux?
>=20
> Thanks, again!
>=20
>
---------------------------------------------------------------------------=
--
> Ricardo Peres
> E-mail: rjperes@student.dei.uc.pt
> ICQ UIN: 708926
> TM: 0931 9459192
> Departamento de Engenharia Inform=E1tica
> Universidade de Coimbra
> PORTUGAL
>
---------------------------------------------------------------------------=
--
>=20
> On Mon, 17 May 1999, Bill Nottingham wrote:
>=20
> > Ricardo Peres (rjperes@student.dei.uc.pt) said:=20
> > > alias sbawe awe_wave
> > > options -k awe_wave io=3D0x620
> >=20
> > Actually, you don't need to specify an io port
> here for the awe module.
> >=20
> > Add after this line in your isapnp.conf file:
> > >  (IO 0 (SIZE 4) (BASE 0x0620))
> > (IO 1 (SIZE 4) (BASE 0x0A20))
> > (IO 2 (SIZE 4) (BASE 0x0E20))
> >=20
> > Then re-run isapnp and try to load the module -
> does that
> > help?
> >=20
> > Bill
> >=20
>=20
>=20

=3DJaimie Thomas <jthomas_44303@yahoo.com>

"If you're searching for Truth, don't search within
 yourself - you're the one who's confused!"  - Frank Peretti


_____________________________________________________________
Do You Yahoo!?
Free instant messaging and more at http://messenger.yahoo.com
