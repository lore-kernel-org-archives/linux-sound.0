From: "Leonard Milcin Jr." <leonard.milcin@post.pl>
Date: Thu, 05 Jan 2006 12:47:50 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <43BD1576.2050107@post.pl>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de> <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl> <mailman.1136368805.14661.linux-kernel2news@redhat.com> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Jaroslav Kysela <perex@suse.cz>, Pete Zaitcev <zaitcev@redhat.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, linux-kernel@vger.kernel.org

Tomasz K=B3oczko wrote in his signature:
 > -----------------------------------------------------------
 > *Ludzie nie maj=B1 problem=F3w, tylko sobie sami je stwarzaj=B1*
 > -----------------------------------------------------------
 > Allow me translate sentence from my signature to english
 > "People do not have problems they create them themselves"
 > and ALSA case matches in 100%.

Look, kloczek, how less problems we cold have by banishing
all the technology and going back to stone age?

The complexity is sometimes unavoidable if one tries to
please as many as possible. But why not userspace library
that simplifies access to ALSA for those who don't need
all the ,,complexity''? That pleases both -- those who
need feauters, and those who only need to pass something
to speakers. Maybe there are cards that work with OSS and
not with ALSA, and that may be the reason to keep it just
for some time. But in the long run I don't think there is
a need to have two sound systems in kernel just because
one is complicated and other lacks some features.

Leonard
