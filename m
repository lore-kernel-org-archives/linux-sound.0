Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569114;
	b=QKEWY++E+hPG4B4rPJmoPoBvtjymFl19ZhT9yJOvewHxgSUwHMiH+GuWgAE3LEyFzDgk
	 GmTBGJzEX7dF6QQpbL89u3WMYeKG2eOXHcagXBJ1+b6Ejzhhyuwarm7qaUzJI6k53ALDv
	 NpvGF4gQ1zm1rua3k5q4qMEbZlouCVH72bqq0OwD0Zed+z3PWUm2p7SRl3vVrM+Jeh4hN
	 rpaWPWVVsPqQhB88TpX12J4P3T+L9/4ksY/HjZYxXvdmlNTm72HtFbEIb7DRhniyJi7U6
	 JT0epIVB5lePxntT9F1V4/185NNbjl4eGL4uB5rsRwd8jfWxhBTpWATyesvRC39XHNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569114;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=NRYQqCLmMqv7weybGOm/Y2BdN0I3eIK8g1TPq4EdaXA=;
	b=nCt8M7R8lVyQTYMjH3AEdwmowiPLx/+iAigcm77BX+Gzaz1t+La4bKh5du7xNLCgWGne
	 xyqFz0U/T48UarT3lSAi2s5jdStLjtlfgHF4wlOHRzd2GoEbLwcHWB01CmEEIIWmbxCVj
	 fa9mszpjWWOBuzzB6VdNyYCg7Ch0vSoTleoxPqw/AAnAW8rSWhUOB55E6iNRpIDmThKDu
	 rl4wZKC+6SdPe2cyZnVENMSLjZ/QSOa13NkDelabZZxM63Kw5gb+ZwCBVfQmLrbdPTAtZ
	 Nh4xoUi/92EovGekUMn0We8l8twHQ2JoguSe61eJi01y+C/FgQ5S9ry2OCXeHc3IE3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.82
Received: from r3-82.sinamail.sina.com.cn (r3-82.sinamail.sina.com.cn [202.108.3.82])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB34606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 07:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB34606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AD86F0A000060EB; Wed, 21 Oct 2026 15:51:42 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 273B073F12D04483B370A28765829234
X-SMAIL-UIID: 273B073F12D04483B370A28765829234-20261021-155142
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/3] ASoC: es9356-sdca: Add writeable_reg
Date: Wed, 21 Oct 2026 15:51:35 +0800
Message-Id: <20261021075136.16155-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261021075136.16155-1-zhangyi@everest-semi.com>
References: <20261021075136.16155-1-zhangyi@everest-semi.com>
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
index 4bb51dd8d..31cabf528 100644
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

