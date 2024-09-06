Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC2E1C9DD1;
	Fri,  6 Sep 2024 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725617191; cv=none; b=k+8zOBixzVZg8HQL/CKZas641XbzaEqVH2SgW3VtoYF5MZxFsgnBCRwMSY6xxhJkzZzYNRefkUY8UnA6M6+Z0aAnJQ+ZSazSrJKs5LnZTXj0XJRhwtY6GMnVZo1Yieo1q3lQ/zoPihw0U0gB7d4Wp2rZiLmEbBY86VABZaEo7Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725617191; c=relaxed/simple;
	bh=ps0jaefAM6rDO5urnqpYJAyZT+0VN9xpGoK+7jruFC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tA6n2o3sPw3fOTCM3no0AL6Fpk1FeNlziK2XFeEVKkP4xa9qNfUvlyMukyXvP+fPYFgbL9Qbv3PtkbebYhRpOywDPMwHp0SAOm2gMpzqwz3n/pN7x5BsGj6wKQ/A59OZaRkPchcL3hQPoyVYOphjWgakYt81XTP+teQlimy7i/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee366dad420c31-c7440;
	Fri, 06 Sep 2024 18:06:24 +0800 (CST)
X-RM-TRANSID:2ee366dad420c31-c7440
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from leadsec.example.com (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee866dad41adbb-a3a13;
	Fri, 06 Sep 2024 18:06:24 +0800 (CST)
X-RM-TRANSID:2ee866dad41adbb-a3a13
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: loongson: remove redundant variable assignments
Date: Fri,  6 Sep 2024 18:05:23 +0800
Message-Id: <20240906100523.2142-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function loongson_asoc_card_probe, it is simpler
to return the value of function devm_snd_soc_register_card
directly.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/loongson/loongson_card.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index fae5e9312..98a03ef82 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -192,9 +192,7 @@ static int loongson_asoc_card_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-
-	return ret;
+	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 static const struct of_device_id loongson_asoc_dt_ids[] = {
-- 
2.33.0



