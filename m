From: Daniel Manley <tubadanm@mailandnews.com>
Date: Sat, 03 Jun 2000 06:16:54 +0000
Subject: Re: Sound problems with Realplayer and netscape flash plugin
Message-Id: <marc-linux-sound-96001305332421@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96001207231945@msgid-missing>
In-Reply-To: <marc-linux-sound-96001207231945@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

More info on RealPlayer...

I do get sound out of it if and only if I try:  changing the mod to something other than OSS; hit play
(error popup about device busy); change the mode back to OSS (with custom sampling rates disabled);
hitting play.  Subsequent plays without changing from OSS result in failures.  With those settings, the
trademark realplayer chime sounds ok, but I tried to play a south park episode (from www.spdownloads.com)
using the same steps and the sound is really distored.  Is it a bug with Real?

Dan


Daniel Manley wrote:

> Hi,
>
> I recently installed RealPlayer 8, Beta (stand alone and netscape plugin) and the macromedia flash
> netscape plugin.  Realplayer always complains about the sound device being busy.  I've tried it in all
> three modes (native drivers, OSS and ESD) with the same results.  Plus the flash plugin plays sound at
> high speed.  The animation is fine but sound is too fast.
>
> Any ideas?
>
> Thanks,
> Dan Manley
