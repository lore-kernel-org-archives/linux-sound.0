Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087624;
	b=cIMepk9ZAPfYTPna/6Y8vUyp3URNt4/L446zOSQ+lMtICo59Sh34WYzxxC2OFMtGMLMv
	 DDox/YPAFUA14fUkFTmRGX4wqz87gJAFK8SglLlzVm3lAFYmj8FTbbrrcxUp/Naf2yWBn
	 Z1c2CbRoukgX9nXSJA+cwNHhCWsubTTtF8bN6jSwQl4JJM/SIxnYc0eu/bJw1L8tR4Eyl
	 J/lqlO4y5gmZ0rfMywbc32trwVxyk90WL6IPCFRjlnQDtVeicjV2+vcq/wEZ/btbR8nO+
	 KNCAWT5FeOmzaWd8KNNhnlY7GV9bAaDLcObhT6SskrSxEAeqCvFCENKWBi90qr3mQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087624;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=CWYyS7fMhQxYGF99XGPDQspqB9StZSQkio7Afy5g6d0=;
	b=sKWPuJwSPWmj0Hs37oLM1/cYZd8qTy0nze8kBVPPXUyLu4kkylwNeDkCJOEKnngKY+33
	 IaqRaRXwtJCP+4HX+IlkqjRtPOr5QMaUU6XHspd9h5IG/gkMjKWbFGYU8ztByA0jNf1kj
	 Im4aC7CpeCCIKsJyKTLz+ESsiGLIz2+N2crHZDSsR5PWgjfHrdbQIDVB1HsUek8rZuD/I
	 l/eHw8WVAGPrEas0Hbkovsl7Toz+c4AWVBLGJ8XndfiIIbVIgO4a6J1HGJJwVSKgul7+P
	 F3HlQQKJeO5qTrzVf4D+qx1Jnz+tWLz3++iSnMeNIfYuodxhkNV6oKdzlL+zBgFDuqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.175
Received: from r3-175.sinamail.sina.com.cn (r3-175.sinamail.sina.com.cn [202.108.3.175])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD295606A32A
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 11:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD295606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([112.64.39.13])
	by sina.net (10.54.253.38) with ESMTP
	id 6AFEDCF800002D23; Thu, 19 Nov 2026 19:26:53 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 484C1E6DC73742D5ACF86BA76C8DDCBC
X-SMAIL-UIID: 484C1E6DC73742D5ACF86BA76C8DDCBC-20261119-192653
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 4/4] ASoC: codecs: ES8326: Adjust the delay during calibration
Date: Thu, 19 Nov 2026 19:26:47 +0800
Message-Id: <20261119112647.6728-5-zhangyi@everest-semi.com>
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

During calibration, it is necessary to wait until the CSM reaches 'normal'
before continuing with the calibration; otherwise, pop noise will occur.
However, 50 ms is not enough for the CSM to reach 'normal'.
testing has shown that 200 ms is required.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 8265dc0629a3..23e6f2c888ff 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1155,7 +1155,7 @@ static int es8326_calibrate(struct snd_soc_component *component)
 		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, ES8326_HP_OFF);
 		regmap_read(es8326->regmap, ES8326_CSM_MUTE_STA, &reg);
 		if ((reg & 0xf0) != 0x40)
-			msleep(50);
+			msleep(200);
 
 		regmap_write(es8326->regmap, ES8326_HP_CAL, 0xd4);
 		msleep(200);
-- 
2.17.1

