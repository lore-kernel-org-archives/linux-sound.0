Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A7376A18
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785027931; cv=none; b=f0neh4ijcsRkxu0/nYWvV2dRqSNjvJG3634VB7fQJ2xRrnoar5j9F4UfEM0IU3deVk/XUmqNpiacDyRjQKHWLVg5Kgp5q2ZqnUdl4iU9StyhtZTgS1AGi/FW02ZqhfYCWFR9TPt6zz4OziDoe0/m8S0QS4gu+eLvKkHRrjf5+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785027931; c=relaxed/simple;
	bh=hyGwQgbaibMiZjMnG4rSJi5bDblLpnUJ6kVxvdWELTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEHjTeZv852msNg1KAziipDTwBR0Ii6uWE8GygNZO0Cx2DZFIurFD4Z+3K9drKUXTCITlXocHULlhnX12z9oSjy0fnlbJK8o2JB9aDKDDSVM3BjmC8hmkkZzSaA9lyZhIUx2L7l25Qa6JfKaQvEh2QkuQu09BL6T75XloLecTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOJdacoI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOJdacoI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caf228a910so12160525ad.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 18:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785027929; x=1785632729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGMy5TZHPbSMBl6QwFQ1P3hdmjaDcuX7zHrmmObiXTY=;
        b=LOJdacoIekCkVsHPOdQpMYNeH1YMiJvJvgKGRt+bj8uGsoenkc+YkQh0IjHwypic2i
         yBMA3wziyNxvz2ZempoDx2DedEh81AwpJZTpFhBSm1dKcUblIKyXRIJZ6+oxbRjG9T0U
         w1lDtmwRbhr7FpSWMwuNmJ901Qrlf3iu533VY3aYcRR50go4v06PBI6Q3TQ6YoTZwh0F
         PoZeFiEnF5GNGeTZNg5IvZ3Ylf9s4N2ZJoxF8l1BlOd+/qzlVNCWId/rIXDJGtgtsaXo
         qCNiEvKK2nQmyCQEEOw26spxohJkaY6kBMj2VBNZWQ/6VNwwwqhivJB5dDwnFglGnG8n
         HT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785027929; x=1785632729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGMy5TZHPbSMBl6QwFQ1P3hdmjaDcuX7zHrmmObiXTY=;
        b=gno1OuEWRUfPUQI+RrqzYCIrV9L07gEECjvhC+Wgk2IIR3zap6/Q3F65dxEzzN110X
         dHXUxBJgi/OWIUAPeh3oOGs7HIVNsGEBz3zbySdnPw4TqQDEKTcsd+VvxPxHAIhein3H
         bIH5HhYDnU0VUSOzUe3/2RMfmbx1EF4AEcyn3HTLQdFFE3Hz+7jXSKQiIiDbVYbPm5Jb
         jot3nfNYtC8Wp1ZnckosaOEBCAED76QuODyp/gCm++r/f8cqzoUwiacKqipNFTqqmzp4
         /olOqkBRfpwjbh7GQ+2+50eWwNOyRDGn9PRfK3zXqbX4/L2aTPPERkiJ4et8cElbbzU6
         MjAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmKYeYQMnF/fTJNbqvnRlT/0vA8dlZp/qt8SdNG4j4m+ZLGzouCZkV8dwNyK69qTm/aZ0h5mH7LvJuNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/BpfIagrgy8I1E5XwPyYGxLz1RbDYojIMOkwV/YOvjHEwrTd
	lYo9kw/qUFhIvxkgHNtEDF/66p3ngQWCTJBoHOSUI2B/5yi9pYF1n4CN
X-Gm-Gg: AR+sD13+5ljLSr0EK1mGZYwnKdG1aK3rnx0NVnYsSQ28VXq3g2sjk72Hk7LHf0qMTU+
	5N6BXu0wUwjeD8pJJlzpalBfFxqTHPCTgDqHjt3DkoT6WGZC9Tr6eRrIiI6M1cDXlMQq1NBQqTY
	aH8+C0hJpF/lRhL787yGSuw3ePCNJUT1hsGoH8nuaNSjqBKceofLiJNHEDdmfmK90y31ngHIoeZ
	8lKPMa+QsgYMvHrmesseRllOg5cxs9I8poncJkPfZwcUvNnr8oZ9SkW8TpP0/UbVv/vSDIZf+Qw
	284aOTFJmzumLuz9ycUtxJnuPEJxZjkhrMHTQGRFahai5smRdF7cIFMP058aabhm7GrtlPg0IUL
	uk5mbmYcqNsJlTwj2F80/xw4i6i5bhhXKpXmh2H4RXk5JbJSishfPdaw5l6/kjLcec6duJI/qa1
	TZGGvY/jRYsk9JbFw33jG2WH+FEK5SqCKVE3XV1MfNjKMtLx3ki9wqkcg8hy6+vf3BEw==
X-Received: by 2002:a17:90b:2252:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38f2950c6e2mr3943726a91.10.1785027929096;
        Sat, 25 Jul 2026 18:05:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e2c2:1f24:32d5:9d51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm11821445c88.9.2026.07.25.18.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 18:05:28 -0700 (PDT)
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
Subject: [PATCH 4/7] ASoC: tlv320aic32x4: move regmap_config into i2c and spi drivers
Date: Sat, 25 Jul 2026 18:05:14 -0700
Message-ID: <20260726010519.117805-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
References: <20260726010519.117805-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move regmap_config definitions to be static const structures in
tlv320aic32x4-i2c.c and tlv320aic32x4-spi.c instead of dynamically
modifying a shared base regmap_config at runtime during probe. Export
aic32x4_regmap_pages so both bus drivers can reference page ranges.

In addition, validate regmap initialization immediately upon creation in
both bus probe routines and remove the redundant error check from core
aic32x4_probe.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 16 +++++++++++-----
 sound/soc/codecs/tlv320aic32x4-spi.c | 20 +++++++++++++-------
 sound/soc/codecs/tlv320aic32x4.c     | 13 ++-----------
 sound/soc/codecs/tlv320aic32x4.h     |  2 +-
 4 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 449353d5f088..e031eaaa2f7f 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -16,17 +16,23 @@
 
 #include "tlv320aic32x4.h"
 
+static const struct regmap_config aic32x4_i2c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AIC32X4_REFPOWERUP,
+	.ranges = aic32x4_regmap_pages,
+	.num_ranges = 1,
+};
+
 static int aic32x4_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap *regmap;
-	struct regmap_config config;
 	enum aic32x4_type type;
 
-	config = aic32x4_regmap_config;
-	config.reg_bits = 8;
-	config.val_bits = 8;
+	regmap = devm_regmap_init_i2c(i2c, &aic32x4_i2c_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	regmap = devm_regmap_init_i2c(i2c, &config);
 	type = (uintptr_t)i2c_get_match_data(i2c);
 
 	return aic32x4_probe(&i2c->dev, regmap, type);
diff --git a/sound/soc/codecs/tlv320aic32x4-spi.c b/sound/soc/codecs/tlv320aic32x4-spi.c
index 92246243ff94..4f842260e325 100644
--- a/sound/soc/codecs/tlv320aic32x4-spi.c
+++ b/sound/soc/codecs/tlv320aic32x4-spi.c
@@ -16,19 +16,25 @@
 
 #include "tlv320aic32x4.h"
 
+static const struct regmap_config aic32x4_spi_regmap_config = {
+	.reg_bits = 7,
+	.pad_bits = 1,
+	.val_bits = 8,
+	.read_flag_mask = 0x01,
+	.max_register = AIC32X4_REFPOWERUP,
+	.ranges = aic32x4_regmap_pages,
+	.num_ranges = 1,
+};
+
 static int aic32x4_spi_probe(struct spi_device *spi)
 {
 	struct regmap *regmap;
-	struct regmap_config config;
 	enum aic32x4_type type;
 
-	config = aic32x4_regmap_config;
-	config.reg_bits = 7;
-	config.pad_bits = 1;
-	config.val_bits = 8;
-	config.read_flag_mask = 0x01;
+	regmap = devm_regmap_init_spi(spi, &aic32x4_spi_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
-	regmap = devm_regmap_init_spi(spi, &config);
 	type = (uintptr_t)spi_get_device_match_data(spi);
 
 	return aic32x4_probe(&spi->dev, regmap, type);
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 6b3ddb89f692..72be757f559c 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -581,7 +581,7 @@ static const struct snd_soc_dapm_route aic32x4_dapm_routes[] = {
 	{"IN3_R to Left Mixer Negative Resistor", "40 kOhm", "IN3_R"},
 };
 
-static const struct regmap_range_cfg aic32x4_regmap_pages[] = {
+const struct regmap_range_cfg aic32x4_regmap_pages[] = {
 	{
 		.selector_reg = 0,
 		.selector_mask	= 0xff,
@@ -591,13 +591,7 @@ static const struct regmap_range_cfg aic32x4_regmap_pages[] = {
 		.range_max = AIC32X4_REFPOWERUP,
 	},
 };
-
-const struct regmap_config aic32x4_regmap_config = {
-	.max_register = AIC32X4_REFPOWERUP,
-	.ranges = aic32x4_regmap_pages,
-	.num_ranges = ARRAY_SIZE(aic32x4_regmap_pages),
-};
-EXPORT_SYMBOL(aic32x4_regmap_config);
+EXPORT_SYMBOL_GPL(aic32x4_regmap_pages);
 
 static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 				  int clk_id, unsigned int freq, int dir)
@@ -1326,9 +1320,6 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap,
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
 	aic32x4 = devm_kzalloc(dev, sizeof(struct aic32x4_priv),
 				   GFP_KERNEL);
 	if (aic32x4 == NULL)
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index 8eb9c6a4c99e..95d010af3d5a 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -16,7 +16,7 @@ enum aic32x4_type {
 	AIC32X4_TYPE_TAS2505,
 };
 
-extern const struct regmap_config aic32x4_regmap_config;
+extern const struct regmap_range_cfg aic32x4_regmap_pages[];
 int aic32x4_probe(struct device *dev, struct regmap *regmap,
 		  enum aic32x4_type type);
 void aic32x4_remove(struct device *dev);
-- 
2.55.0.229.g6434b31f56-goog

