From: =?iso-8859-1?Q?J=F6rn?= Nettingsmeier
Date: Tue, 18 Jul 2000 11:38:08 +0000
Subject: Re: Ensoniq AudioPCI problem solved
Message-Id: <marc-linux-sound-96394415130517@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96384437322596@msgid-missing>
In-Reply-To: <marc-linux-sound-96384437322596@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

hello dan !

nice to hear you have sound going now !

Dan Lasley wrote:
>=20
> In a recent posting, I asked if anyone knew why Red Hat 6.0 couldn't
> see and configure my Ensoniq AudioPCI sound card.  A number of
> respondents suggested I load the ALSA sound drivers
> (http://www.alsa-project.org/).
>=20
> I thanked everyone who responded (except jay@toltec.metran.cx, who I
> could not reach via e-mail).
>=20
> The ALSA code worked, but eLinux.com, the vendor who sold the AudioPCI
> card, had a better solution:

<snip>

> I loaded the 2.2.16
> kernel and configured sound as:
>=20
>    <M> Sound card support
>    <M> Creative Ensoniq AudioPCI 97 (ES1371)

from a technical POV, ALSA is far superior to the kernel sound
module.
this view is shared by many kernel folks, alan cox among them.
=20
> Now the Ensoniq AudioPCI works with standard Linux components,
> including the X Windows mixer.
>=20
> Dan

as to "standard", ALSA will be the standard Linux audio architcture
in 2.5
they are currently stabilizing the API and didn't make it into 2.4,
but the decision is made.

just FYI, i'm not intending a holy war against OSS :)

but if you use alsa, you can use all oss programs (with the
emulation code) plus all alsa programs.
with oss, you'll miss a lot of good software.

regards,

j=F6rn

--=20
J=F6rn Nettingsmeier    =20
Kurf=FCrstenstr. 49       =20
45138 Essen, Germany     =20
http://www.folkwang.uni-essen.de/~nettings/
