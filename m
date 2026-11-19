Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087624;
	b=cLdft0iGD+FqOb+6G/Qd0HZ4lz0zUuNYMjD/BLtJR7Uu2v6UK6nDyWlLE49cy51x3ySW
	 mONaH5WLXb/UQFcC7yBb+uzAbOxP3vdxD4Mo4k5ypLmsNCFRAOxq9WybRSNfp+knKavRO
	 jz8jXy2YHC/aSCPa6zC0TNvouHqOi/twtTIfZQqXHXPmogvN7/eZxiq9lPHkBkdeYqY49
	 DAQUHYebvsAAbtHDv2Cq2EZi1D7pjiOmIolxuXyw3OmrCtdaBt5gE0UTj0WOHpl8yiAZZ
	 HyPDJjd4EIDgeaDjfxKl5yVTZvIXLntXd8kc9izAFW7xI+CLUdM66y1UZ17UoWrIAaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087624;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=np4QLxTXn+VRCerdcySTcxG75MyhVfC0c++v9/f7ax4=;
	b=vSXvNtQGuWr4DKqYhXLiR8NhloDBbjpN64awTppTuzj+gtmtqVENEPfq5UdXl9v5rDYv
	 tYI4mJzybzzuyxpg/Q6+I5mkAPfnTRsxgFncbvL9O9hlYii7G71/gjBECpixZAqV6Uz+B
	 aDwauAFmzIj4jZBnB5X0kDir3/pJnO5o/Z/KVIOZH2OjCKok4ewyTfOVCqdB7tIlHgvSs
	 oN9tVmYPma3Gg53ePtUQTLLcQc5sYmnu6RRyLxonvZMidilgRHXMY7EnCpuNVzp/j9LFF
	 WYZGaODUut1GdJh9+nX1pCJGvfOOzqqEzG8MTXDioKOpak6nF+CiiPriSZCh9ubeRNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.176
Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F097606A325
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F097606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([112.64.39.13])
	by sina.net (10.54.253.38) with ESMTP
	id 6AFEDCF800002D23; Thu, 19 Nov 2026 19:26:52 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 130C38D4B7EF41EEB8A49AFBAFCB08EC
X-SMAIL-UIID: 130C38D4B7EF41EEB8A49AFBAFCB08EC-20261119-192652
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 3/4] ASoC: codecs: ES8326: Modify the Initialization Configuration
Date: Thu, 19 Nov 2026 19:26:46 +0800
Message-Id: <20261119112647.6728-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261119112647.6728-1-zhangyi@everest-semi.com>
References: <20261119112647.6728-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Modifying the HPF configuration during initialization

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index f8a6769d0d6e..8265dc0629a3 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1256,6 +1256,8 @@ static void es8326_init(struct snd_soc_component *component)
 		regmap_update_bits(es8326->regmap, ES8326_ANA_MICBIAS, 0x73, 0x10);
 		regmap_update_bits(es8326->regmap, ES8326_VMIDSEL, 0x40, 0x40);
 	}
+	regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS1, 0x0f, 0x04);
+	regmap_update_bits(es8326->regmap, ES8326_ADC_HPFS2, 0x0f, 0x04);
 
 	msleep(200);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE, ES8326_INT_SRC_PIN9);
-- 
2.17.1

