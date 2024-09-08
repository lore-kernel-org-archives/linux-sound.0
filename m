Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E220716DC11;
	Sun,  8 Sep 2024 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725803193; cv=none; b=dUGdMBTUOZOVBrYx0vQ+fDMCwEksHAUBeh4nmKQ5IvTohRSw74K9juXa2bJLTGy5/dSZfiks9tRR+HWlsvoa/nzV2Y57WfTvGjOds7MYhqNWoaf4ESKIjesHsjzb8yOhK6xOvorabe15mcj5/rREQu4GRBmtpg5cmWoJZAv2+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725803193; c=relaxed/simple;
	bh=Y65ERdp0kSFK9VlrOjPm3iFK6lXsXu7/1Mdev2VPXks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TcHGv/kkDNS85lyE0VTLJx92nlMkqNzR2kRJ1eJ0gu9hboYHA/V+NAjPJmYQvuoeXnyhz4NTmKW8bYOxSm1lWCsBrkpb+Qtl2iNS5kFNugdoUhL/DeVbxi0VBTisotn7/xkqoBjDGbyMgY8xP6q7CqnyqSTMvIiDIQ1FrxLB494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee466ddaaac5be-d3eb3;
	Sun, 08 Sep 2024 21:46:20 +0800 (CST)
X-RM-TRANSID:2ee466ddaaac5be-d3eb3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from 192.168.102.140 (unknown[223.64.113.255])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee466ddaa9ebd6-10a89;
	Sun, 08 Sep 2024 21:46:20 +0800 (CST)
X-RM-TRANSID:2ee466ddaa9ebd6-10a89
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: codecs: fix the right check and simplify code
Date: Sun,  8 Sep 2024 21:46:04 +0800
Message-Id: <20240908134604.3652-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the file drivers/base/platform.c, the return description of
platform_get_irq is 'non-zero IRQ number on success, negative
error number on failure.', so the check is wrong, fix it. And
when get irq failed, the function platform_get_irq logs an error
message.

Fixes: 5e2404493f9f ("ASoC: codecs: add MT6357 support")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index df6dd8c5b..4ec86b71d 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2155,11 +2155,11 @@ static int mt8365_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < afe->irqs_size; i++)
 		afe->irqs[i].irq_data = &irq_data[i];
 
-	irq_id = platform_get_irq(pdev, 0);
-	if (!irq_id) {
-		dev_err_probe(afe->dev, irq_id, "np %s no irq\n", afe->dev->of_node->name);
-		return -ENXIO;
-	}
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	irq_id = ret;
 	ret = devm_request_irq(afe->dev, irq_id, mt8365_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-- 
2.33.0



