Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184124;
	b=Pfz/ygu6dP4yK68bjP8zW5BrEZU8uVG4fTfG4Ltii9DtGYHaN9DnnHUlyfX2mF6wErgG
	 ZMLaVzeIzfwO+VnRRzibnQq6JsS/S1Ixxw3W7v62XoImY7SpLol/8jY87DU01ejMcFziG
	 aMvzj+qFGTyWQjYLIr0/FnHceToeceJlQR/J3Tcd8b7BvlqcSxxZyBfDWgFU0rNv01ZcJ
	 orZuDC3AUfduEA9hMgT1z/1zCPuCrMLjlc7wU2ohn2/UhKbDGBaPMQRkF/9yYggWiZMJM
	 qjgvEDUbFlEdaembwtJU8q1YxZkiSxwYylB+EiEMwJdjbPB7yJUWDZl5VHs90oRhgHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ZIFLiITPDppon9XwsaZlsXJycxKJwC52zQPjn+czIM=;
	b=I5RaIgzXtsBylVlKg4+ppkwamf7Im1ltjfB7TTpHD0JJiGXuJ0aLHyC4JOEP3mANehc+
	 uGgmT9hh6ufIi9FiR0N7NoL8ehAtt9KbIPew3AUdxB9A/QskPkb0AhzfhCnqpgvn3dxAy
	 0P+KwogUDCBDNqwa9NsWG+ndDSoi8/3tfCSUvULFP0Dv5sdGaFKuSiWYqPyo94iT+w4qa
	 Us5wrbOOtLr+r+819ym2/q9FHEf7sM5ULLzj3tYYxs09Gx9rEiLR0OLwWAxzAyRLEz7Yv
	 UsSYrNTh+KUHWU6NWGc8AK5PgwEtB+wFbRNl3i6JRQ5DDIlL2sIoj0sbGgSNWjyQGsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bctOg8JQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81870606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81870606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bctOg8JQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-353804b591eso1303217eec.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184123; x=1793788923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZIFLiITPDppon9XwsaZlsXJycxKJwC52zQPjn+czIM=;
        b=bctOg8JQJ2EV9/qrwFFuWtUMkZ6/IbSObGUxpLM90xJJmKy1FLqaziZWAIu07+Wh0v
         SWESaEAmAilz9hbkUIaiCRltJNJ9g4002bKPD8O52heKcQM0ry3cuJOIkMK+J2YQJwzK
         fLKfR6ybNhuWZHTQNg3LetJPChv5jgRZMkF6rbke0cZizY2Sa/TCnBapxub/i1UK4Lh/
         DgiW2wXR24WBmLiHbg4A5P1fhqjoyHKaba7lsCSZ601vj6iLsdgtBr/Jw6zV9HP7mtBd
         qa2g0izXdz8N2imUHw7NHKRlv8VCdsou4+21ll7PRBTo2sq33aetvpQd6nf7C2T547TU
         cCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184123; x=1793788923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZIFLiITPDppon9XwsaZlsXJycxKJwC52zQPjn+czIM=;
        b=uLflUctZYTt85MtiQWWZkBPAhw4hsSTis0WJxAADfKHBfSEondhcqowJHVKDBhlK6J
         TiPb1OV4OzhmyJwTagxv2ghWuR55BieyX5hYSbLiLMS+h4OZiVAtsPcy370tad5XHbJD
         aOWQsUowNyRUWvA43MOkFnvRgNpI0s30QrbXZFPrf8QFQ05+J9yda2zeoA08pXNk2A/B
         oA30jT4LcN95gHUNKc2D1HCqHsY5X+28/AxycWHogSx4h7TnR2y0OVHTwCAGUpyjUVr0
         QUS+c1A1O8H14PLxxRnLq2w4ksbzp0HQ/saig+2APvSVFgu6aCHoSZ8UWlcBtOEU1h1R
         F0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBws8Tlkc1xPpgxtFEqoU4J0jQZt8flf161BjPisNNGLeWvwraTn62u4g9OYSpmubegsdQl2RwB9W7AqMA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLcRmunvcm1E++gV0vw+aAveRFDVEeWtqcNGOsJaJkqDID5C0Q
	48XuC5RyjA/lEIue6LldzcvQVON75ri4fhom0kUO0NaUbeRqlj6MRfOI
X-Gm-Gg: AYBFou0pkbnjMHa+5gFE/IeP9kvlRCu5f/VxtOl9zTPYHx6I/fL07rKwui+lPXLQWQy
	hB8sUDHSLkvAh73M7nUJIBvAeQvBgp20N6Q0BlVJ2EAjtWudxXSUtkDPzgJBXTrPRBDefA9zFHq
	jC3gIAH2Xk9GJdDC0pVnjsYDE1o3NWV26tE6dOAA1Pz3df6lYbf5yCGRLruJ7Hl8EIldPl+aBul
	6nBn/MwWh2zf2Gcl6ip/epAgozQb22oFmLUmwcov5vPnAUdHEwyzY69Qz+bfbQQSE3C9Ytd++Kk
	gto0YG1Vo2CY6bWb+qMAvQ5rkqgcJJX9OCRRHK5ZYkcEWgSvVUUttfgNkEK9pStXNifHQBPEpQ8
	blXzRtUH6owLXEfEdtBQINAcQod/IBmQ66ch3Mc6oBRdH6gv4B5R3Xricctrd+B5lWazLPtDx2p
	XSnr6ISiXsNNweo5GdLJvfSPQqw3QHVGI5Tvhl20nWt3JAG03ogcMgJsAHrw02V59lF4RWESFpH
	7zANyeawXGjXJhozC1FUukg2OeColFePXGH/va7Rer216Yrn2YaF1hZCGxdjB2VIpxDQ+tycyaE
	Ui5Tbh+es17fiL1Mq5mJku+CFqKrMxw5PF/BILO/bNkMZDI6NBGkQi81m27LNn4/nprmq4ZAdWv
	zIF0/vnzOZQOc+BjwLEbeGOqJ0k9TraXJBvQCCzDdTPp4eo+XiQgMwqj541OcU3xl/Q==
X-Received: by 2002:a05:693c:20c8:10b0:36a:1e0a:accb with SMTP id 5a478bee46e88-36a203e2f43mr3129824eec.35.1793184122327;
        Wed, 28 Oct 2026 03:42:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:01 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
Date: Wed, 28 Oct 2026 17:41:36 +0700
Message-ID: <20261028104138.26973-2-phucduc.bui@gmail.com>
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

On revision 1 controllers, loongson_i2s_hw_params() reads LS_I2S_CFG
and ORs the new LR_LEN, BCLK_RATIO and RES_DEPTH values into it
without clearing the old ones.

The first stream after boot is configured correctly, but any later
stream with a different rate or sample width ends up with a mix of
old and new bits, so it may run with the wrong rate or sample width.

Use regmap_update_bits() to replace LR_LEN, BCLK_RATIO and the
RES_DEPTH field for the current direction while preserving the
other direction's RES_DEPTH field.

Fixes: d84881e06836 ("ASoC: Add support for Loongson I2S controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Use FIELD_PREP() for register fields as suggested by Binbin.

 sound/soc/loongson/loongson_i2s.c | 21 +++++++++++++--------
 sound/soc/loongson/loongson_i2s.h |  6 ++++++
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index da0d029c028a..aebea177e7e0 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -6,6 +6,7 @@
 // Author: Yingkun Meng <mengyingkun@loongson.cn>
 //
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
@@ -69,6 +70,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 	u32 fs = params_rate(params);
 	u32 bclk_ratio, mclk_ratio;
 	u32 mclk_ratio_frac;
+	u32 mask;
 	u32 val = 0;
 
 	switch (i2s->rev_id) {
@@ -92,14 +94,17 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		mclk_ratio_frac = DIV_ROUND_CLOSEST_ULL(((u64)clk_rate << 16),
 						    sysclk) - (mclk_ratio << 16);
 
-		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
-		val |= (bits << 24);
-		val |= (bclk_ratio << 8);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			val |= (bits << 16);
-		else
-			val |= bits;
-		regmap_write(i2s->regmap, LS_I2S_CFG, val);
+		mask = LS_I2S_CFG_LR_LEN_MASK | LS_I2S_CFG_BCLK_RATIO_MASK;
+		val = FIELD_PREP(LS_I2S_CFG_LR_LEN_MASK, bits) |
+		      FIELD_PREP(LS_I2S_CFG_BCLK_RATIO_MASK, bclk_ratio);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			mask |= LS_I2S_CFG_TX_RES_DEPTH_MASK;
+			val |= FIELD_PREP(LS_I2S_CFG_TX_RES_DEPTH_MASK, bits);
+		} else {
+			mask |= LS_I2S_CFG_RX_RES_DEPTH_MASK;
+			val |= FIELD_PREP(LS_I2S_CFG_RX_RES_DEPTH_MASK, bits);
+		}
+		regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
 
 		val = (mclk_ratio_frac << 16) | mclk_ratio;
 		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 8b4603c876c5..457d90e3d5b6 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -40,6 +40,12 @@
 #define I2S_CTRL_RX_INT_EN	BIT(1)  /* RX interrupt enable */
 #define I2S_CTRL_TX_INT_EN	BIT(0)  /* TX interrupt enable */
 
+/* Loongson I2S Config Register */
+#define LS_I2S_CFG_LR_LEN_MASK		GENMASK(31, 24)
+#define LS_I2S_CFG_TX_RES_DEPTH_MASK	GENMASK(23, 16)
+#define LS_I2S_CFG_BCLK_RATIO_MASK	GENMASK(15, 8)
+#define LS_I2S_CFG_RX_RES_DEPTH_MASK	GENMASK(7, 0)		/* rev 1 */
+
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
 struct loongson_idma_data {
-- 
2.43.0

