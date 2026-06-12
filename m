Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95F5282F06
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270826; cv=none; b=ttTPqgf09y8BiPHmhRihClVhSDGB43FV4CB7EALPPT0giaY1OqqfbvT4e+avNbgeBCu8NCpndtz1cH5pjfyKr5XBCpjxAxw9YNlNlqxqC/5o3RfJ4oUjO3kZLybAY3ta2nieSKwsOiD5k90ott8QeNaaEmTrd2J+TEM2GqJ5s14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270826; c=relaxed/simple;
	bh=a8q+/xYdawHh02h+UnPjMJx9XTz6+kkAdJhtry5V5R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OP1fRKKYNXuPGmbUj6aRcJlypqtBNwnkhBhbgizvTevm0rMZIblu9H/vuvzOdek5xl/qba9KL9mUoRNT00OdluGWbZ9lpLSJPwF48IiX+jYwTrAf8XxPk3r2OmnJve6w2+f/4l3NILa/MkO3l2O7dK1O30PnP2gm8hnbx+5qmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLuxOriE; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLuxOriE"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1384eb94d20so702638c88.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270824; x=1781875624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=GLuxOriEwVrAeapttbMlWHpWk1Qd6vqK0D/LKOITb6mM7SpA04ZZ25P+NOP1LIfG9o
         fARzWD0P3GgmR+RSgBrobasgBf60jHkIqdh5wSEtfO9MQ2X/h//svTCy1xr/pLtXMtod
         fRrtD2wNc3sowpXF1Z/A7WWk53DsW9/G4pjq+Rina4nKE0BWTHBp9gRRrA8SPqarLrmx
         ATODtaGKRR3GPAKLrMHzhpx0xKm5WBdlpWQbV5331bZV23d5cPCTaeYe1p6fQaJGo1sm
         J7skghrpjf3bZfcAZr+yb1cZRCZD17epJ0w4iWxGZhQJIwyQJnzg9kNBGwliTf+Z48pB
         0VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270824; x=1781875624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=NJKU/8ymNxQ0Pg3CpnPb2jyHaP4zulUwKQ4YOixJqtIwXywKyM/Fcw2dc3Qpu44pA/
         HOIAUf0l6vHQkW7xrBuVIel9K9PFztjFmxl/HdcZv+aYGOX8L5FnBADTi4THRD+CUIZB
         gylS2TUEJ7waYT2SEKCy5sDwllaOtMqt5Bb8922FIXW8kI21q41Hk67usa862itCfOsZ
         hOi52Rs8A9YdLoC0pA/ObnRzFNHG2RGv1q64sLKbrQhVTrdAyG9+fpIu10Xfx25FcGrm
         Aq0d5dcWsjDGaV5jigyUhSoJspkHCBIIVzSaHrxfGSyIWvhd94xRbLWP6VloekEaD8jJ
         Ufpw==
X-Forwarded-Encrypted: i=1; AFNElJ9ax1AYXaeQfIYhm/hV2Ns8BKb4mf1eA42UclvvKoAL5XlBkbQB0rBavLbMEOvUF8Cze2BZqQmcQ+ITDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyANtG2NDqeJxhr/1H1VfWSB+H/8vkihuXxCOEPThCuZZk6cMic
	Y+X1kcJj0m4M7L8AG/iB0oLS/7JgUAvUZm5UTJRSazOIDV5Zp5Hkd5LP
X-Gm-Gg: Acq92OEVbM8JisGywsR8UtT0nyqqekRxTuD2NITcl089NM22rWDCzv92PEEXLPizLhp
	AKcpPComLeO/pjGRjucRi6RPmPNHhnZllEpwrGTDuVXLrjvZ4c+9Kl5UD9CDZhn8qcvegqlFpBI
	FJ3pNQZcr9fX/YQlPUatkzGqGoLh9i+qCrnUYnmbccuqQoaaPK90CUvafzy40OXTCs1FrFggntH
	PWWMAs8TffytaEQ49++dqnlpOHhCLTuK4V4dKFZSigh6et9uF5kM2tPyfkBE7eesfnK3tLEDa/m
	VVldngsoT0xX3eycyqLPfPC/LfNk+JlPesTLXFwy96xTPviVgBFkNQuMpdQ1REK+4rFxoViHbP2
	SGYJ0mdklkCPBr+nzCqpXSCxK5c03hqRaZneWQQKP5CyO4w9g9VSNyd37dcDMClsu9EHZq/rqNM
	kUSsep8a6b1MnTCmP7RopNyRg0P23PjXUpK13lCW5VUI0zMml7gdzFWlNbIQ==
X-Received: by 2002:a05:7300:3c1e:b0:307:91f5:9377 with SMTP id 5a478bee46e88-3081ff945bcmr1832507eec.9.1781270823971;
        Fri, 12 Jun 2026 06:27:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:03 -0700 (PDT)
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
Subject: [PATCH 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:29 +0700
Message-ID: <20260612132639.78086-2-phucduc.bui@gmail.com>
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
 sound/soc/fsl/fsl_asrc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 5fda9b647c70..0b28bcfa47fe 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -222,10 +222,9 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
-	unsigned long lock_flags;
 	int i, ret = 0;
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
 		if (asrc->pair[i] != NULL)
@@ -250,8 +249,6 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 		pair->index = index;
 	}
 
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -265,19 +262,16 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	unsigned long lock_flags;
 
 	/* Make sure the pair is disabled */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	asrc->channel_avail += pair->channels;
 	asrc->pair[index] = NULL;
 	pair->error = 0;
-
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
 /**
-- 
2.43.0

