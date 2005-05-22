From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Sun, 22 May 2005 09:19:55 +0000
Subject: Re: ALSA and Rexima/Aumix??
Message-Id: <42904EBB.3050305@folkwang-hochschule.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050521183715.GA750@lnx2.w8mch.ampr.org>
In-Reply-To: <20050521183715.GA750@lnx2.w8mch.ampr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hal MacArgle wrote:
> Greetings: In the process of changing over my Slack9.1 machines from
> default OSS to ALSA I find I lose two of my favourite Mixers; Rexima
> and Aumix.. 
> 
> I've been using alsamixer but it's too powerful for simple quick
> volume adjustments, etc.. I would like to use a simple/lean mixer...
> 
> I've installed all four ALSA packages: alsa-driver/lib/oss/utils but
> I still get a "rexima: couldn't open /dev/mixer" when invoked.. Same
> thing with Aumix..

modprobe snd_mixer_oss

will install the oss mixer api compatibility module. you can then use 
any oss-based mixer to access the basic mixing capabilities of most 
consumer soundcards.



