From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Tue, 16 Apr 2002 16:19:37 +0000
Subject: Re: Compiling ALSA with 2.5.7
Message-Id: <marc-linux-sound-101897407107242@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101896881001154@msgid-missing>
In-Reply-To: <marc-linux-sound-101896881001154@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

"Downing, Thomas" wrote:
>=20
> I am unable to build ALSA for 2.5.7 either as a module or
> built in to kernel.
>=20
> The problem is that ALSA code uses a function virt_to_bus( ).
> This is #defined as virt_to_bus_not_defined_use_pci_map( ).
> So there is an unresolved external.
>=20
> The switch from virt_to_bus( ) to pci_map_*( ) is not obvious.
>=20
> Am I missing something?  I think I must be.  So , is there
> a kernel config option that needs to be set/unset, or is there
> a patch I should get?
>=20
> BTW I tried building 2.5.8, but that failed spectacularly in other
> areas not related to ALSA...  Hmmmm, I've never had kernel build
> problems before, I must be regressing!

i think while you're at it, you should get a more recent kernel, and
be sure to grab the latest alsa packages (0.9.0beta12 at the time of
this writing).
don't go for 0.5.0, they are totally deprecated, even though the web
site still classifies it as the "stable" version.

2.4.19-pre plus latest alsa compiles fine for me.

if you have further problems with alsa, you should join the alsa
user list at alsa-project.org
linux-sound is a OSS list, and there's probably nobody who can
really help you here....

in case you're interested in getting involved in linux audio a
little more, i'd like to invite you to the linux-audio-{user|dev}
lists at http://www.linuxdj.com/audio/lad/

best,

j=F6rn



--
Watch out where the huskies go and don't you eat
the yellow snow !
	- Frank Zappa
