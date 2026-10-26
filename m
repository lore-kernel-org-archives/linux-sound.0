Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996989;
	b=oDnDyBCpAMbyIifkEzumlP5A/F1ZwS88+k53+fzEfTsV1nh8LyOh4x8j1T+3GpqvekJZ
	 byMsz3A2n/KoaFcjJ3YM8rIzvuN6LXFWL5iAYTycVs4h7oRo5VOPuly+C6sGvMmRzucuy
	 x5rI+j8kIwL3YGsr+MLd7MNqrgtLMPC7FFj1L6QWbbAFdcfMhsnVtiOf16GVaxwzHR010
	 u+yOlzX/97mSnY8ZYqsTObafoN+Vz5dXcqdc4uALem5bAWAemmHEvuVn2So3UQ+2IXQ/J
	 OgE0MOOM65vwDGSImB1W958QkI9zZk/YB8fOhpu264hCpsJXt0nAwagW02q/ZkkMBcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996989;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=CxcN5NpT+VRhUV13dgZ5/IbMQ9bDavIaqy2PI8u6rUU=;
	b=en6iw0piTYs4rcvFKPNiSrDLax3GOifGkub6K9YcLJ5JDto0ESJK4Y01KA27gKKgr1yV
	 n6IUQeLRcFw0eyCZzskAEeHhGAdYAOD3oVLeJgflcgdwzik8okXgDtt3wU62IwRVVlz/m
	 zxe45UNFBwKc1fsQ/ngufajBxz4SO+YPUT4WredaNgagSgMMCHwauHVaWpxaYgmYJgugE
	 Q5zpKAYn/jsAfRc2g1qHo6ftlsSOf/L2gyzmIne/0a/XwSsG9joKgzmxnMetaPk0f//Cl
	 Eq1t8LEY5vtvZXpa0D+9tiaV5qsCP+vMu+bfldL7hUtSNdBiA+F3IyeDVXpIGTMA1Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.175
Received: from smtp153-175.sina.com.cn (smtp153-175.sina.com.cn [61.135.153.175])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F054606A31B
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F054606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6ADEF66D00002520; Mon, 26 Oct 2026 14:42:56 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: D8D8745DD2424DEBA457F5318D6F0227
X-SMAIL-UIID: D8D8745DD2424DEBA457F5318D6F0227-20261026-144256
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 2/3] ASoC: es9356-sdca: Add writeable_reg
Date: Mon, 26 Oct 2026 14:42:50 +0800
Message-Id: <20261026064251.15017-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026064251.15017-1-zhangyi@everest-semi.com>
References: <20261026064251.15017-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Set ES9356_VERSION and the HID-related registers to read-only.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es9356.c | 15 +++++++++++++++
 sound/soc/codecs/es9356.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 4bb51dd8d..a22e92d1e 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -724,10 +724,25 @@ static bool es9356_sdca_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool es9356_writeable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES9356_VERSION:
+	case ES9356_BUF_ADDR_HID:
+	case ES9356_HID_BYTE2:
+	case ES9356_HID_BYTE3:
+	case ES9356_HID_BYTE4:
+		return false;
+	default:
+		return true;
+	}
+}
+
 static const struct regmap_config es9356_sdca_regmap = {
 	.reg_bits = 32,
 	.val_bits = 16,
 	.volatile_reg = es9356_sdca_volatile_register,
+	.writeable_reg = es9356_writeable_register,
 	.max_register = 0x45ffffff,
 	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
diff --git a/sound/soc/codecs/es9356.h b/sound/soc/codecs/es9356.h
index 2a676f365..ceb571903 100644
--- a/sound/soc/codecs/es9356.h
+++ b/sound/soc/codecs/es9356.h
@@ -4,6 +4,7 @@
 #define __ES9356_H__
 
 /*ES9356 Implementation-define*/
+#define ES9356_VERSION                          0x2000
 #define ES9356_FLAGS_HP                         0x2003
 #define ES9356_CSM_RESET                        0x2020
 #define ES9356_FUC_RESET                        0x2021
-- 
2.17.1

