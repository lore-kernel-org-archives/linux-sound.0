From: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Date: Thu, 05 Jan 2006 23:44:02 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.BSO.4.63.0601052352110.15077@rudy.mif.pg.gda.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1094550868-1136504642=:15077"
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de>
 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
 <43BDA02F.5070103@folkwang-hochschule.de>
In-Reply-To: <43BDA02F.5070103@folkwang-hochschule.de>
To: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, ALSA development <alsa-devel@alsa-project.org>, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, LKML <linux-kernel@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1094550868-1136504642=:15077
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Jan 2006, Joern Nettingsmeier wrote:
[..]
> i look forward to hearing back from you, in, oh, 2015 or so?

Now we have 2006. Four years ALSA is in kernel tree.
2015 - 2006 =3D 9
4 < 9

Four years ago noone predisct some "temporary sound devices" like BT=20
headests in ALSA architecture (bt-sco was developed in 2002 and still=20
isn't merged in ALSA tree .. probably because module in current form can't =

provide simple usage like "just plug and play").
This is not matter of any kind prediction because on market four=20
years ago was avalaible some "temporary sound devices". BT headsets=20
are real and still IIRC there is no way in current ALSA architecture point =

where and how this must plugged.
Why ? Because most of soud stream routing are performed in user space=20
library abstraction. For handle this in current ALSA model you must=20
prepare EACH application for reciveing signals about for examaple=20
changing default soud device (for perform close old and open new). In ALSA =

there is no layer where this kind of redirections can be managed outside=20
ALL applications in common and easy way for non-root users

Q: why Linux can't behive as it will have allways soud device with dummy=20
device plugged to /dev/null (if only soudcode is loaded) if there is no=20
soud hardware in system ? Look .. if you have loaded event module you have =

virtual kbd and mouse .. but real kbd/mouse can be used only afrer load=20
keyboard/mouse modules.

Instead try to manage any kind of (even future) devices it will be good if =

ALSA will be ready for manage only current "sound model devices" (like=20
mono, stereo, 5.1, 7.1 with simple way for extending set of this profiles) =

but with *moved all sound routing* to kernel space with well defined=20
ioctl() or netlink (like in ipfilter) API for manage all configuration=20
details (for allow prepare for example cute GUI aplication for manage all=20
this for joe users). In this way also will be possible prepare some kernel
level interface for plugging additional modules (or loading external DSO=20
modules like in ipfilter for interract with with hardware in any other
way. Apply ipfilter way to soud subsystem can be also used for plugging
filters ..

So .. stop talking about future and start about preset problems. ALSA have =

many problems with current devices (on soud subsystem *architecture level*)

kloczek
--=20
-----------------------------------------------------------
*Ludzie nie maj=B1 problem=F3w, tylko sobie sami je stwarzaj=B1*
-----------------------------------------------------------
Tomasz K=B3oczko, sys adm @zie.pg.gda.pl|*e-mail: kloczek@rudy.mif.pg.gda.p=
l*
--0-1094550868-1136504642=:15077--
