From: =?iso-8859-1?q?Eric=20Brunel?= <eric_brunel@yahoo.fr>
Date: Fri, 14 Jul 2000 17:03:22 +0000
Subject: Re: Midi / SysEx - Dump / Linux?
Message-Id: <marc-linux-sound-96359470206658@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96349816311777@msgid-missing>
In-Reply-To: <marc-linux-sound-96349816311777@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

--- Benno Senoner <sbenno@gardena.net> wrote :
[snip]
> I am not sure if it works but you could try to do
> the following:
>=20
> cat /dev/midi00 >dumpfile
>=20
> start the sysex transfer
>=20
> when finished
> press CTRL-C
> the dumpfile will contain the dumped data.

O-me-god, it seems to work...! I got what seems to be
the sysex dump I needed... What a wonderful OS!
Thanks, Benno.

> then to playback the data
> first start sysex receive on your midi module
> then do
> cat dumpfile >/dev/midi00
>=20
> which should send back the data to the midi port.

Could anyone confirm that? I've got an Elektron
SIDStation and there is no other way to save custom
programs than via MIDI/sysex. So if this does not
work, I'll lose all my carefully crafted custom
programs.
Thanks a lot in advance.
 - eric -

___________________________________________________________
Do You Yahoo!?
Achetez, vendez! =C0 votre prix! Sur http://encheres.yahoo.fr
