Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A593264C7
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783027918; cv=none; b=lUTI6ktXVH7+vuj/WiijPbxwrSfpKxJV+ip1c2rh4EFx7ZddNSLdgZEFt45ByA8PCyqbD+rssDY42X3GADtbbWGEOaIfslmBSZZvcMG3yQc1fZIZLlSJgsoJSs5uj8pnh6lkMUZ8EVTpRjmsiysTJXdewmTcBStsKdMeDNCqoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783027918; c=relaxed/simple;
	bh=uZsb8EusuxDA+iZq5vtuz8+Khov6nisW0HEkdxjZ8ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aBShEX7c2nqbyPD5uwIJCPmYSwnl4QAlMbSgVZTAnvuQRKL0/yh5Ey70msl5yJ+vlYHBwG69C0th9ZQ0khEhx0cXMZNqnNB8zceoQCXhcPDovVKkqvGI1PujeCNJDxSDLz46Vi4FtZ+Rhaf4ytfCLt+mdn71AwPsdKunX44ipmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DeCGN28L; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DeCGN28L"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so15971065e9.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783027914; x=1783632714; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jw59bcdB/ltUoOpdZCepUeH14DCkJ+gtBAcNgz6Z6w8=;
        b=DeCGN28LcjijfU5LJnudtF3grmEPEsJ7xRs27qNtocsgN9NrRyRaBPIdtSPkhiTk+n
         0WXrlKVEAd7LvVzTdNC4JFY8YCLIweNvOudbSSwngZ5MNwStS2188hQ9eTSbNti68x4X
         csX4zY/fa+qlCy29pXdF7xdkzbHA6TVLg3hBGEs9Dk3ZA1yH5EN28GcSydtFuXaGaChp
         ROdfU5EURK/+uhJvMcrOo5q+A9EUyc/tyzvjXsp2JEIoOnNJu5OobVfyo/BLmtiwXQ4C
         zdn9e0OF1iPciZ4ncYcdnvSBcN0nOUiWM4I3ttwV2tx7n0Zfichl2UQArft9XN52zP0Z
         yAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783027914; x=1783632714;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw59bcdB/ltUoOpdZCepUeH14DCkJ+gtBAcNgz6Z6w8=;
        b=I8akPGtFie1pZXZb3oEZEvMELa3UdOctPNHjMxOvTKFEKhbYpeFStiZ3OpfICzOrcF
         XKhp+hgTHna762aCkKpKV9CzZvc27aBtL3brVFwB+hfDAyqclipJW2VMeqdim6AvM3zj
         0gdvoxtcM+D3UoIMpq/orv4vcvxHg8SSTTPgbOdxEcBxQ5eLmlWskv1g6athlWbFr2F9
         LBxY1M0pU2KghfXTHW9N9tRLh+lYdW1mUn6oixnlHaNtCRkb5K16ZSMulY/j8MXXmpxh
         S3ucJV9rSyiZnrtvMVjrDsnRc26SPkwBF+RpW235Rr1/zZjNcEZhRMTTdY5a5x3uggnN
         5jlg==
X-Gm-Message-State: AOJu0YyUQVnuUQYriXaft1qvamCGMA6lfF4UjRhwtfi/ML+181bvURso
	iCYmnQgQoDFOsnELcr+XpPoBaPM2stt65h2xZVaAXtoDaM6ZJalsdk6lF+FPm4BuPRE=
X-Gm-Gg: AfdE7cnWd0+gIOemUGjNDGt1eVEITmtyEg/TmIe/0dggK8DjdrWZb5rVO307sbpouQM
	5LIsFTWjvm0tZteh2RauU/mW9aHbqO+anCxoUp6ymD8VP3/X6ehHggoTYvHrPMjD30qWZSAt2vN
	d302h6455n50w8GIMtAGN/pSa1bISVW7TXZ+MCvzv89iPYNfeKdE+95AtiFunK1i+rUFNwl/4Xx
	uTv1ykOOF0wWmuXAWgKVVGrpQPZqw8dcT7InzrRPyeAyhuzsHQBb8aKZMvysY+eY5TCLbQPRWVi
	5RFkEsBPqFYLrEsVHSgJCTmITupZR3hIgBP/MiIcCUZ2uWNByiUNxRbxHXZE9EWLekilm8SY0hi
	szb/vm6mEt5o026iLoO5x2SRvJvPVvhWusx/JBPmRwt6TBSKosnXJyyBKRT/iJsG+rAiYVlwLqU
	/greDNuYxqkA==
X-Received: by 2002:a05:600c:1594:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-493c2b7dc45mr66870285e9.20.1783027914403;
        Thu, 02 Jul 2026 14:31:54 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4a343csm127608285e9.0.2026.07.02.14.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:31:54 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 02 Jul 2026 23:31:46 +0200
Subject: [PATCH v2] ASoC: meson: aiu-formatter-i2s: remove pipeline reset
 from prepare
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-24-bit-i2s-playback-v2-1-9c008ff0b211@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMHYRmoC/4WNQQ6CMBBFr0K6dkwZGpq48h6GRTsMMopAWiQSw
 t0teACXL3n//VVFDsJRXbJVBZ4lytAnwFOmqHX9nUHqxAo1ltpqhEY+gAa8TCAYYezc4h09oTT
 G5NaQpdqqtB4DJ/Uo36ofx7d/ME17bjdaidMQluN6znfv/8ucgwZPdeFM0XCB7urd0okPfKbhp
 apt277iTV5f0wAAAA==
X-Change-ID: 20260702-fix-24-bit-i2s-playback-6444174c7cd7
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4120; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=uZsb8EusuxDA+iZq5vtuz8+Khov6nisW0HEkdxjZ8ps=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFluN06+yjvjnhd0k+e1smyS/1a35vqg2h97Bb7GRPx20
 IqZsWh3RykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbiPYeRYdWm/nssm5/c+xPz
 8PS/Za8L3130qMiPvTvruryfo7vYx+kMv9n+T+LdtfnH2zWN3OkXT7/pZ513yjvlcqikMuOU7r9
 CeewA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

'aiu-fifo-i2s' (DAI FE) already resets the I2S pipeline in
'aiu_fifo_i2s_trigger' for all relevant trigger scenarios, right
before starting the FIFO. Since the DAI triggering order is the
default one (FE before BE), the reset performed in
'aiu_formatter_i2s_prepare' happens after the FIFO has already been
reset and started, which corrupts playback in 24-bit mode. Remove
the duplicated reset from the formatter.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
A patch series has recently been merged in c7852d2dcf66
("ASoC: meson: aiu: align I2S design to the AXG one") which unfortunately
introduces a bug in 24 bit mode playback which this new series resolves.

Among other things the previous series moved the content of what was once
called 'aiu_encoder_i2s_setup_desc' from 'aiu-encoder-i2s' to
'aiu-formatter-i2s'.
'aiu_encoder_i2s_setup_desc' was basically accomplishing two tasks:
- reset the i2s pipeline.
- configure number of channels and physical samples width.
Before being moved 'aiu_encoder_i2s_setup_desc' was called in the encoder
DAI 'hw_params()', whereas after the move it is called at trigger time
('aiu_encoder_i2s_trigger'->'gx_stream_start' -> 'gx_formatter_enable' ->
'aiu_formatter_i2s_prepare').

In parallel 'aiu-fifo-i2s' (DAI FE) already performs the very same reset
of the pipeline at trigger time in 'aiu_fifo_i2s_trigger' and then it
triggers the playback.

Since the DAI triggering order is the default one (FE before BE) this
means that the pipeline reset in BE happens when the FE already did it and
started the playback. This causes the 24-bit playback mode to be
corrupted.

This series removes pipeline reset from 'aiu_formatter_i2s_prepare' because
the very same operation is done by 'aiu-fifo-i2s' on trigger.

This series depends on c7852d2dcf66 ("ASoC: meson: aiu: align I2S design
to the AXG one") which exists in 'broonie/sound.git#for-7.3', but which
has not been mainlined yet.

Apologies for the inconvenience.
---
Changes in v2:
- Dropped the first commit of the series because, as found by Sashiko, it
  could lead to other playback issues in case the sample width was changed
  without closing the PCM stream (i.e. play->stop->reconfigure->play).
- Link to v1: https://patch.msgid.link/20260702-fix-24-bit-i2s-playback-v1-0-bcd3a43fe32a@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/meson/aiu-formatter-i2s.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
index b4604734fe88..cb554c2e7ce4 100644
--- a/sound/soc/meson/aiu-formatter-i2s.c
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -13,7 +13,6 @@
 #define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
 #define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
 #define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 
@@ -55,11 +54,11 @@ static int aiu_formatter_i2s_prepare(struct regmap *map,
 {
 	/* Always operate in split (classic interleaved) mode */
 	unsigned int desc = 0;
-	unsigned int tmp;
 
-	/* Reset required to update the pipeline */
-	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	regmap_read(map, AIU_I2S_SYNC, &tmp);
+	/*
+	 * Pipeline reset is already implemented in aiu_fifo_i2s_trigger() at
+	 * trigger time.
+	 */
 
 	switch (ts->physical_width) {
 	case 16: /* Nothing to do */

---
base-commit: bff7fad1010eea6f183fb110b54171cf8700ef8e
change-id: 20260702-fix-24-bit-i2s-playback-6444174c7cd7

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

