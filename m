From: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Date: Tue, 03 Jan 2006 16:29:21 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <200601031629.21765.s0348365@sms.ed.ac.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601031522.06898.s0348365@sms.ed.ac.uk> <20060103160502.GB5262@irc.pl>
In-Reply-To: <20060103160502.GB5262@irc.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomasz Torcz <zdzichu@irc.pl>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tuesday 03 January 2006 16:05, Tomasz Torcz wrote:
[snip]
> >
> > [alistair] 15:20 [~/Music/Led Zeppelin - I] ogg123 -q --device=oss 01\ -\
> > Good\ Times\ Bad\ Times.ogg
> > Error: Cannot open device oss.
>
>  Proper way (using userspace OSS emulation):
> aoss ogg123 -q --device=oss [...]

I'm aware of this.

This has nothing to do with the kernel option CONFIG_SND_OSSEMUL which Jan 
referred to, and to which I was responding. "aoss" is also not compatible 
with every conceivable program.

This is exactly why the OSS emulation option in ALSA is really a last resort 
and should not be an excuse for people to ignore implementing ALSA support 
directly. More so, it is very good justification for ditching "everything 
OSS" as soon as possible, at least in new software.

-- 
Cheers,
Alistair.

'No sense being pessimistic, it probably wouldn't work anyway.'
Third year Computer Science undergraduate.
1F2 55 South Clerk Street, Edinburgh, UK.
