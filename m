From: Ricardo Peres <rjperes@student.dei.uc.pt>
Date: Sun, 27 Sep 1998 23:50:41 +0000
Subject: Re: AWE32 initialization wiht isapnp
Message-Id: <marc-linux-sound-90693995303475@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90692428831897@msgid-missing>
In-Reply-To: <marc-linux-sound-90692428831897@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi!

By the way, how do I enable the midi device?
I have a SB 32 Plug & Play, and it is working fine, except for the midi.
My /dev/sndstat file is as follows:

-----Begin------

Sound Driver:3.5.4-960630
Kernel: Linux replicant.dei.uc.pt 2.0.35 #1 Thu Sep 24 21:11:57 WEST 1998=20
i586
Config options: 0

Installed drivers:

Card config:

Audio devices:
0: Sound Blaster 16 (4.13)

Synth devices:
0: Yamaha OPL-3
1: AWE32-0.4.2d (RAM0k)

Midi devices:

Timers:
0: System clock

Mixers:
0: Sound Blaster
1: AWE32 Equalizer

-------End-------

I have kernel 2.0.35 compiled with midi support (as you can see).

Thanks!



---------------------------------------------------------------------------=
--
Ricardo Peres
E-mail: rjperes@student.dei.uc.pt
ICQ UIN: 708926
TM: 0931 9459192
Departamento de Engenharia Inform=E1tica
Universidade de Coimbra
PORTUGAL
---------------------------------------------------------------------------=
--

On Sun, 27 Sep 1998, Bill Nottingham wrote:

> Alexis DOMJAN (disco@igaia.ch) said:=20
> > In order to use the wavetable device of my AWE32 I was starting under
> > MSDOS, executing ctpnp to configure the card and then I was running
> > loadlin and the Wavetable was properly detected.
> >=20
> > However I only want to use lilo, so I'm using isapnp to configure the
> > awe32 (audio and wavetable) and then I "modprobe" sound module. Then the
> > audio device (dsp, opl2/3) is correclty detected, but the AWE32 Wavetab=
le
> > on port 0x620 is not detected (according to /proc/ioports).
>=20
> Find the line in your isapnp.conf file that says:
>=20
> 	(IO 0 (BASE 0x0620))
> =09
> Add right after it:
>=20
> 	(IO 1 (BASE 0x0A20)) (IO 2 (BASE 0x0E20))
> =09
> pnpdump, for whatever reason, doesn't see all the IO ports for
> the EMU chip on the AWE.
>=20
> Bill
>=20
