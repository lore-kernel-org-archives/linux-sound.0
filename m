From: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Date: Wed, 04 Jan 2006 09:37:55 +0000
Subject: [OT] ALSA userspace API complexity
Message-Id: <200601040937.55624.s0348365@sms.ed.ac.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060103193736.GG3831@stusta.de> <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Tomasz =?utf-8?q?K=C5=82oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tuesday 03 January 2006 23:10, Tomasz K=C5=82oczko wrote:
[snip]
>
> 2) ALSA API is to complicated: most applications opens single sound
>    stream.

FUD and nonsense. I've written many DSP applications and very often I can=20
recycle the same code for use in them. Here's an example, abstracted,=20
commented, handling errors from the subsystem, in just over 100 LOC.

http://devzero.co.uk/~alistair/alsa/

The API is really _only_ complicated because it expects you to set things O=
SS=20
either can't handle or doesn't allow you to configure. Things that very oft=
en=20
an application will eventually care about. All this for the sake of 5 minut=
es=20
reading documentation, and each API call almost identical in design.

Personally, I found the lack of documentation for some of the setup API=20
annoying, but it's since been rectified and each call is humanly=20
understandable.

--=20
Cheers,
Alistair.

'No sense being pessimistic, it probably wouldn't work anyway.'
Third year Computer Science undergraduate.
1F2 55 South Clerk Street, Edinburgh, UK.
