From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 18 Oct 2004 14:09:00 +0000
Subject: Re: [Patch 2.6] Sound - Exclude uneeded code when.CONFIG_PROC_FS
Message-Id: <s5h6558jeyr.wl@alsa2.suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <200410151434.53766.michal@rokos.info>
In-Reply-To: <200410151434.53766.michal@rokos.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Rokos <michal@rokos.info>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

At Fri, 15 Oct 2004 14:34:53 +0200,
Michal Rokos wrote:
> 
> Hello,
> 
> I tried to compile without procfs support and I got few "unused code" 
> warnings.
> 
> This patch fixes it.
> 
> Tested by compilation only. (With CONFIG_PROC_FS on and off)
> 
> Michal


Thanks, I applied the patch to ALSA tree.


--
Takashi Iwai <tiwai@suse.de>		ALSA Developer - www.alsa-project.org
