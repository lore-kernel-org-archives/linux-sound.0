From: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Date: Tue, 03 Jan 2006 14:34:54 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <200601031434.55050.s0348365@sms.ed.ac.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <Pine.LNX.4.62.0601030556370.30559@qynat.qvtvafvgr.pbz> <200601031433.04131.s0348365@sms.ed.ac.uk>
In-Reply-To: <200601031433.04131.s0348365@sms.ed.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lang <dlang@digitalinsight.com>
Cc: Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tuesday 03 January 2006 14:33, Alistair John Strachan wrote:
> On Tuesday 03 January 2006 13:58, David Lang wrote:
> > On Tue, 3 Jan 2006, Andi Kleen wrote:
> > >> Even if Adrian's not trying to make this point (he's just removing
> > >> duplicate drivers, and opting for the newer ones), we accepted ALSA
> > >> into the kernel. It's probably about time we let OSS die properly, for
> > >> sanity purposes.
> > >
> > > Avoiding bloat is more important.
> >
> > given that the ALSA drivers are not going to be removed, isn't it bloat
> > to have two drivers for the same card?
>
> Normally this isn't too big a deal in Linux; eventually one gets removed,
> but not until it is substantially inferior than the other (or broken, or
> not compiling, or unmaintained..).
>
> > yes, an individual compiled kernel may be slightly smaller by continueing
> > to support the OSS driver, but the source (and the maintinance) are
> > significantly worse by haveing two drivers instead of just one.
>
> If there are two separate maintainers it's probably not a lot worse. I
> think the argument pretty much has to remain "ALSA drivers are technically
> superior, OSS drivers have unfixable limitations", and that should be a
> good enough reason to see them removed.
>
> Perhaps Andi's concerns about ALSA bloat could also be concerned. 
							 ^^^ addressed

-- 
Cheers,
Alistair.

'No sense being pessimistic, it probably wouldn't work anyway.'
Third year Computer Science undergraduate.
1F2 55 South Clerk Street, Edinburgh, UK.
