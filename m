From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Wed, 04 Jan 2006 12:13:51 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <43BBBBFF.5020209@folkwang-hochschule.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk> <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk> <20060103192449.GA26030@dspnet.fr.eu.org> <20060103193736.GG3831@stusta.de> <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
In-Reply-To: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Cc: Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org



Tomasz K=B3oczko wrote:
> Also more than four years exist another thing: generaly sound suport
> in Linux kernel is broken by design. Points where it is broken:
>=20
> 1) ALSA API forces not use devices files and many things on sound
> managing level are handled on user space library. This dissallow
<snip>
> 2) ALSA API is to complicated: most applications opens single sound=20
> stream. All what system user expect it is plaing sound by more then
<snip>
> 3) ALSA kernel architecture is to complicated. This main reason why=20
> configuring sound on Linux is SO COMPLICATED. From my system:
<snip>
> ALSA is also requires much more bigger code size than OSS variant=20
> (count all snd* modules size, jackd and libasound and compare this
> with OSS modules and user space OSS library size). Simillar is on
<snip>

oh yeah. why is linux so fscking big? my olde msdos would fit on one=20
floppy. whiiine.

what a load of crap. alsa is a serious architecture meant for serious,=20
maximally efficient usage with all kinds of (wildly different) hardware.

desktop stuff and "you have mail" beeps are a fscking corner case.

this is like whining about the oh so complex networking infrastructure=20
and iptables and constantly reminiscing how simple it used to be to set=20
up a modem on /dev/ttyS0.

get real.


--=20
j=F6rn nettingsmeier

home://germany/45128 essen/lortzingstr. 11/
http://spunk.dnsalias.org
phone://+49/201/491621

if you are a free (as in "free speech") software developer
and you happen to be travelling near my home, drop me a line
and come round for a free (as in "free beer") beer. :-D
