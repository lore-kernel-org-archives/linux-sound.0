From: Bill Nottingham <notting@redhat.com>
Date: Tue, 12 Jan 1999 16:45:44 +0000
Subject: Re: cmi8330
Message-Id: <marc-linux-sound-91616463801783@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91611412508779@msgid-missing>
In-Reply-To: <marc-linux-sound-91611412508779@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Lex Teba (elte@mathematik.hu-berlin.de) said:=20
> I=B4m a Linux user and heard of this Mailing-list from the isapnp-tools.
> I=B4ve got a sound chip on board. It=B4s the cmi8330 (
> http://www.cmedia.com.tw ) Sound pro. It is WSS and SBPro compatible.
> Unfortunately I couldn=B4t find a full duplex sound driver for this card.
> Please help me to find information to let the ALSA project (
> http://alsa.jcu.cz ) be able to write a driver for me. Maybe I=B4m only to
> stupid to initialize the sound chip with the isapnp-tools.

You should be able to get sb16-style full duplex out of it
using the standard kernel drivers in 2.1.late or 2.2, using
the SB driver (basically treating it as an SB16). I don't
think you can get full duplex out of the WSS emulation, though.

Bill
