From: Horst von Brand <vonbrand@sleipnir.valparaiso.cl>
Date: Mon, 28 Dec 1998 00:34:17 +0000
Subject: linux-2.1.132ac3: drivers/sound/soundmodule.h fishy
Message-Id: <marc-linux-sound-91483733431253@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

The above file contains a data definition and a function declaration (both
are only shared by soundcard.c and sound_syms.c), a static(!) struct and a
static(!) function. It is included all over drivers/sound. For my setup
(SB16) I get warnings that this later stuff isn't used in soundcard.c and
in sound_syms.c.

Why not split this into two pieces? One that shares the definitions for
soundcard.c and sound_syms.c, the other one to be included elsewhere?

Thanks!
--=20
Horst von Brand                             vonbrand@sleipnir.valparaiso.cl
Casilla 9G, Vi=F1a del Mar, Chile                               +56 32 6726=
16
