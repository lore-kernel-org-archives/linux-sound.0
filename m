From: Jonathan Oppenheim <jono@Phys.UAlberta.CA>
Date: Tue, 04 Apr 2000 05:28:05 +0000
Subject: Re: Recording with anything?
Message-Id: <marc-linux-sound-95482643820355@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95480718509450@msgid-missing>
In-Reply-To: <marc-linux-sound-95480718509450@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

using aumix didn't seem to help (SLAB for example, allows me
to change the same settings)

many people seem to be able to use the soundblaster live card,
so i don't think it is because of bad drivers (although maybe ours
is not configured right).

i installed mandrake-complete 7.0 which loaded the drivers in

during boot, the card is detected, and when i ran sndconfig,
it had no problem playing me a nice sample and finding the card.

the only thing that gives me pause, is that when i type

cat /dev/sndstat
i get (among other things):
Card config:
(Sound Blaster Live! at 0xcc00 irq 9)

apparently the brackets mean that the card was configured but
not detected (according to the sound how-to)???

and yet, when i boot up, i get a message saying that the sound card
was detected.

i really can't figure out what is going wrong.

any help would be appreciated.

jonathan


On Mon, 3 Apr 2000, Paco wrote:

Hi...

I've got the SB PCI512, which uses the same chipset as the Live!,=20
and I've got the same problem.  No matter what I do I am unable
to record a thing.  I don't think the support for the emu10k1
chip is quite up to speed yet, but...

Which drivers are you using?

If you're using OSS/Commercial drivers (like I am), you should
write to 4front technologies and tell them.  I've had some long
talks with them , but they just keep gauranteeing me that the
drivers work fine.

You can get the address form their website: http://www.opensound.com

If you're using the ones from Creative Labs themselves (via ALSA),
well... I'v never gotten those to do anything for me... not even
play audio.

I just think our cards are a bit too new for Linux.  8^)

peace,
-Paco

Jonathan Oppenheim wrote:
>=20
> i cannot record anything, although no trouble
> hearing sound through both the mike and line in.
>=20
> no program seems to want to bother even trying to record.
>=20
> for example, SLAB, just sits there, with the counter stopped
> at 0 after pushing the REC PAUSE and then the PLAY button.
> I can hear myself play, but it makes no attempt to record any sound.
>=20
> Likewise, using kvoice, i push record, in the new greeting dialogue
> box, and the new greeting message window just disappears, and that's it.
>=20
> i also try typing "dd bs=3D8k cound=3D4 </dev/audio > sample.au"
>=20
> this creates the file sample.au but the file is empty
> (at least, i see nothing when i type "more sample.au" or "kedit
> sample.au", but it must have something in it, because it is 32768 bytes
> long)
>=20
> i have a soundblaster live! card, under mandrake 7.0
> when i configured the card (using sndconfig) it found
> the card without any problem.
>=20
> perhaps an interupt problem??
>=20
> any help would be appreciated.
>=20
> thanks,
> jonathan


-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: 2.6.2

mQCNAzc5/rwAAAEEALGi/cKupURWMeRs3xKx7+3PHi1hqfswOuM5suJhTEJZiR+p
xYsVYB/B/uNwrr+m+Rzd8sEJlB2D/JkkCHMUplDR2OC0hfUYmQGIXEg9kShudRsO
E+1oVFFevj6MTgIY6c5nSWvz3n+zLHrcHk/k8pLDpI6qcIGqrAEcX2GVzVwNAAUR
tARqb25vtBU8am9ub0BwaHlzaWNzLnViYy5jYT4=FDxR
-----END PGP PUBLIC KEY BLOCK-----
