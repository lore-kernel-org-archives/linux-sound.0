Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184127;
	b=Pon/L0GmIl4122uTWwk/YNWLfH9hFic05msehmaAwHUroHnBgVsiB/zo2PmQLFFrNkWT
	 srqcGjWEFB6MCrHcmfTvY6Mp5XOJ/0njnT/mCmce/m9rK0gipQMMWPyWFHsAu0EwgDoMB
	 qR+JocLK38UZIPEP+vTJJVKOB9irUgTLGC58+VD+X4c/AIqqaS2mjtXunWSK9rCYyxUCR
	 G4UP8WFhGdXm1GhqgWwQIKdlGmj3CFFXYSRrE+gWgZNf/KcqqpZCoe39U4XLizQzbVYU2
	 4gPgvufJ+ITSYVd6O3Yzmc6TGmAYHwgvJJlwOE5rOhOBv0PywXou8m1x3LQD+YHRs5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oBHGymr+ku8G9nuyW2BClMpb72u6ZaeN0XLosSPL7pM=;
	b=ocqe8WlR8U2sb+fL9lt5zyXPCg9ZFP660wSM1h9OZ+GJ93gL5IGJpID64huRwwVxPAUF
	 0YyTpNbOXAxGwWyTslJrTxXsVkt/bJiuFg35HI47Trv7TwsAcjlhKfGy1B5adOF51sekV
	 3mtOoyCdoc/3y4l0PfcntF6OvizMOwG8vG1t8tfrs5FRcV+jz6YzdoC/4AeFSypV6w/Wk
	 QeX877aW8HvUNhdwufB+hg6mxYM5krGYWG508qbSH+bF2Jeg2/STMJCOlRkNX7vVOheHl
	 WqVCfkcsN6AOV/hT9aPVl8kH8w/jjEDmf4QVITVxABWl1hpgKnvvU86wO28E62TXizw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2xd5GBG;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B52606A320
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B52606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2xd5GBG
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1738068eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184126; x=1793788926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBHGymr+ku8G9nuyW2BClMpb72u6ZaeN0XLosSPL7pM=;
        b=y2xd5GBGaAQZOvj58nlFiV+YrY95CvXgRL7TUKj38+mL01NoZyrawWQbxHdl+YAbEZ
         wTePaGxVqSqSGq621OCuWiNlaeUyHkPDVQk/L7VY1b+CnFrPCGYoZjwhkraYpm33wf+F
         YIqZZtHAC0GKcYdiTfQyfPdfeCYqX/VLYjF7wdI3u99g+3tbkVkQuS99WWmLV/yBFTn4
         7f3X7FUfLBmorzjdtLl7mp/9RrXcnOjLVJemj5zl6y/snTlWF2MY1y7UYFX2eNHybVwy
         Fi+jHHqEuSwDIdwKRGSTKObT8OEAIHu9svHZEEh3nPiXmqXaSdCX1b/Xl2tqY67cC1Pw
         VuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184126; x=1793788926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oBHGymr+ku8G9nuyW2BClMpb72u6ZaeN0XLosSPL7pM=;
        b=Kc7zXe3w72qCKRKCpHfNQo9kBYY0P5MsX6RjR5VGPIlKxkk7yI0GdKhBchl837Lvsg
         OHsevwlqY2ffmMNdkClA41W36+tMmPZHI3i/6Lr4W5pQHAFzV3YGhKspUzpy1ycgPXRi
         D9Qqrocu0rUb+9ruKp+0V/Odgd7FqPkBL89nTs1LI/e+AWjIN5dpQV8WeDpJW62o2z+i
         h29u8xeaG/DKSY6sjW22G0/Y5R6JftXh2ItfW5CvDAP7aVisw9U2CMJJ9AWmtA0sItnj
         kqC5NHnS2A+DkP6423aHBoOQIey2lOkSaVXVKrZDtDeo4rFlIpFKFuR8JO3NV2CBBeU3
         YvDw==
X-Forwarded-Encrypted: i=1; AKwUvBzoHwrSmnrrEHlK+mk4jBedwqGqjLBDZCTrILnTbZ+biRVz/dHyx1oAUb/LgpJ1Hfneeevp8ySlayrlkQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvWDniVida7GQMfmxF6G3ap8ePTMsUz0gmb//VjWq+D+kNkhq3
	0KgPL5Qs+yPgPKIZ2gitpjS1xC4u59p8KVpMNJke0h8cwnzoBKljicnf
X-Gm-Gg: AYBFou3AMfAf8Qut1/H8rBmW7UktD6l5D3CL3vvCfUGY3i0mzpvE6vy4eglZWFyPJh5
	A/eNbj70ImXjjTf6PvQYLPAEb1Vx41GRG7T7Z4uAPBd83RjOszsMbdy5waT+Y0iWoO9yaHP3irZ
	z8GOR62fJ9YBHpLMIe2P958mOAVs3Y8zj/Tk0Igw2h+b2vKWiPGozKsxkv7FhwAdh5gsnsqMdGk
	zTjyWKxkoEigxTGxIVpYVhkat8DFYYpokW6lv/WaZE+OwIRj7BPgpwyLg9SjhFuhKb277bK2HxQ
	2fDxJUAE7j5EP9N6a3Zo3M8Sd0BUkIuYT59RqfxYDOlXMB48CuszBP9pfnWmJPGJV7SOjMbWk2p
	Kkkse9zuy6AJxWjvBTBf/66ghL1wHMhhPW6fRe7m3GHVC+T39gcxUna08+mjm/UosCjgG4RaMIQ
	QNvsgPKQUbj8M0sdNWfTEopuhlLD2OsQrlt/jv6J5sz578WDHi4sT4o1GjEj+FpqiGTgOkgh/ui
	Z/ROTF795ubF1MFTpgmFGXE+t3RVFlHOAVMy/TyuIJBny05KuCi68po5UbG3JCCyCzMU65ETRdl
	evbDRHTBsX2kRwARgkHRK8UPi/13Pe2P3qymPkutp6iBWcstx3gtGl0USkHSYFirNtYomjvD9z4
	lStKQLIahMQUYWLQ1qMc+9Ij8guMP1DJySKYCyDGG6Dedunm+ubx97c/1wiSBXfoywg==
X-Received: by 2002:a05:7300:fe42:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a20407151mr2435793eec.13.1793184126011;
        Wed, 28 Oct 2026 03:42:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] ASoC: loongson: Use FIELD_PREP() for register fields
Date: Wed, 28 Oct 2026 17:41:37 +0700
Message-ID: <20261028104138.26973-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use FIELD_PREP() to set the bit fields in the I2S configuration
registers instead of open-coded shifts.

This makes the register field assignments clearer and consistent
between revision 0 and revision 1.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/loongson/loongson_i2s.c | 11 ++++++-----
 sound/soc/loongson/loongson_i2s.h |  5 +++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index aebea177e7e0..0d5278203024 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -80,10 +80,10 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		mclk_ratio = DIV_ROUND_CLOSEST(clk_rate, (sysclk * 2)) - 1;
 
 		/* According to 2k1000LA user manual, set bits == depth */
-		val |= (bits << 24);
-		val |= (bits << 16);
-		val |= (bclk_ratio << 8);
-		val |= mclk_ratio;
+		val = FIELD_PREP(LS_I2S_CFG_LR_LEN_MASK, bits) |
+		      FIELD_PREP(LS_I2S_CFG_TX_RES_DEPTH_MASK, bits) |
+		      FIELD_PREP(LS_I2S_CFG_BCLK_RATIO_MASK, bclk_ratio) |
+		      FIELD_PREP(LS_I2S_CFG_MCLK_RATIO_MASK, mclk_ratio);
 		regmap_write(i2s->regmap, LS_I2S_CFG, val);
 
 		break;
@@ -106,7 +106,8 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 		regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
 
-		val = (mclk_ratio_frac << 16) | mclk_ratio;
+		val = FIELD_PREP(LS_I2S_CFG1_MCLK_RATIO_FRAC_MASK, mclk_ratio_frac) |
+		      FIELD_PREP(LS_I2S_CFG1_MCLK_RATIO_MASK, mclk_ratio);
 		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
 
 		break;
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 457d90e3d5b6..0c280e9b7505 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -45,6 +45,11 @@
 #define LS_I2S_CFG_TX_RES_DEPTH_MASK	GENMASK(23, 16)
 #define LS_I2S_CFG_BCLK_RATIO_MASK	GENMASK(15, 8)
 #define LS_I2S_CFG_RX_RES_DEPTH_MASK	GENMASK(7, 0)		/* rev 1 */
+#define LS_I2S_CFG_MCLK_RATIO_MASK	GENMASK(7, 0)		/* rev 0 */
+
+/* Loongson I2S Config 1 Register (rev 1) */
+#define LS_I2S_CFG1_MCLK_RATIO_FRAC_MASK	GENMASK(31, 16)
+#define LS_I2S_CFG1_MCLK_RATIO_MASK		GENMASK(15, 0)
 
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
-- 
2.43.0

