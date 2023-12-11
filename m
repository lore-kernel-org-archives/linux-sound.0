Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756DFBD;
	Sun, 10 Dec 2023 17:33:40 -0800 (PST)
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rCVAg-0004Q6-1V;
	Mon, 11 Dec 2023 01:33:23 +0000
Date: Mon, 11 Dec 2023 01:33:14 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maso Huang <maso.huang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Message-ID: <98491ec78ab671f5a14fce42d10f9745ebddb112.1702258360.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

If probe is defered no error should be printed. Mute it.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index c1390b3734101..24a4b943030d7 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -144,7 +144,9 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
+
 		goto err_of_node_put;
 	}
 
-- 
2.43.0

