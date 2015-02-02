From: Bo Shen <voice.shen@atmel.com>
Date: Mon, 02 Feb 2015 06:44:46 +0000
Subject: [PATCH] ASoC: atmel-pcm-dma: won't check direction when configure dma
Message-Id: <1422859486-11051-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: nicolas.ferre@atmel.com, Ludovic.Desroches@atmel.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Bo Shen <voice.shen@atmel.com>

As DMA framework request DMA using direction only in prep_slave
function, (The At91 xdma driver has adapted to this request).
So won't check direction when do DMA configuration.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---

 sound/soc/atmel/atmel-pcm-dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 33fb3bb..b8e7bad 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -105,13 +105,11 @@ static int atmel_pcm_configure_dma(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	if (substream->stream = SNDRV_PCM_STREAM_PLAYBACK) {
-		slave_config->dst_addr = ssc->phybase + SSC_THR;
-		slave_config->dst_maxburst = 1;
-	} else {
-		slave_config->src_addr = ssc->phybase + SSC_RHR;
-		slave_config->src_maxburst = 1;
-	}
+	slave_config->dst_addr = ssc->phybase + SSC_THR;
+	slave_config->dst_maxburst = 1;
+
+	slave_config->src_addr = ssc->phybase + SSC_RHR;
+	slave_config->src_maxburst = 1;
 
 	prtd->dma_intr_handler = atmel_pcm_dma_irq;
 
-- 
2.3.0.rc0

