From: Bo Shen <voice.shen@atmel.com>
Date: Tue, 03 Dec 2013 10:04:54 +0000
Subject: [PATCH] ASoC: wm8731: fix dsp mode configuration
Message-Id: <1386065094-26018-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org
Cc: Bo Shen <voice.shen@atmel.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org

According to WM8731 "PD, Rev 4.9 October 2012" datasheet, when it
works in DSP mode A, LRP = 1, while works in DSP mode B, LRP = 0.
So, fix LRP for DSP mode as the datesheet specification.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 sound/soc/codecs/wm8731.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 456bb8c..bc7472c 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -447,10 +447,10 @@ static int wm8731_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		iface |= 0x0001;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		iface |= 0x0003;
+		iface |= 0x0013;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		iface |= 0x0013;
+		iface |= 0x0003;
 		break;
 	default:
 		return -EINVAL;
-- 
1.7.9.5

