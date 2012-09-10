From: Bo Shen <voice.shen@atmel.com>
Date: Mon, 10 Sep 2012 09:50:33 +0000
Subject: [PATCH] ASoC: wm8904: remove redundant code
Message-Id: <1347270633-11091-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@opensource.wolfsonmicro.com
Cc: alsa-devel@alsa-project.org, Bo Shen <voice.shen@atmel.com>, linux-sound@vger.kernel.org

The core_intercon is added two times, remove the redundant one

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 sound/soc/codecs/wm8904.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 0013afe..2b9766d 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1185,8 +1185,6 @@ static int wm8904_add_widgets(struct snd_soc_codec *codec)
 		snd_soc_dapm_new_controls(dapm, wm8904_dapm_widgets,
 					  ARRAY_SIZE(wm8904_dapm_widgets));
 
-		snd_soc_dapm_add_routes(dapm, core_intercon,
-					ARRAY_SIZE(core_intercon));
 		snd_soc_dapm_add_routes(dapm, adc_intercon,
 					ARRAY_SIZE(adc_intercon));
 		snd_soc_dapm_add_routes(dapm, dac_intercon,
-- 
1.7.9.5

