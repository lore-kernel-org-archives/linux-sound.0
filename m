From: =?ISO-8859-2?Q?Tomasz_K=B3oczko?= <kloczek@rudy.mif.pg.gda.pl>
Date: Tue, 03 Jan 2006 23:10:13 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-212284991-1136329813=:29027"
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031629.21765.s0348365@sms.ed.ac.uk>
 <20060103170316.GA12249@dspnet.fr.eu.org> <200601031716.13409.s0348365@sms.ed.ac.uk>
 <20060103192449.GA26030@dspnet.fr.eu.org> <20060103193736.GG3831@stusta.de>
In-Reply-To: <20060103193736.GG3831@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-212284991-1136329813=:29027
Content-Type: TEXT/PLAIN; charset="iso-8859-2"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jan 2006, Adrian Bunk wrote:

> On Tue, Jan 03, 2006 at 08:24:49PM +0100, Olivier Galibert wrote:
>> On Tue, Jan 03, 2006 at 05:16:13PM +0000, Alistair John Strachan wrote:
>>> This argument is basically watered down with devfs, udev, sysfs, etc. w=
hich
>>> all have exactly the same issues. Should a crippled OSS API be the way
>>> forward for Linux? I think not.
>>
>> And they're getting some real backlash because of that now.  Hell,
>> Linus' message was about udev in the first place.
>
> The udev breakages might not have been nice, but OSS/ALSA is a
> completely different issue:
>
> OSS has been deprecated since ALSA was merged into the Linux kernel
> _four years ago_.

Also more than four years exist another thing: generaly sound suport in=20
Linux kernel is broken by design. Points where it is broken:

1) ALSA API forces not use devices files and many things on sound managing
   level are handled on user space library. This dissallow civilized
   redirection sound stream in runed application without this application
   interractions (try redirect sound stream on runed application for
   example to headset .. simple case skype .. oh you probaly don't know: in
   current ALSA infrastructure there is no civilized way for handle
   gadgests like BT headsets). In current ALSA API (IIRC) you must write in
   special way applications for handle this (look pint 2)).

2) ALSA API is to complicated: most applications opens single sound
   stream.
   All what system user expect it is plaing sound by more then one
   application with simple mixing sound streams. For me ALSA is prepared
   like for handle ANY sound case .. EXCEPT all most simpler.

3) ALSA kernel architecture is to complicated. This main reason why
   configuring sound on Linux is SO COMPLICATED. From my system:

# lsmod | grep ^snd | wc -l
19

   All this for handle ONLY ONE sound card. Why not one alsa main module
   and one with hardware backend module like in comarcial OSS ?

   ALSA is also requires much more bigger code size than OSS variant
   (count all snd* modules size, jackd and libasound and compare this with
   OSS modules and user space OSS library size). Simillar is on allocated
   memory in all system sound components.
   Many task switches incurred by the current ALSA architecture
   add quickly up to perceivalble deleys during processing. In many cases
   sound must be handled with RT piorites so all code sise must possible
   small for handle this with minimal latency.

4) ALSA mixing model is UNSECURE by design because all mixing sound
   streams (for example with diffrent sampling rates) are performed
   in user space.
   Also using jackd also "creates problems" with RTing this proccess and
   much more bigger problems on configure stage (for joe user).
   All this can be handled in secure and proprer RT prioprities
   ONLY on kernel space (so all gaming mith jackd or so is plain waste
   of time). Only on kernel level is possible correctly handle all this.
   With ALSA you can't extend in esy way for example SELinux for prevent
   intercept sound streem from microphone by remote user. Current OSS API
   is much more better for SELinux.
   Why ? because all mixing on OSS is performed on kernel level.

   I can't understand why ALSA developers still do not understands this
   fundamentalt facts.

5) OSS API can be used not only on Linux. ALSA API can be used ONLY on
   Linux.
   This was, still is and (looks like allways) will be main reason
   for not spending so many time as it is required on polish sound
   interractions on Linux applications.
   Still I can't understand why introducing ALSA *must* break OSS user
   space API in so deep way.
   OSS user space API also have some weak poinst on to big complications
   because it allow implemet the same cases in to many forms (for some
   cases it provides more than two ways for handle some scenarios).
   I do not understand why on developing Linux soud support was forgoten
   "don't move .. improve" sentence :>
   OSS API paralelism looks lik was "correctly" implemnted in ALSA .. so
   ALSA do not improves sound handling for user space applications and
   additionaly introduces other own complications (ASA API documentations
   in many cases isn't clear).

Conclution: removing OSS from Linux kernel and force using ALSA in last=20
four years was IMO one of the main resons why Linux still can't=20
effectively fight on desktop area and in future will be/can be one of the=20
most importand weak point which can drive Linux to die at all (in longer=20
period).

kloczek
--=20
-----------------------------------------------------------
*Ludzie nie maj=B1 problem=F3w, tylko sobie sami je stwarzaj=B1*
-----------------------------------------------------------
Tomasz K=B3oczko, sys adm @zie.pg.gda.pl|*e-mail: kloczek@rudy.mif.pg.gda.p=
l*
--0-212284991-1136329813=:29027--
