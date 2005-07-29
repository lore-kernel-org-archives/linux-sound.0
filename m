From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 29 Jul 2005 15:16:16 +0000
Subject: Re: [Alsa-devel] Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20050729151615.GD3563@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <Pine.LNX.4.61.0507281636040.20815@tek01.intern.thorsten-knabe.de> <Pine.LNX.4.61.0507290849050.8400@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0507290849050.8400@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Thorsten Knabe <linux@thorsten-knabe.de>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org

On Fri, Jul 29, 2005 at 08:52:45AM +0200, Jaroslav Kysela wrote:
> 
> The problem is that nobody reported us mentioned problems. We have no 
> bug-report regarding the AD1816A driver. Perhaps, it would be a good idea 
> to add a notice to the help file and/or driver that the ALSA driver should 
> be tested and bugs reported to the ALSA bug-tracking-system.

Although it wouldn't have helped with this driver, could you review the 
currently 35 open ALSA bugs in the kernel Bugzilla [1]?

- Some might first require a question to the submitter whether the
  problem is still present in recent kernels.
- Some might be problems in other parts of the kernel
  (e.g. ACPI interrupt configuration problems).
- But some bugs might be bugs still present in recent ALSA.

The Gentoo people are using a pretty easy and nice way for forwarding 
their bugs to the kernel Bugzilla, that would work the following way for 
forwarding Bugs from the kernel Bugzilla to the ALSA BTS:
- open a new bug in the ALSA BTS:
  - short description of the issue
  - more information is at 
      http://bugzilla.kernel.org/show_bug.cgi?id345
- add a comment to the kernel Bugzilla (but leave the bug open):
    this bug is now handled at the ALSA BTS at 
    https://bugtrack.alsa-project.org/alsa-bug/view.php?id#456

You could also do this the other way round if e.g. a ACPI interrupt 
configuration problem was reported to the ALSA BTS.

> 					Thanks,
> 						Jaroslav

cu
Adrian

[1] http://bugzilla.kernel.org/

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

