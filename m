From: Gabor Gombas <gombasg@sztaki.hu>
Date: Fri, 06 Jan 2006 10:34:37 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060106103436.GB24929@boogie.lpds.sztaki.hu>
List-Id: <linux-sound.vger.kernel.org>
References: <0D76E9E1-7FB0-41FD-8FAC-E4B3C6E9C902@dalecki.de> <1136486021.31583.26.camel@mindpipe> <E09E5A76-7743-4E0E-9DF6-6FB4045AA3CF@dalecki.de> <1136491503.847.0.camel@mindpipe> <7B34B941-46CC-478F-A870-43FE0D3143AB@dalecki.de> <1136493172.847.26.camel@mindpipe> <8D670C39-7B52-407C-8BDD-3478DB172641@dalecki.de> <9a8748490601051535s5e28fd81of6814088db7ccac@mail.gmail.com> <A1ECA9D1-29EB-4C44-A343-87B5EAAD4ADA@dalecki.de> <Pine.LNX.4.61.0601060302370.29362@zeus.compusonic.fi>
In-Reply-To: <Pine.LNX.4.61.0601060302370.29362@zeus.compusonic.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannu Savolainen <hannu@opensound.com>
Cc: Marcin Dalecki <martin@dalecki.de>, Jesper Juhl <jesper.juhl@gmail.com>, Lee Revell <rlrevell@joe-job.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Takashi Iwai <tiwai@suse.de>, Adrian Bunk <bunk@stusta.de>, Tomasz Torcz <zdzichu@irc.pl>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Fri, Jan 06, 2006 at 03:36:47AM +0200, Hannu Savolainen wrote:

> There are two very opposite approaches to do a sound subsystem. The ALSA 
> way is to expose every single detail of the hardware to the applications 
> and to allow (or force) application developers to deal with them. The OSS 
> approach is to provide maximum device abstraction in the API level (by 
> isolating the apps from the hardware as much as practically possible).

Well, then it is quite clear to me: you can build an OSS-like interface
on top of ALSA, but you cannot build an ALSA-like interface on top of
OSS. This implies that an ALSA-like interface should be in the kernel,
and an OSS-like interface should be implemented on top of it in
userspace for those who do not need all the features. This way both
camps are satisfied.

Gabor

-- 
     ---------------------------------------------------------
     MTA SZTAKI Computer and Automation Research Institute
                Hungarian Academy of Sciences
     ---------------------------------------------------------
