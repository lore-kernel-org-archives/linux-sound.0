From: Neale Banks <neale@lowendale.com.au>
Date: Wed, 17 Jul 2002 05:36:37 +0000
Subject: Re: Status of ALi5451(trident)?
Message-Id: <marc-linux-sound-102688469508103@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102629084116513@msgid-missing>
In-Reply-To: <marc-linux-sound-102629084116513@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi j=F6rn,

> alsa is widely used for 2.2 and 2.4, only you have to compile the
> modules yourself (they are not shipped and built along with the kernel).

OK, it wasn't too painful to compile (only one source tweak).

But I'm still coming to grips with the requirements for "configuring ALSA"
(ALSA may indeed be superior in its capabilities and flexibility, but OSS
is sure nice in its simplicity - just modprobe for your card).

> > I'm somewhat astonished that (a) OSS sound doesn't want to work for me =
in
> > 2.2 and (b) MIDI code appears to be missing from the OSS driver in 2.4.
>=20
> alsa's midi sequencer is really very nice. you can hook just about
> anything together that speaks alsa-seq. check out the kaconnect alsa
> midi patchbay, for instance (suse.de/~mana iirc).
>=20
> give it a try. from your past experience, it can be any worse :)

As you can se from my other post, the problem is that I don't get a MIDI
synth with either OSS or ALSA :-(

Hopefully I've missed something *really* basic.

Thanks,
Neale.

