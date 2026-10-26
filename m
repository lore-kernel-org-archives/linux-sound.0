Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993733;
	b=vZVUvYrU1Rdb8pyVjM77tNndqaWBMFILtmv4eeqQ9xs/+BG4wF606kstfPF4HcH4xdm+
	 WP8EFAzLjSAhXR2vYlO9f+rLiSti9PkdrUIpAujL3LGFsEbHTAx0xz1Kxho1UklJFjIi0
	 Iam+wLi4VLqXSXJCtHGpViLCFvG5VRPqNaSiUfBJM+Hpnh810cvXfni7MnzKrZOnmRvGW
	 vb5xCjsS0iCpa6/S9gSJeqUHmE86SUEuLmRyaUaLl5Hqi+PeDf0OXwIQmolB2Qfhz6Wcg
	 Mk+jRw7vI5V0VTH/wZbrbXc1kDtV28ERDOWD+NlqgqsLRvvLlMa0dP+kZwNawp1JvLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993733;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=KxdZslhNv4gavmQtS3qZqDGXsqgjEn72toOyYZSax38=;
	b=cz6/B059eDV5fnebxb6BA3XaNEeKWUeizfDucChayBUD4r/Yyf3cn5t9WnNx/2wgGcDs
	 5hacXW3ikY6NEFSTnocczf21rhwVHqfNuehoKegSg43gAneSdQybhJPaQE3dRy5Ultpz0
	 i3jbF7QRr/DJmA/kPfnp4ac9kClXqiQcB/KvUWX1wSqwaasZmVIygRbZ4TXJWHPd15/dn
	 WbcVFmnAre2b7QZaQYkRH3cRes0hhBqIaAB7nb2ZhNBs3HXMaj5ByGhbJ8J0IH1x6RHRh
	 sE/S4YAXEkik4JMLww3aTApg8rAqwuRY2Dc8sBlGcitQWJgrLPXChmi5HbGFaDAciHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.89
Received: from r3-89.sinamail.sina.com.cn (r3-89.sinamail.sina.com.cn [202.108.3.89])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF323606A31E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 05:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF323606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 6ADEE9B80000797E; Mon, 26 Oct 2026 13:48:43 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0BB0F40ECEE64BF3A09C71221E2D1405
X-SMAIL-UIID: 0BB0F40ECEE64BF3A09C71221E2D1405-20261026-134843
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	sammiee5311@gmail.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 2/2] ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN
Date: Mon, 26 Oct 2026 13:48:37 +0800
Message-Id: <20261026054837.13618-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026054837.13618-1-zhangyi@everest-semi.com>
References: <20261026054837.13618-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The Kcontrol related to DMIC_GAIN affects bits[3:2].
However, the old code sets ES8375_DMIC_GAIN_MAX to 4, which causes the Kcontrol to
affect bits [4:2],this is incorrect. Therefore, change ES8375_DMIC_GAIN_MAX to 3.

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")
Reviewed-by: HyeongJun An <sammiee5311@gmail.com>
Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8375.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8375.h b/sound/soc/codecs/es8375.h
index b48d03b1f..de133437c 100644
--- a/sound/soc/codecs/es8375.h
+++ b/sound/soc/codecs/es8375.h
@@ -94,7 +94,7 @@
 
 // Function values
 #define ES8375_ADC_OSR_GAIN_MAX         0x3F
-#define ES8375_DMIC_GAIN_MAX            0x04
+#define ES8375_DMIC_GAIN_MAX            0x03
 #define ES8375_ADC_AUTOMUTE_ATTN_MAX    0x1F
 #define ES8375_AUTOMUTE_NG_MAX          0x07
 #define ES8375_ADC_VOLUME_MAX           0xFF
-- 
2.17.1

