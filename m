From: =?ISO-8859-1?Q?J=F6rn_Nettingsmeier?=
Date: Wed, 12 Aug 2009 17:16:03 +0000
Subject: Re: Command line utility to detect sound
Message-Id: <4A82F8D3.5040009@folkwang-hochschule.de>
List-Id: <linux-sound.vger.kernel.org>
References: <24940295.post@talk.nabble.com>
In-Reply-To: <24940295.post@talk.nabble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

NickRob wrote:
> Hi
>=20
> I would like to find a command line utility that will detect sound above a
> certain volume and do something like terminate with a status or issue a
> signal that can be trapped by another process. I haven't been able to find
> anything, but using the words sound and detection together in google leads
> inexorably to sound card detection!
>=20
> Alternatively, which library/app would be the best one to start with if I
> need to adapt something? I'm an experienced programmer, but not with soun=
d.

check out the linux audio developers' mailing list. for your particular
application, grab the swh ladspa plugin set, check out the compressors.
they contain code for envelope followers, which will compute the energy
of a sound signal using the root-mean-square method. rip it out (it's
gpl) and add some C glue around it to tie into your shell scripts or
whatever it is you want to do.

best,

j=F6rn


