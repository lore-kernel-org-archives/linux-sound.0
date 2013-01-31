From: Bo Shen <voice.shen@atmel.com>
Date: Thu, 31 Jan 2013 03:53:39 +0000
Subject: [PATCH 3/4] ASoC: atmel_ssc_dai: correct sequence when unload
Message-Id: <1359604420-15171-4-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1359604420-15171-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1359604420-15171-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@opensource.wolfsonmicro.com
Cc: plagnioj@jcrosoft.com, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Bo Shen <voice.shen@atmel.com>

correct the sequence when unload this module

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 sound/soc/atmel/atmel_ssc_dai.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 2763aea..1fab8d5 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -780,8 +780,8 @@ void atmel_ssc_put_audio(int ssc_id)
 {
 	struct ssc_device *ssc = ssc_info[ssc_id].ssc;
 
-	ssc_free(ssc);
 	asoc_ssc_exit(&ssc->pdev->dev);
+	ssc_free(ssc);
 }
 EXPORT_SYMBOL_GPL(atmel_ssc_put_audio);
 
-- 
1.7.9.5

