From: Dominik Stadler <Dominik.Stadler@apertum.de>
Date: Tue, 29 Dec 1998 09:44:57 +0000
Subject: AW: problems with cdda2wav and other audio CDROM ripping software
Message-Id: <marc-linux-sound-91493029131527@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org


Hi Tony,=20

It would be interesting, which version of cdda2wav you use, to which
major/minor-numbers /dev/cdrom points to and if you you use scsi, ide, or
whatever?

Why do you set -quiet so you don't see important informational messages?

Have you tried to rip without -e and -N, and play the resulting .wav-file?
It is possible that only the output to the soundcard isn't working..

You could also try to specify -D in the format "-D bus,id,lun"=20
e.g. "-D 0,3,0" works for me.

HTH

Dschau.. Dominik

> -----Urspr=FCngliche Nachricht-----
> Von:	Tony Nugent [SMTP:Tony.Nugent@usq.edu.au]
> Gesendet am:	Dienstag, 29. Dezember 1998 08:04
> An:	Linux Applications Email List; Linux Sound Email List
> Betreff:	problems with cdda2wav and other audio CDROM ripping
> software
>=20
> For the life of me I just can't get cdda2wav to work on my RH5.1/5.2
> box!
>=20
> % cdda2wav -q -e -t2 -d0 -N -D /dev/cdrom
>=20
> (and lots of variants) just produces ugly noise.  Same for cdparanoia
> - the wav files it creates sound like a ham radio between signals :)
>=20
> And I can't get 8hz-mp3 to compile (there's a bunch of missing
> ieee*.h header files).  So "ripperX" is useless.
>=20
> I'd really like to do some audio cdrom ripping (to do audio cdrom
> copies and to make some mp3 disks), but I'm at a loss to know what to
> use.
>=20
> Can anyone point me in the direction of something (anything!!) that
> *works* ??
>=20
> (rpm format would be ideal, but I'll use anything - just as long as it
> works :)
>=20
> Many thanks.
>=20
> Cheers
> Tony
