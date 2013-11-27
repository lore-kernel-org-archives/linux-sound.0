From: Bo Shen <voice.shen@atmel.com>
Date: Wed, 27 Nov 2013 10:05:09 +0000
Subject: [Patch v2 1/2] ASoC: atmel: sam9x5_wm8731: fix oops when unload module
Message-Id: <1385546710-11308-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, richard.genoud@gmail.com, nicolas.ferre@atmel.com, linux-sound@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org

As the priv is not assigned to card->drvdata, it is NULL, so when
unload module, it will cause NULL pointer oops.
Assign priv to card->drvdata to fix this issue.

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
Change in v2: 
  - using snd_soc_card_set_drvdata()
---
 sound/soc/atmel/sam9x5_wm8731.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 992ae38..1b37228 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -97,6 +97,8 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	snd_soc_card_set_drvdata(card, priv);
+
 	card->dev = &pdev->dev;
 	card->owner = THIS_MODULE;
 	card->dai_link = dai;
-- 
1.7.9.5

