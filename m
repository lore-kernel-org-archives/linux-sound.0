From: saeed bishara <saeed.bishara@gmail.com>
Date: Sun, 07 Mar 2010 15:46:09 +0000
Subject: redundant call to __pxa2xx_pcm_close
Message-Id: <c70ff3ad1003070746u4cc39fa5n27beed0e93e311c8@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,
I've pxa AC79 controller on my soc, and when opening the  AC97 LFE
AC97-1 as input device, the soc_pcm_open() fails on "asoc: AC97 <->
pxa2xx-lfe-ac97 No matching rates" which is ok is the device is
playback only. however, following that error, the
platform->pcm_ops->close(substream) get called which calls
__pxa2xx_pcm_close, but later, the snd_pcm_release_substream()  calls
substream->ops->close(substream) and eventually __pxa2xx_pcm_close
called again. any help?

saeed
