From: Dave Phillips <dlphilp@bright.net>
Date: Mon, 17 Jul 2000 17:49:44 +0000
Subject: Re: Support not in Linux, but in ALSA
Message-Id: <marc-linux-sound-96385618416855@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96384685629051@msgid-missing>
In-Reply-To: <marc-linux-sound-96384685629051@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Peter Rasmussen wrote:
 
> As ALSA is also GPL, does anyone here know why it hasn't been included into
> the Linux sound subsystem? It looks to me like there is duplicate work going
> on and not necessarily for the benefit of the general Linux user.

A deceptive appearance. OSS/Free development continues with the
occasional improvements and additions to the kernel modules, within the
confines of the OSS/Free API. ALSA is constructing an API that will
"embrace & extend" (did I actually say that ?) the OSS/Free API.
However, the guiding lights at ALSA are very smart people: the ALSA API
needs work in many areas, which is freely admitted. I should also add
that the ALSA drivers are superb even now.
 
> OSS is a commercial company that releases their for profit drivers when they 
> are
> old enough for them not to make any profit anymore (it seems), ergo presently
> the Linux sound system is getting the crums from OSS, when instead we could
> have a very nice looking sound system like ALSA put into the kernel. I know
> there is more than OSS sound drivers in Linux, but those are pretty scarce and
> the cards pretty expensive :-)

Actually OSS (4Front Technologies, to be precise) has nothing to do with
the kernel modules anymore. Kernel sound module support is under the
direction of Alan Cox now.

Just to be clear, your primary sources for sound drivers in Linux
include the kernel modules, the ALSA packages, and the commercial
OSS/Linux from 4Front.

> Is it because of the history of OSS being the first to ever have Linux sound
> drivers, or is it the ALSA team that doesn't want to have their code included
> into Linux proper?

I think ALSA will welcome inclusion into the kernel package, and I
suspect they'll make it in a little while. The team leader, Jaroslav
Kysela, works for SuSe now, and as the API settles there should be more
impetus to include ALSA as the default system.

Also be advised: The ALSA docs need work, so if you want to contribute
to the development, there's a job needing done right there. Furthermore,
the ALSA installation and configuration could be made simpler for the
newbie (though I personally haven't had any problems with it for a
while).

> This is my first encounter ever with ALSA, and I am just wondering if there are
> technical (ALSA doesn't really fit well into Linux proper), managerial 
> (somebody
> has to do the work and nobody can) or political (the ALSA team doesn't like
> the Linux sound guys or vice versa) reasons for it?

I hope I've addressed some of that...

> At least there has to have been some talk about it, but I have never heard it
> and I have not before seen ALSA mentioned a lot here?

The Linux-Sound newsgroup has been focused on the kernel modules
package. ALSA has its own mail-lists for users and developers. Check out
the Linux soundapps pages for more information:

	http://sound.condorow.net

Best regards,

= Dave Phillips

	http://www.bright.net/~dlphilp/index.html
	http://www.bright.net/~dlphilp/linuxsound/
