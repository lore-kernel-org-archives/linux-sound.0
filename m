Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DF1397689
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454203; cv=none; b=BiEUGVrPnoOiuJi3kROQ1D9b4qctU1ZxH4QSb3vGgMHqaPuq4Bbe0o3BAeQsSj0PFKOXjtpoHe/hz2LMPLzQ8u/fbdFlhF9ETdaaqP7o4Qc/2hkhEQeiPwcdlPvaySVEFOsp6D+nSXrk+eAdGEIYk7O/VB7ZK3YDplko8zydwvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454203; c=relaxed/simple;
	bh=asmLzk15w4qcDc3+YDRty0B27VnKKWHuP4plGIAO018=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bl5na0qDWoS1ByA/YR5ufPoY9oIa6n84DEXlybPn97CrcfdpN4S2y/TF+2CMSE2za/1yjzP07hma2Ep/S/Cj5mNF3axLodlDdppRXzWywxTWHgXtKEZTfcIiL9QHKjafCBRC9WK25vQttuddLVXxabrfcQDqihiAGcO959/rasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF75QOEr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF75QOEr"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c796163fac5so7652477a12.1
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777454201; x=1778059001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mR6jaRrQtul9BjU1rNfgdz8/F4zlTqQGy4RoZ421d4=;
        b=EF75QOEr0tbtuxP6tmqcNKrWcgCpYHsjpTxEiIs918o8gGLoP1nTnvJhtAq+lSGDUK
         YLlnjRlak0NlDyLN8nZKqvWd2owW7s/DZM+o6Wa34luHxf9UZS58vbV8IpHA0nc45nUm
         VZqP/UTtSo7JIiKtUpg0bTKVwxuUT03XJs+tSX1KPWGTqpv3KR7vkfZqdKLXggMUeHpx
         8dclo4IjKSjr0BSs+fqeiQ6qv3egzxJazvDnsK5tO1nm5hBglUPfG3g02N23UOzgcUJL
         SDnntI2o+348WRgCmDvLUphKSdBoO7DfIPSKLQHhHwGQ+05EQZ4A91ycDgXdFjVSfpbP
         m65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454201; x=1778059001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mR6jaRrQtul9BjU1rNfgdz8/F4zlTqQGy4RoZ421d4=;
        b=nWrqy2RFQZ9p4Mj6nEJTJtSYf+tjVvv8luJhidMZdn03tuMg+5Z4I1rUIlxSSp0Xrx
         CFJetaJks12iQNQgLCniXG32y05iP+ARmNnQcn3nX3iZ2mtYVdr65yj3F+yCdfyeeCYq
         QTc4/ObDXd1cD6d4bJ2c+wf10G7OVCn0SzJ5GN6ubs7kzN1LZ0RXz4kgW3oJ3o+Tn2B/
         b37N66C7Qwwe2jpizE4xThOkC3ejW1r5seIoXeXRjndCMzZzraUXtfC0uLYWYKKUjhWm
         GxyuKf4YN4O6SPPVWzQ9biAOvJ6crwJLyuiUdfHWnWYtHGtQ5oaWH0xUjDiDxwuY/2v2
         xpnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uovaUIDwb4MAw9sAOw0xNuBXC/0YzMM3LL7drbv3KicGWw3wJh2zL1DVSCWhfzTOn8AilX7+iiUrbHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNetopqv3WWdGRCyLcoH9XiqeaVxlzEfsPz895Yj1/lFiCKjX7
	Kbm4AfQXVbiidBfvo4J7lp1wGvkt++BcdNdFes4EiTNYGqMaQYFgQlG3
X-Gm-Gg: AeBDieuLN8c/QGd8Tud160593mvKEwrGGnr+gJVZSB3Bgkb5kLodva4gtH4lgi4N+xZ
	MVfftIu454I5FnoSWQjHWsViFOyGdRy9sRnuzJdgLW4tPTET6Cn6qjRxbgVVnYqB1UmagojoUc5
	An6SliSQllKgkQasU7DN9dNoA5XwMqLfJ/YxhEvrFCWTHVulRJxbETTgL5wSnmmcj6YftRClQhY
	bMK87QXZASqANjIj8MfiBhyyNFvGMQBuDH2VbGPzdbrUWpdwFpyHahe6QKRx6Aorn8SQb/QWD/d
	7E9D/VA4US+5/i8l2ekAr/ousMEpkd7Z2VopVesheN95Kpoqw1cbaBLLa509D+mPUWtmfj8hMD1
	jpaCMwWHwqJOBhI2UO4XcSJG4sC4KekX1eS3CM0N4gEk5arBtEBubPY3vMaIX4hz7SaXiekKvSs
	IKYAyPy4rNQxM0s/J5f4TpW1j7LNeTbUqH0m2wuoJuQM4W+sco76K7rbEwPkgefYK4EufR
X-Received: by 2002:a05:6a21:e082:b0:39b:d937:8010 with SMTP id adf61e73a8af0-3a39c388dcfmr7710744637.45.1777454201088;
        Wed, 29 Apr 2026 02:16:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5cd3b8sm1586865b3a.16.2026.04.29.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Miller Liang <millerliang@google.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: uniphier: aio-compress: Use guard() for spin locks
Date: Wed, 29 Apr 2026 16:16:13 +0700
Message-ID: <20260429091614.96667-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429091614.96667-1-phucduc.bui@gmail.com>
References: <20260429091614.96667-1-phucduc.bui@gmail.com>
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
 sound/soc/uniphier/aio-compress.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index b18af98a552b..57247a03b5c9 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -183,18 +183,16 @@ static int uniphier_aio_compr_prepare(struct snd_soc_component *component,
 	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
-	unsigned long flags;
 	int ret;
 
 	ret = aiodma_ch_set_param(sub);
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&sub->lock, flags);
-	ret = aiodma_rb_set_buffer(sub, sub->compr_addr,
-				   sub->compr_addr + sub->compr_bytes,
-				   bytes);
-	spin_unlock_irqrestore(&sub->lock, flags);
+	scoped_guard(spinlock_irqsave, &sub->lock)
+		ret = aiodma_rb_set_buffer(sub, sub->compr_addr,
+					   sub->compr_addr + sub->compr_bytes,
+					   bytes);
 	if (ret)
 		return ret;
 
@@ -223,9 +221,8 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->fragment_size, ret = 0;
-	unsigned long flags;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
@@ -242,7 +239,6 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 		dev_warn(dev, "Unknown trigger(%d)\n", cmd);
 		ret = -EINVAL;
 	}
-	spin_unlock_irqrestore(&sub->lock, flags);
 
 	return ret;
 }
@@ -256,10 +252,9 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
-	unsigned long flags;
 	u32 pos;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 
 	aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
 
@@ -273,8 +268,6 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 	}
 	tstamp->byte_offset = pos;
 
-	spin_unlock_irqrestore(&sub->lock, flags);
-
 	return 0;
 }
 
@@ -332,7 +325,6 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	size_t cnt = min_t(size_t, count, aio_rb_space_to_end(sub) / 2);
 	int bytes = runtime->fragment_size;
-	unsigned long flags;
 	size_t s;
 	int ret;
 
@@ -360,7 +352,7 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	if (ret)
 		return -EFAULT;
 
-	spin_lock_irqsave(&sub->lock, flags);
+	guard(spinlock_irqsave)(&sub->lock);
 
 	sub->threshold = 2 * bytes;
 	aiodma_rb_set_threshold(sub, sub->compr_bytes, 2 * bytes);
@@ -376,8 +368,6 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	}
 	aiodma_rb_sync(sub, sub->compr_addr, sub->compr_bytes, bytes);
 
-	spin_unlock_irqrestore(&sub->lock, flags);
-
 	return cnt;
 }
 
-- 
2.43.0

