From: y00444492 <yebin10@huawei.com>
Date: Sun, 19 Jan 2020 02:03:20 +0000
Subject: [PATCH] ASoC: atmel-pcm: Fix build error
Message-Id: <20200119020320.27075-1-yebin10@huawei.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@opensource.wolfsonmicro.com, codrin.ciubotariu@microchip.com
Cc: alsa-devel@alsa-project.org, Ye Bin <yebin10@huawei.com>, linux-sound@vger.kernel.org

From: Ye Bin <yebin10@huawei.com>

If SND_ATMEL_SOC_SSC is y and SND_ATMEL_SOC_PDC is m, building fails:
sound/soc/atmel/atmel_ssc_dai.o: In function `atmel_ssc_set_audio':
(.text+0x6f6): undefined reference to `atmel_pcm_pdc_platform_register'

Select SND_ATMEL_SOC_PDC to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 sound/soc/atmel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index f118c229ed82..78e7d40c3c24 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -19,11 +19,11 @@ config SND_ATMEL_SOC_DMA
 
 config SND_ATMEL_SOC_SSC
 	tristate
+	select SND_ATMEL_SOC_PDC
 
 config SND_ATMEL_SOC_SSC_PDC
 	tristate "SoC PCM DAI support for AT91 SSC controller using PDC"
 	depends on ATMEL_SSC
-	select SND_ATMEL_SOC_PDC
 	select SND_ATMEL_SOC_SSC
 	help
 	  Say Y or M if you want to add support for Atmel SSC interface
-- 
2.17.2
