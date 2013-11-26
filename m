From: Bo Shen <voice.shen@atmel.com>
Date: Tue, 26 Nov 2013 04:17:52 +0000
Subject: [PATCH 2/2] ASoC: atmel: sam9x5_wm8731: remove platform_set_drvdata
Message-Id: <1385439472-23352-2-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1385439472-23352-1-git-send-email-voice.shen@atmel.com>
In-Reply-To: <1385439472-23352-1-git-send-email-voice.shen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, richard.genoud@gmail.com, nicolas.ferre@atmel.com, linux-sound@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org

When call snd_soc_register_card, it will set driver data to this
device through dev_set_drvdata, then in driver, no need to call
platform_set_drvdata again, so remove it.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 sound/soc/atmel/sam9x5_wm8731.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 6dc33ac..4af6836 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -154,8 +154,6 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	of_node_put(codec_np);
 	of_node_put(cpu_np);
 
-	platform_set_drvdata(pdev, card);
-
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev,
-- 
1.7.9.5

