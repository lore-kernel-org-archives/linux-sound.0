Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013FD37756C
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669038; cv=none; b=eJ+jdfNRI+ww3io+5BXn6X1IVfRyded+VOpvBXYW0MR5++jXJRrJxmCrHjww97axTRR94LiAj9xZhuVXbJ/nrfS6WfaQn7boL6grTWGuu64jKQq0PXKK30MIAVPJvVYXwWZcWqSiIPjc2bmgU5nehuyTjOpyW+u1KOikvhgJzxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669038; c=relaxed/simple;
	bh=JWdgOSM2xcYoObfqy5JM0x9eGg0LNLYdg7YJowxbdIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNy7mdAZFmDsK9bjRgDP2bg8f2mDn+QTmQbggtBaMPVI4o451X1Zn6eB81UZgR/CqLAI+9I7yqO8ERBa3M30PeZ9fmtOlhR2ctpQR7FPRym1fr8cPWyiWv+SSezJYGHS1qvc0vMDdWjtltyYaRP0/0shrCrXxd3KwH4iwJK1I1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDD0KDy1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDD0KDy1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bab82d75fdso36686315ad.2
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669036; x=1779273836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=KDD0KDy1iu3iJetNVefoZDinXmrwfoJWoopZGoDiEgCLeLGDiowD8wSe2kyRMvZjXf
         CwvdH4fW3m8lk7diwOU9bv1LtfQJ0PnSB8hZFWgyBvAfTP4w7jg2FP3gmcOFnG2JtcKY
         4u0yJU13/ZtDgUAyIpypwBOBxIb5t0UqHl+Bv2xMO8xuAy4qgq4V6KzTlFu0Wr7R4cr2
         1bPHRNJzmSlb5oHi7sqcJU/3OBerq2d6iEGevGz0R2BcA/nI4++oBdymn7d2CyGvmWnR
         /7YKYvb2zBo8bWyipbTgAKVKD6vYGetDQ8ILTx9Y1DO8NpoXnynGdDMH+rs/n3g9czGg
         /Y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669036; x=1779273836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=B07NyGDb9vVl6RFbcZ8Bv0MPtpGZqtsyYo4TY06U4qgwHHLE/dWpdfLI1Mz/dywwY6
         Z5UeOcYkGeux63ER9qv+gMFlHLcdtmlY/SQwJFtv+qq/KS3XKRgxiQdn9cvocmPIJSlN
         D1+tcU/cxo8Hcj1GUSlzqxWVUvhRam87OZMi4Z1dKTz27EooJGPMkrF+/O6xTutx96p5
         Msjd28EOZrhhG5LeQjnfi2kWOnFrwa33UjzwAeoIdHjzizSFgTfR00qN5ghAP+7zNyer
         VhtgLhGFBvm8qisKDtjPYDHHQHX1LqancDdb+wsHN6vboywQ9XeIo6jHr5wuoT7p6DjH
         fAmw==
X-Forwarded-Encrypted: i=1; AFNElJ/8XCq4ZwgEG1UFAH887xkAuezs6O7BlH5GCLyL8gps8pm6RmXRwG8rQx5Id8oio1qIrtPw8/5Dbss6NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8z/Oz6Fu4u6W4o1oYLVJZgqgb5XlcINkazpd5cbKMj4vHZw6
	g03tYl1L1q3GQKizKWoVPbjFOpCSIL1Xc3RTRB1v1BdMuulRNkh4m+57
X-Gm-Gg: Acq92OE0UjmVTILPsch7KkQjjAe54qjyH/M84F+ZdmlWuT3GBALnwmOf+fkChZ6FlaQ
	DDY75oYDi7eADeLTl3Okkum5CeJ4oG9vYYAoca6Bf0aR6egPQ0ptfR5/MJ0KrAczFmJIo1mwWh0
	0h2e4T5S4iY2q94mllwLesqGGuGVSPHx1X/CUA5WpPL7zFPPkz25CVh6YAWtdxz3qQQM9kM0nvK
	AaCWFRJKh8SHBOMq2L52e2tKj8axDKBJ0KatTrYjTSGTvhvbOGbqUj773OBjBMxXsKpBCBEuS/Y
	LRTXs3TU5WVJPRFC07nnZ4k+kauo705IW537rqtUynyxW42uQPVlnRkiE6QcPn9WLM1cKqJCFGF
	nrvCjO0b6xLusLIylxGGzGV0cgI2dSXyh0YIQ3mO0IZmXwgT6wtuQDjpDgcXP6ih39YyiYPwwUc
	N2aNed8dKwQL7IeYMLt4DrtUu2yKKxtN9ZCq3OfF1ui3CTBC/4O01TtQBkcNFNzEsOlErD
X-Received: by 2002:a17:902:ba98:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2bd26f75ee2mr21419305ad.0.1778669036225;
        Wed, 13 May 2026 03:43:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:43:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
Date: Wed, 13 May 2026 17:43:26 +0700
Message-ID: <20260513104329.81592-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/stm/stm32_adfsdm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 0f6d32814c22..a585cb9fc011 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -62,12 +62,11 @@ static void stm32_adfsdm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
 	}
-	mutex_unlock(&priv->lock);
 }
 
 static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
@@ -76,7 +75,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
@@ -88,7 +87,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	if (ret < 0) {
 		dev_err(dai->dev, "%s: Failed to set %d sampling rate\n",
 			__func__, substream->runtime->rate);
-		goto out;
+		return ret;
 	}
 
 	if (!priv->iio_active) {
@@ -100,9 +99,6 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 				__func__, ret);
 	}
 
-out:
-	mutex_unlock(&priv->lock);
-
 	return ret;
 }
 
-- 
2.43.0

