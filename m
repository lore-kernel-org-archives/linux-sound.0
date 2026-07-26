Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1B169AD2
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027926; cv=none; b=OJAdjW+TKnSH1HB6iSFYZojmcHo5vgVLO0kcqTHaU8hXKv0kkc2mWftz25n38wkHLfDhyMLi+XSNnXD4Ap2EuR1HL3GD6559gyLPmqUv527BHRTbR+BznHOjLKXiz5eyHJ3+7+Ma0OW7ZLpchdndBemtlQQRjKRo+17mo0z8NOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027926; c=relaxed/simple;
	bh=P+yS06lHchG5siRz+mOw5xXexzbDxhJfSVKS22jmjZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFPn5ZSVXAEuVjW9qI56QJBbkK/1LUIHMjJMbn89Iv4UfJxm6+/Gjw4zIpAUDYjYvx7Fp6IQ6NWEqFEyjGSZH9jTgpjBNk65ezaLAvBcNdPHmMPrYOLPNykPtzLYGg6rOgXnK40cJ32b9ScJ8igshE5nWI8WZk/+bdvlLNRDxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGJpcV0I; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGJpcV0I"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2258045a91.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027924; x=1785632724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/5LdFIg/LU7rFG3leYAHwWxQcBTNGDs6wAJLayt2JU=;
        b=UGJpcV0IBLXeQODI2JQ6uWOqarsm0LUJywv7gMc0ACGkzwnZjkINw6hrUHTCh+kLzT
         gWJWAGsqvjPDESTGrJJzSbg8+7Tz9KYjoEhoXl5ScOfZ+Y/yVgaU+VwigAMppSuUQInG
         JPWusBPSI/U2SR2R6ba0kAl+hICGByxJMGwCC5uwbSDEssJdiXKiI3Ez9YMwiV1svIQE
         Ag5GSNX7I3TcyyQ3kt7CvUJ0BMJ0g6bS1w+2hwuhZkrPm/Chepwb9svWS3vN+GxlPAoA
         WQTLB7devcP9bcYJNie9gj0H/PmQgxegLFrau64qqUZGoXLDEsYz+79xmebARQlK49Vw
         ykxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027924; x=1785632724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/5LdFIg/LU7rFG3leYAHwWxQcBTNGDs6wAJLayt2JU=;
        b=dBvecPuBbeuht4obBE6sf45Qo0vGc/fQfrErAP7m58IjoUUZNEWF2j9YDcdFAkKKF4
         nLJThG6dOzgk6BBRMnia4szsgIo5cL8TWpbzBOCQMCK4gKQTLTWQ1LrK4CbhHJihi45v
         UOP111jXj+YUfX9yvRc+uy+1BtNw/hyGuUKSom59rBnynMiA6ZGQs1m6DhKVWNjD7vLS
         t/YTYy+t2OFfVLF22/LMG6YEXfzRNA6fY57i8EG5X3VX0EDg64KvfNutocEu1HXH6rWZ
         h9EaxEOt03y+eSnb8HKc0/p1ZlNK3pDPYVwBIo0ZlK1Lsvl9KxnogUunAXQY+axVlHSG
         RgnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6/RrLsYsCyHUYsOfDhmZ5AYW1pHZzb007YFwCYXW/LfbbrHtN+EkWUky7zB7NN6w5wT0b/XatX/gLKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2f3lktsRy8ZmJ9nudu4XmJTgrWI96QTK2/0vzUYuShn2nUs7L
	85f0FEZFBLBXlBDqHvgYQDJWEnLFnk9dYb0AL8KVnGOaKXjzlvwdHd1r
X-Gm-Gg: AR+sD116tjFHmb185QW/FcijtsiqM2yFWvYfn1i026FBuNxGJAuDR7ZzvKB30SG1j2j
	A8P6vd0eT1gx9EXnzO5CKoce6G9edS1wfy5A4mvBw1V5c5Q4L+3sIdJwosyCJo6pVnR+pLFtD74
	gsaEebM845M3YkaNcCV80ebG3lwguEV/WfQNwqMtt4drdk3MnpBsfKg0yGt/5b7BAenikbtmeOc
	yuCuqIpMHgRxldUc0AIBF6QXuyJbbsuyCoBsZXoVH5e501BDYcTOeh1S67F6YKakSBT7Inrm0Ci
	wV4eLiX53MjEvuFPrz3mnIsIHYyu+656dJ/xLnqC5z/b6smWB7AxxKPJmM5ejGLlLWmW4PB19NC
	UXtDlbz6xqaTPTd5SL+pSOD1QgzN5Ga3Yyfh125YkUCUVvmU2Ov8QWSNZUCIZ9aXadyMn0Qc3C3
	1epqi6XxqZPRBvN/occGrEYXF02NEBSrrMITsgRU61Oixe8ZXVp+xb+zkzDguUPLXYxDj2o6iYN
	p0Z
X-Received: by 2002:a17:90b:1a91:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38f298bcfc8mr3203455a91.40.1785027924060;
        Sat, 25 Jul 2026 18:05:24 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:23 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ASoC: tlv320aic32x4: remove global header with platform data
Date: Sat, 25 Jul 2026 18:05:11 -0700
Message-ID: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 69d5b62c4bde ("ASoC: codec: tlv320aic32x4: Drop aic32x4_pdata
usage") removed support for platform data, but left a global header file
with #defines and platform data structure.

Move the contents to the driver-private header.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/sound/tlv320aic32x4.h    | 43 --------------------------------
 sound/soc/codecs/tlv320aic32x4.c |  5 +++-
 sound/soc/codecs/tlv320aic32x4.h | 27 ++++++++++++++++++++
 3 files changed, 31 insertions(+), 44 deletions(-)
 delete mode 100644 include/sound/tlv320aic32x4.h

diff --git a/include/sound/tlv320aic32x4.h b/include/sound/tlv320aic32x4.h
deleted file mode 100644
index b779d671a995..000000000000
--- a/include/sound/tlv320aic32x4.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tlv320aic32x4.h  --  TLV320AIC32X4 Soc Audio driver platform data
- *
- * Copyright 2011 Vista Silicon S.L.
- *
- * Author: Javier Martin <javier.martin@vista-silicon.com>
- */
-
-#ifndef _AIC32X4_PDATA_H
-#define _AIC32X4_PDATA_H
-
-#define AIC32X4_PWR_MICBIAS_2075_LDOIN		0x00000001
-#define AIC32X4_PWR_AVDD_DVDD_WEAK_DISABLE	0x00000002
-#define AIC32X4_PWR_AIC32X4_LDO_ENABLE		0x00000004
-#define AIC32X4_PWR_CMMODE_LDOIN_RANGE_18_36	0x00000008
-#define AIC32X4_PWR_CMMODE_HP_LDOIN_POWERED	0x00000010
-
-#define AIC32X4_MICPGA_ROUTE_LMIC_IN2R_10K	0x00000001
-#define AIC32X4_MICPGA_ROUTE_RMIC_IN1L_10K	0x00000002
-
-/* GPIO API */
-#define AIC32X4_MFPX_DEFAULT_VALUE	0xff
-
-#define AIC32X4_MFP1_DIN_DISABLED	0
-#define AIC32X4_MFP1_DIN_ENABLED	0x2
-#define AIC32X4_MFP1_GPIO_IN		0x4
-
-#define AIC32X4_MFP2_GPIO_OUT_LOW	0x0
-#define AIC32X4_MFP2_GPIO_OUT_HIGH	0x1
-
-#define AIC32X4_MFP_GPIO_ENABLED	0x4
-
-#define AIC32X4_MFP5_GPIO_DISABLED	0x0
-#define AIC32X4_MFP5_GPIO_INPUT		0x8
-#define AIC32X4_MFP5_GPIO_OUTPUT	0xc
-#define AIC32X4_MFP5_GPIO_OUT_LOW	0x0
-#define AIC32X4_MFP5_GPIO_OUT_HIGH	0x1
-
-struct aic32x4_setup_data {
-	unsigned int gpio_func[5];
-};
-#endif
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index d85094557215..da582f2c940c 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -28,10 +28,13 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
-#include <sound/tlv320aic32x4.h>
 
 #include "tlv320aic32x4.h"
 
+struct aic32x4_setup_data {
+	unsigned int gpio_func[5];
+};
+
 struct aic32x4_priv {
 	struct regmap *regmap;
 	u32 power_cfg;
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index f68a846ef61d..8eb9c6a4c99e 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -234,4 +234,31 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 #define AIC32X4_MAX_CODEC_CLKIN_FREQ    110000000
 #define AIC32X4_MAX_PLL_CLKIN		20000000
 
+#define AIC32X4_PWR_MICBIAS_2075_LDOIN		0x00000001
+#define AIC32X4_PWR_AVDD_DVDD_WEAK_DISABLE	0x00000002
+#define AIC32X4_PWR_AIC32X4_LDO_ENABLE		0x00000004
+#define AIC32X4_PWR_CMMODE_LDOIN_RANGE_18_36	0x00000008
+#define AIC32X4_PWR_CMMODE_HP_LDOIN_POWERED	0x00000010
+
+#define AIC32X4_MICPGA_ROUTE_LMIC_IN2R_10K	0x00000001
+#define AIC32X4_MICPGA_ROUTE_RMIC_IN1L_10K	0x00000002
+
+/* GPIO API */
+#define AIC32X4_MFPX_DEFAULT_VALUE	0xff
+
+#define AIC32X4_MFP1_DIN_DISABLED	0
+#define AIC32X4_MFP1_DIN_ENABLED	0x2
+#define AIC32X4_MFP1_GPIO_IN		0x4
+
+#define AIC32X4_MFP2_GPIO_OUT_LOW	0x0
+#define AIC32X4_MFP2_GPIO_OUT_HIGH	0x1
+
+#define AIC32X4_MFP_GPIO_ENABLED	0x4
+
+#define AIC32X4_MFP5_GPIO_DISABLED	0x0
+#define AIC32X4_MFP5_GPIO_INPUT		0x8
+#define AIC32X4_MFP5_GPIO_OUTPUT	0xc
+#define AIC32X4_MFP5_GPIO_OUT_LOW	0x0
+#define AIC32X4_MFP5_GPIO_OUT_HIGH	0x1
+
 #endif				/* _TLV320AIC32X4_H */
-- 
2.55.0.229.g6434b31f56-goog

