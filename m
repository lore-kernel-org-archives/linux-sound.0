From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Fri, 12 Jul 2002 18:03:09 +0000
Subject: Re: Status of ALi5451(trident)?
Message-Id: <marc-linux-sound-102649697824581@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102629084116513@msgid-missing>
In-Reply-To: <marc-linux-sound-102629084116513@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Neale Banks wrote:
>=20
> On Fri, 12 Jul 2002, Joern Nettingsmeier wrote:
>=20
> > Neale Banks wrote:
> [...]
> > > Are you suggesting that the current drivers in 2.2 and 2.4 kernels (O=
SS?)
> > > aren't worth using?
> > >
> > > That is, that I should just give up on those and use ALSA?
> >
> > basically, yes. the oss drivers are probably perfectly ok,
>=20
> 'tis not my experience :-(
>=20
> > but the whole
> > alsa architecture is superior to oss, although more complex. if you just
> > need simple audio playback/recording, oss is fine. for anything more
> > demanding (low-latency operation, multichannel or even full-duplex with
> > some cards), go for alsa.
>=20
> My immediate requirements are fairly mediochre:
>=20
> 1) audio for mpeg video playback
> 2) midi synth for rosegarden
>=20
> > it's going to be "official" soon, it's already in the current
> > development kernel.
>=20
> Yes, ALSA appears to be coming in 2.5 - but my interest right now is in
> 2.2 and 2.4.

alsa is widely used for 2.2 and 2.4, only you have to compile the
modules yourself (they are not shipped and built along with the kernel).

> I'm somewhat astonished that (a) OSS sound doesn't want to work for me in
> 2.2 and (b) MIDI code appears to be missing from the OSS driver in 2.4.

alsa's midi sequencer is really very nice. you can hook just about
anything together that speaks alsa-seq. check out the kaconnect alsa
midi patchbay, for instance (suse.de/~mana iirc).

give it a try. from your past experience, it can be any worse :)

best,

j=F6rn

> I have that awful Arthur Dentish feeling that I've missed something
> here....
>=20
> > btw, there is a linux-audio-user list at
> > http://www.linuxdj.com/audio/lad, in case you have questions concerning
> > which application to choose for a job etc.
>=20
> Not one of my immediate problems, but thanks for the pointer.
>=20
> Regards,
> Neale.
