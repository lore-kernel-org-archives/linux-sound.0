From: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Date: Wed, 04 Jan 2006 00:46:08 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.BSO.4.63.0601040113340.29027@rudy.mif.pg.gda.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-644871101-1136335568=:29027"
List-Id: <linux-sound.vger.kernel.org>
References: <200601031629.21765.s0348365@sms.ed.ac.uk>
 <20060103170316.GA12249@dspnet.fr.eu.org> <s5h1wzpnjrx.wl%tiwai@suse.de>
 <20060103203732.GF5262@irc.pl> <s5hvex1m472.wl%tiwai@suse.de>
 <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com>
 <20060103215654.GH3831@stusta.de> <20060103221314.GB23175@irc.pl>
 <20060103231009.GI3831@stusta.de> <Pine.BSO.4.63.0601040048010.29027@rudy.mif.pg.gda.pl>
 <20060104000344.GJ3831@stusta.de>
In-Reply-To: <20060104000344.GJ3831@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, Takashi Iwai <tiwai@suse.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-644871101-1136335568=:29027
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Jan 2006, Adrian Bunk wrote:
[..]
>> Solaris, AIX ..
>> Full list is avalaible in "Operating System" listbox on
>> http://www.4front-tech.com/download.cgi
>
> As I said in footnote 1 of my email, this has little value for
> application developers since only few users on these systems use this
> commercial sound system.

You are wrong using pejorative labeling "commercial sound system" for=20
this. Comercial is implementation. OSS is defined by user space API.
This is all what was neccessary on implemting this in for Linux.

OSS case on Linux is very simillar to Motiff case on X11.
As same as Motiff OSS have publically avalaible and open specyfication
avalaible on http://www.opensound.com/pguide/oss.pdf which do not touch=20
kernel level implemntations details. Using this specyfication you can
collect all neccessary details for implemt handle /dev/* interface on
kernel side.

kloczek
--=20
-----------------------------------------------------------
*Ludzie nie maj=B1 problem=F3w, tylko sobie sami je stwarzaj=B1*
-----------------------------------------------------------
Tomasz K=B3oczko, sys adm @zie.pg.gda.pl|*e-mail: kloczek@rudy.mif.pg.gda.p=
l*
--0-644871101-1136335568=:29027--
