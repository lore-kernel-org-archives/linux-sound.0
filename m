From: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Date: Wed, 04 Jan 2006 14:23:42 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <200601041423.43206.s0348365@sms.ed.ac.uk>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Pete Zaitcev <zaitcev@redhat.com>, kloczek@rudy.mif.pg.gda.pl, Adrian Bunk <bunk@stusta.de>, Olivier Galibert <galibert@pobox.com>, Tomasz Torcz <zdzichu@irc.pl>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, linux-kernel@vger.kernel.org

On Wednesday 04 January 2006 11:35, Jaroslav Kysela wrote:
> On Wed, 4 Jan 2006, Pete Zaitcev wrote:
> > On Wed, 4 Jan 2006 09:37:55 +0000, Alistair John Strachan 
<s0348365@sms.ed.ac.uk> wrote:
> > > > 2) ALSA API is to complicated: most applications opens single sound
> > > >    stream.
> > >
> > > FUD and nonsense. []
> > > http://devzero.co.uk/~alistair/alsa/
> >
> > That's the kicker, isn't it? Once you get used to it, it's a workable
> > API, if kinky and verbose. I have a real life example, too:
> >  http://people.redhat.com/zaitcev/linux/mpg123-0.59r-p3.diff
> > But arriving on the solution costed a lot of torn hair. Look at this
> > bald head here! And who is going to pay my medical bills when ALSA
> > causes me ulcers, Jaroslav?
>
> Well, the ALSA primary goal is to be the complete HAL not hidding the
> extra hardware capabilities to applications. So API might look a bit
> complicated for the first glance, but the ALSA interface code for simple
> applications is not so big, isn't?
>
> Also, note that app developers are not forced to use ALSA directly - there
> is a lot of "portable" sound API libraries having an ALSA backend doing
> this job quite effectively. We can add a simple (like OSS) API layer
> into alsa-lib, but I'm not sure, if it's worth to do it. Perhaps, adding
> some support functions for the easy PCM device initialization might be
> a good idea.

I agree. I see a lot of steam blowing and hot air from people complaining 
about ALSA. Your API is perfectly usable and aptly translates generic issues 
with any sound hardware (such as xruns and hardware buffering) without hiding 
them away so they cannot be manipulated.

The only significant issue with ALSA is the number of tunables that you have 
to set with individual function calls. Personally, I like this approach, but 
I do always end up wrapping them in some structure, so perhaps you could have 
a "quick and dirty" one liner that would either be:

snd_hw_set_params (fd, ... long list of sensible parameters ...)
snd_sw_set_params (fd, ... ditto ...)

Or, take an ioctl approach (which people here seem to love; urgh):

struct hw_params my_hw_params = {
	PCM_LE_16,
	2,
	blah,
};
...

snd_hw_set_params (fd, &my_hw_params);
snd_sw_set_params (fd, &my_sw_params);

I think your time is better spent addressing the issues of "bloat" in the 
kernel side of things (the more code in userspace the better, despite what 
ridiculous statements there have been on this thread to the contrary).

_Documentation_ clearly distinguishing between "sw" paramters and "hw" 
parameters would also be good, as when I first learnt ALSA (some 3 years 
ago), I didn't even know what these were!

-- 
Cheers,
Alistair.

'No sense being pessimistic, it probably wouldn't work anyway.'
Third year Computer Science undergraduate.
1F2 55 South Clerk Street, Edinburgh, UK.
