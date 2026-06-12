Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CFA3EDACC
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270836; cv=none; b=YQlLbhHp5E8rCvL+CuM4cmSZx2Bwzi5GiCB7Df+zKNgN8qGOTD4nIIyNQ+IGPmUjdAFpjwefcjNW5bvT6b1s/G3Zu8QpKswOoDBNU0sZlMtPCqXz1qEaBs9MBw1krQFio0u4Q6In4+DYWpdtjFwgBKZpDx1YT68RF6xGrfDR9lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270836; c=relaxed/simple;
	bh=eGIrG7UB1lhufDoMtkQ/eRxkJrt6N3pqPE1KjIIgjbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArB1wwKu58Q1ihSfq5DmFQVJ7O5XqpeJVxvR3UV2UElugls/b6Eq3RdvrdGKO+l/9m8xWbWRFMSNzOSHr14lbHBUmzOUNtTv8JgmuCjKQlVxi4yrBj7NJQdypm7Tg6R8Obra41712pUv3WYUjxGx8DBzNlk8Eb5bcjH+RL9qZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzvO1gpe; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzvO1gpe"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30749947917so2923787eec.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270835; x=1781875635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=BzvO1gpe0nEm8z7RhhT3gvpOX7WBCOC+62/Yq2yXPJvN4dy64nQgPTGznB9qQseXyW
         +MhYpaN49nl6o4aUhRwMKkgqDvgcRFCIYcexldQwIHRnm3ZIdc5lZPSFLJ3FHmFRxMW6
         8hWPRF2SRiNjCyFCwxJAmve+mPwUyfvyZDcrlaK4anUFkZEyh2nBNqbuA54TpcPLciqp
         +I5oOWBmtgaXiWbRfhXhs8B9lD1q3OCRtCh3zYGKeAw4XUWl6AdNEXsMtANCPV5zjGgU
         9wvQlxllBH8VQjtqvsOCR5AtWuu9Il0oLET0JgEjW7c/3SXfO2nkiYiz8VCOWMZ90Svk
         tO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270835; x=1781875635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANb0KIfsTx8/8tZ1jjFTsAAUSzrIuzqzfqRTdMc2tcQ=;
        b=YC2NZwWUx5Df6ZjsVZroN7Sdp8/32wPXlgvFI2lJcB8Y6hEuNYPCj3a4ZwBE7+9syF
         GoOSE6sa+4t6IQ1NeteMEaMy+hOP5fq8ZOfalUU9lNyjDOGEU+yee53fc71oVc3bb2uH
         ckMGuRCDtiwQ9nUgJsdA6QkGIYRAG+kzniQ+oETQk8RA2Vp6p9d7xWyo7SEJoGIyneVX
         aS4FhiVzQY9DFMeJ0UKNBVUv2whCImaaOlV3AVte/8RpJqmpuDtSjfFenZOjWv1JU718
         uuaKxvg7CG1gFESIPr8J6QLJvdYNCIHpG0yUHl+4qqTb0Z2rqUYfidTyRUGlmQy0i5/J
         Wj0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8V85CWqnklVwjnzOs3+EO+SkxVntvhmCWXm0UtFoYsc71t0gemOlXwPZR4EprWQ7IKz3RuDwwJfWXZZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zi81bMt3TT536lz8+BjMYbcD6ef2go9jwmgp0IQDjB5vgrpO
	DXhrEUd/XSPS6WSACNbFJ4hrpAUQkk3X9TIASmG/RVj+Fzi3NSbF+YbI
X-Gm-Gg: Acq92OGejkurUcoEcPdz6Kv8juganxbfb3x6dQG5C7v2bqzjgg0OOqkAVUd/i8jKOnK
	6rCVRo9ae7zqi1XPFCPg2Q5wCYpxWWbnlL6McEuumgremAc9PoGHFLjo3vv+CO9eseQ0D0gmKSL
	pXQyszijiiye1/ffC7J1xVUDVyPgcKWcSWoKCi1KRdrKX/MxMN75GK8cnE7YFbT5FFY+aTjBVEL
	02jFT4igw+k6mrMkWtt0Fu6xdp5/Y2xFl0+8FufXH3CbcCZ0YTHLdn1Z0IvDbyEe1q8vJzriT9d
	GE0ko303qjVFG9ov43LLgkak39VWSD7RyV2wkp6Ha/Tpq4oQBuaDYwVMkBFDAqdW5wJhQYmF5WI
	MtfDHFpqdLoexQNDizC9YAKdrqBBui1N6x8Z5V/UoQPwC9mTCF53asfA0H8lDUtwPLd+i+Rs8Th
	k5TY49v40Kn4BsTfcoeVks1LIqxcrn5k7D8zzWF0geavWJ6y9J/y3Vo4iO9AiYp3pAatMo
X-Received: by 2002:a05:7300:ec09:b0:2ed:e15:c927 with SMTP id 5a478bee46e88-3082021fa5fmr1811315eec.35.1781270834683;
        Fri, 12 Jun 2026 06:27:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:31 +0700
Message-ID: <20260612132639.78086-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_easrc.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 114a6c0b6b73..edfd943197a0 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1025,7 +1025,6 @@ static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
 	struct device *dev;
-	unsigned long lock_flags;
 	int ret;
 
 	if (!easrc)
@@ -1053,9 +1052,8 @@ static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	ret = fsl_easrc_config_slot(easrc, ctx->index);
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	scoped_guard(spinlock_irqsave, &easrc->lock)
+		ret = fsl_easrc_config_slot(easrc, ctx->index);
 	if (ret)
 		return ret;
 
@@ -1301,13 +1299,12 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *easrc = ctx->asrc;
 	struct device *dev;
-	unsigned long lock_flags;
 	int ret = 0;
 	int i;
 
 	dev = &easrc->pdev->dev;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&easrc->lock);
 
 	for (i = ASRC_PAIR_A; i < EASRC_CTX_MAX_NUM; i++) {
 		if (easrc->pair[i])
@@ -1331,8 +1328,6 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 		easrc->channel_avail -= channels;
 	}
 
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -1343,7 +1338,6 @@ static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
  */
 static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 {
-	unsigned long lock_flags;
 	struct fsl_asrc *easrc;
 
 	if (!ctx)
@@ -1351,14 +1345,12 @@ static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 
 	easrc = ctx->asrc;
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&easrc->lock);
 
 	fsl_easrc_release_slot(easrc, ctx->index);
 
 	easrc->channel_avail += ctx->channels;
 	easrc->pair[ctx->index] = NULL;
-
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
 }
 
 /*
@@ -2292,15 +2284,13 @@ static int fsl_easrc_runtime_suspend(struct device *dev)
 {
 	struct fsl_asrc *easrc = dev_get_drvdata(dev);
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
-	unsigned long lock_flags;
 
 	regcache_cache_only(easrc->regmap, true);
 
 	clk_disable_unprepare(easrc->mem_clk);
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	easrc_priv->firmware_loaded = 0;
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
+	scoped_guard(spinlock_irqsave, &easrc->lock)
+		easrc_priv->firmware_loaded = 0;
 
 	return 0;
 }
@@ -2311,7 +2301,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	struct fsl_easrc_priv *easrc_priv = easrc->private;
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
-	unsigned long lock_flags;
 	int ret;
 	int i;
 
@@ -2323,13 +2312,11 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 	regcache_mark_dirty(easrc->regmap);
 	regcache_sync(easrc->regmap);
 
-	spin_lock_irqsave(&easrc->lock, lock_flags);
-	if (easrc_priv->firmware_loaded) {
-		spin_unlock_irqrestore(&easrc->lock, lock_flags);
-		goto skip_load;
+	scoped_guard(spinlock_irqsave, &easrc->lock) {
+		if (easrc_priv->firmware_loaded)
+			return 0;
+		easrc_priv->firmware_loaded = 1;
 	}
-	easrc_priv->firmware_loaded = 1;
-	spin_unlock_irqrestore(&easrc->lock, lock_flags);
 
 	ret = fsl_easrc_get_firmware(easrc);
 	if (ret) {
@@ -2377,9 +2364,6 @@ static int fsl_easrc_runtime_resume(struct device *dev)
 			goto disable_mem_clk;
 	}
 
-skip_load:
-	return 0;
-
 disable_mem_clk:
 	clk_disable_unprepare(easrc->mem_clk);
 	return ret;
-- 
2.43.0

