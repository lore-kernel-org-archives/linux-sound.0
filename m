From: Bo Shen <voice.shen@atmel.com>
Date: Tue, 26 Nov 2013 04:17:51 +0000
Subject: [PATCH 1/2] ASoC: atmel: sam9x5_wm8731: fix oops when unload module
Message-Id: <1385439472-23352-1-git-send-email-voice.shen@atmel.com>
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
 sound/soc/atmel/sam9x5_wm8731.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 992ae38..6dc33ac 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -99,6 +99,7 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 	card->owner = THIS_MODULE;
+	card->drvdata = priv;
 	card->dai_link = dai;
 	card->num_links = 1;
 	card->dapm_widgets = sam9x5_dapm_widgets;
-- 
1.7.9.5

