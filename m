From: Zach Brown <zab@zabbo.net>
Date: Mon, 01 Jul 2002 16:07:40 +0000
Subject: Re: [PATCH] 2.4.18 linux/drivers/maestro.c dev_audio flaw
Message-Id: <marc-linux-sound-102553992208473@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102550820111554@msgid-missing>
In-Reply-To: <marc-linux-sound-102550820111554@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> It seems that the value of ess->dev_audio is wrongly interpreted. 

Thanks for attacking this driver, Samuel.  Your patches have looked good
so far.  I'm sorry I'm not more involved; its been quite a while since
I've futzed about with the maestro(s).

You may want to cc: your fixes to Takashi Iwai <tiwai@suse.de> , who
actively maintains the ALSA equivalent drivers.  He'll have a much
greater chance of affecting change than I do :)

- z
