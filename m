From: "D. Marcus Johnson" <schwaahed@yahoo.com>
Date: Tue, 11 Jul 2000 19:01:14 +0000
Subject: Re: Ensonic AudioPCI sound card problems
Message-Id: <marc-linux-sound-96334256006442@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96332630904955@msgid-missing>
In-Reply-To: <marc-linux-sound-96332630904955@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hi I have ALSA 0.5.7 with my EnsoniqAudioPCI(1371). It
works like a charm for me. The set up is similar to
get a (1370) type card,*So I've Heard*!
     If I we're you I would check the alsa user list
archives. It should get you set along with the
included documentation if you choose to install the
ALSA drivers.
    *Warning* the hardest parts for me was you will
need to compile a Kernel with *Only* sound support and
no other audio options for the drivers compiled in. In
addition the configuration file--> /etc/modules.conf
confused the hell out of me, but I beleive there is an
ens1370 or 1371 HOWTO in the list archives that will
lead you through the process step by step.

-Good Luck
Darwin

--- Dan_Lasley@hilton.com wrote:
>=20
>=20
> I have an old, scrounged Aztec ISA sound card that
> works just fine in a
> Gateway P5-133.  I bought an Ensoniq AudioPCI and I
> can't make it
> work!
>=20
> I'm using Red Hat Linux 6.0 and I'm trying to
> install the sound card
> with "sndconfig".  sndconfig worked like a charm for
> the old sound
> card, but I've tried the following configurations
> with the new card
> and neither will work:
>=20
>      Ensoniq AudioPCI 1370 (SoundBlaster 64/128 PCI)
>=20
>      Creative/Ensoniq AudioPCI 1371
>=20
> I get this error for the first:
>=20
>      The following error occurred running the
> modprobe program:
>      /lib/modules/2.2.5-15/misc/es1370.o:
>      init_module: Device or resource busy
>=20
> And this error for the second:
>=20
>      The following error occurred running the
> modprobe program:
>      /lib/modules/2.2.5-15/misc/es1371.o:
>      init_module: Device or resource busy
>=20
> I don't find any other information in
> /var/log/messages.
>=20
> I am using the kernel which comes with Red Hat 6.0,
> so it should have
> support for all known sound cards.  Again, I had
> *no* problems in
> configuring and running another sound card in this
> system.
>=20
> I've checked /usr/src/linux/Documentation/sound/*
> and I found no
> help on this particular sound card.
>=20
> Can anyone furnish a clue?
>=20
> Thanks.
>=20
> Dan
>=20
>=20


__________________________________________________
Do You Yahoo!?
Get Yahoo! Mail =96 Free email you can access from anywhere!
http://mail.yahoo.com/
