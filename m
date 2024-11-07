Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330EE17DE36;
	Thu,  7 Nov 2024 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966091; cv=none; b=j/H73gr4Twyg8yjPl+D+fyaTGghBKjlEsk0Olq/T9CqBrFMVt+nRz58oBWG5ZwYJAHv0kEO/2kjSgIHKxprnv5W/nGX32x5sDogMMl9+wd7qnensh5lPZsVUWRrCiXIDEbw0FaFrHByxhIjmRrjAGvZHbdhgva0lRtgldrN9vlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966091; c=relaxed/simple;
	bh=vBtwOgGWriVqDc6Q6HWYc/Dq+yCVNqLAPtEn0vu3wOo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aRp6rc3XpfmHJHHfdllUwIfpkkUE7YK81iSc4G2qC00+S0Np53QthrnjUy6HghHxhtg6MDaCS5L8dTZyjUkqLHD91TZ0dzjCbBksoAOmqHlSNl8jZ3QSt6kQdWN+Jh/fuqyPsKlM3n+1RklLNCbXFIQ7MjcfRjR0b63/QCOi8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee5672c724518c-e619e;
	Thu, 07 Nov 2024 15:54:46 +0800 (CST)
X-RM-TRANSID:2ee5672c724518c-e619e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee8672c724002c-58b7b;
	Thu, 07 Nov 2024 15:54:46 +0800 (CST)
X-RM-TRANSID:2ee8672c724002c-58b7b
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: ux500: Remove redundant casts
Date: Thu,  7 Nov 2024 15:54:40 +0800
Message-Id: <20241107075440.2770-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function ux500_msp_drv_probe, the 'int' type cast
in front of the PTR_ERR() macro is redundant, thus remove
it.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/ux500/ux500_msp_dai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index a2dd739fd..7798957c6 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -733,7 +733,7 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 
 	drvdata->reg_vape = devm_regulator_get(&pdev->dev, "v-ape");
 	if (IS_ERR(drvdata->reg_vape)) {
-		ret = (int)PTR_ERR(drvdata->reg_vape);
+		ret = PTR_ERR(drvdata->reg_vape);
 		dev_err(&pdev->dev,
 			"%s: ERROR: Failed to get Vape supply (%d)!\n",
 			__func__, ret);
@@ -743,7 +743,7 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 
 	drvdata->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
 	if (IS_ERR(drvdata->pclk)) {
-		ret = (int)PTR_ERR(drvdata->pclk);
+		ret = PTR_ERR(drvdata->pclk);
 		dev_err(&pdev->dev,
 			"%s: ERROR: devm_clk_get of pclk failed (%d)!\n",
 			__func__, ret);
@@ -752,7 +752,7 @@ static int ux500_msp_drv_probe(struct platform_device *pdev)
 
 	drvdata->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(drvdata->clk)) {
-		ret = (int)PTR_ERR(drvdata->clk);
+		ret = PTR_ERR(drvdata->clk);
 		dev_err(&pdev->dev,
 			"%s: ERROR: devm_clk_get failed (%d)!\n",
 			__func__, ret);
-- 
2.33.0



