From: "Matthew B. Marlowe" <marlowe@alfheim.net>
Date: Thu, 12 Nov 1998 19:24:26 +0000
Subject: Re: Soundcard problem!
Message-Id: <marc-linux-sound-91090788424524@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91089445817213@msgid-missing>
In-Reply-To: <marc-linux-sound-91089445817213@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

DMA should equal 5 or 1.. Not 05 or 01

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: 2.6.3i

mQCNAzYHUrIAAAEEAMAXsThllSKVcUUK9VJWpf6zaJiSSbU2w8qxVGdNPTe1PWC8
sGNCD+u13eLM6y+S+/RquJCTuRUQW3DKLfi7/NxaFvGqJi4/vr/XPOky2vDlZqm2
wTk+/J7MgYtT7K2jawlEWW3HvDdJIPpSe8E8PcolX2Qz5aaLIHNiXOzrvTlJAAUR
tChNYXR0aGV3IEIuIE1hcmxvd2UgPG1hcmxvd2VAYWxmaGVpbS5uZXQ+iQCUAwUQ
NgdSsnNiXOzrvTlJAQHg5gP1EPvDIHqJZV771lhE1ZuPwkYTH2OQQp8lA9ezP+Rd
2lMYvzqfIq4DcM5dGNuU3dYy9tZDsOpqdjzzyP3DPkJoDTT2AzX5gV8GX/HA+FBd
BqdlXIU54BJbAo5RBmKqU8bq0KXPvlmnxYxhvze6UD/Ae6Qb12tR7OYmaC5659RF
7Q=3D
=C0yt
-----END PGP PUBLIC KEY BLOCK-----

On Thu, 12 Nov 1998, Nikolaos Margaritis wrote:

> Hi,=20
>=20
> I have a serious problem with my soundcard which persistently=20
> refuses to cooperate with my Linux system. The processor is a
> PII on an ASUS P2B-DS motherboard. My kernel is brand new:
> version 2.1.125, but it seems to work fine so far for anything=20
> else but sound. The sound card is a vibra16pnp (by Creative Labs).
>=20
> Whenever I attempted to use sndconfig, for whichever setup I have chosen,
> the result was anticipated: A problem appears with modprobe.
>=20
> Furthermore, when I type: "modprobe sb.o" the answer is:
>=20
> /lib/modules/2.1.125/misc/sb.o: too many values for dma (max 1)
>=20
> Has anybody out there seen this attitude before?
>=20
> I suspect the following details might be useful:
>=20
> 	IRQ =3D 5
> 	I/O range =3D 0220 - 0223, DMA =3D 05
> 	I/O range =3D 0224 - 022F, DMA =3D 01
>=20
> I obtained these data using NT diagnostics, so I do cannot be 100% sure=20
> that one could rely on them. :-)
> (Afterall, I have deleted Microsoft from my computer!)
>=20
> When I use  "pnpdump -c -script=3Dout", the file "out" contains the follo=
wing
> information:
>=20
>=20
>=20
> 	#!/bin/sh
> 	prefixes=3D"/etc/pnp/config-scripts/isa /usr/share/pnp/config-scripts/is=
a"
>=20
> 	function pnp_isa_configure {
>     		local i id dir found_it
>     		i=3D0
>     		while [ "${dev_ids[$i]}" !=3D "" ] ; do
>         		id=3D"${dev_ids[$i]}"
> 			for dir in $prefixes ; do
> 				if [ -r $dir/$id ] ; then
> 					source $dir/$id
> 					return $?
> 	    			fi
> 			done
> 			i=3D`expr $i + 1`
>     		done
> 	# Failed to find anything
> 	return 1
> 	}
> 	unset irq irq_flags dma dma_flags io_start io_len io_flags
> 	unset mem_start mem_len mem_flags dev_ids
> 	board_id=3DCTL0070
> 	dev_ids[0]=3DCTL0001
> 	irq[0]=3D5 ; irq_flags[0]=3D0x00
> 	dma[0]=3D1 ; dma_flags[0]=3D0x08
> 	dma[1]=3D5 ; dma_flags[1]=3D0x12
> 	io_start[0]=3D0x0220 ; io_len[0]=16 ; io_flags[0]=3D0x01
> 	io_start[1]=3D0x0330 ; io_len[1]=3D2  ; io_flags[1]=3D0x01
> 	io_start[2]=3D0x0388 ; io_len[2]=3D4  ; io_flags[2]=3D0x01
> 	pnp_isa_configure
> =09
> 	unset irq irq_flags dma dma_flags io_start io_len io_flags
> 	unset mem_start mem_len mem_flags dev_ids
> 	board_id=3DCTL0070
> 	dev_ids[0]=3DCTL7001
> 	dev_ids[2]=3DPNPb02f
> 	io_start[0]=3D0x0200 ; io_len[0]=3D8  ; io_flags[0]=3D0x01
> 	pnp_isa_configure
>=20
>=20
>=20
> Strangely enough, the file /etc/modules.conf contains:
>=20
> 	alias sound sb
> 	options -k sb io=3D0x220 irq=3D7 dma=3D3,5
> 	alias midi opl3
> 	options -k opl3 io=3D0x388
>=20
> The technical values from these two files are not so consistent, are they=
? :-)
>=20
> I will be very grateful for any hint which may help.
> Thanks in advance, and sorry for the length of this mail.
> --
> ___________________________________________________________
>    ,-~~-.___.      _____      |
>   / |  '     \    /     \     |  Dr. Nikolaos A. Margaritis
>  (  )         0   |      \    |  Agias Marinis 40
>   \_/-, ,----'    | UNIX  |   |  Larissa 41221
>      =3D=3D         \______/    |  Hellas (Greece)
>     /  \-'~;       __|_|__    |
>    /  __/~|  ___  |       |   | =20
>  =3D(  _____| (___)_|_______|   |  email: markoni@otenet.gr
>=20
