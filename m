From: =?iso-8859-1?Q?J=E9r=F4me=20Aug=E9?= <jauge@club-internet.fr>
Date: Sat, 30 Jun 2001 12:02:02 +0000
Subject: Re: Strange issue with opl3sa2 driver under linux 2.4.4
Message-Id: <marc-linux-sound-99390249908901@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99375164302844@msgid-missing>
In-Reply-To: <marc-linux-sound-99375164302844@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

David Nedved wrote:
> [...]
>=20
> 2.) any ideas how to avoid the "opl3sa2: Control I/O port 0x370 is not fr=
ee"
>     messages since they are apparently bogus?
>=20

Now I remenber ... try to use the isapnp=3D0 parameter to disable PnP
detection and it should remove those messages when inserting the module.

--=20
J=E9r=F4me Aug=E9
echo cdqgm@vnqb-hklmpkml.yp | tr khplmndvqyc nirtelacufj
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
