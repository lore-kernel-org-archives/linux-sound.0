Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721360;
	b=WgQu/a5uU2/2hD4jci0na5nNtVWH9gS7lzPxTidbMPLv3K6cmq7YxCOWJYiLfFg0f2kn
	 MIhYu5GkshEaub23Dwua6StXlzeq/uCPTxMSHk8mbrMdmZqgu4VcMtxGXXwNhY6CV2Wkz
	 9xEzahROfb1aTn7/gSNLLIa48fGPg3TkILcn/vOJyvB/HXlPjcwRdG0D/ZQKhD83q/5h4
	 ej75E86EIeGOTO2giR6QUV081XE/LeZvgcQ70mI9j9UItqfPW3aYBwgtvQuin7vd6o3qi
	 KdJi5SSdVVZD4Ko26VlsRBJn/SfnVS6IyN5Gxch2AbSiV/y4UQSfi2As06z8jNPy/ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721360;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=8lb1J2XNsEL39FQlMqRphDUgugeDml61MMyc9BJ0Iwg=;
	b=g1blsZ9fXcW8IyPkaukH9kPUBgsjS5WDvALMIuC7FSvVN4mldvfXfkS7k+tBs8qsa29o
	 u465vVXtqdyrmwvwk7zXyLxIiprUQHi/ybPeq2tiQ6/dIKpE1ZB1rOJ886y/pDYKIzrpY
	 x/C6euH7lCO6s5nut3DPTXbrFQlIj1KtV94DOVn/76FIyPiPBcodg5DJmTcbFco6eVy5D
	 Qui/vrqpUr+Lpfi3+IYasT72IV4kRmJVziO+dNzC15SwerD4A+e2zA0r9WClf44bCt3KG
	 THogGQWeCrPJsrFeJrPaoO1Wl3ztDoQIexcYlcL6u9Y4InKbIKmCVwhc9Myh7LKKiuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.71
Received: from r3-71.sinamail.sina.com.cn (r3-71.sinamail.sina.com.cn [202.108.3.71])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484D606A31F
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2484D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6ADAC1C4000078B5; Fri, 23 Oct 2026 10:09:10 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 251639D9169F424F96FC4A4342F68B8A
X-SMAIL-UIID: 251639D9169F424F96FC4A4342F68B8A-20261023-100910
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/2] ASoC: codecs: es*: Modify the maximum value of DMIC_GAIN
Date: Fri, 23 Oct 2026 10:09:06 +0800
Message-Id: <20261023020906.28958-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023020906.28958-1-zhangyi@everest-semi.com>
References: <20261023020906.28958-1-zhangyi@everest-semi.com>
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

