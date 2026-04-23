Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71183EE1F4
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949035; cv=none; b=E2Y0xYNhcXUSF4UWq4NPWJlXCgqrk8QY8fPdXjdA0vALneTtm/5j39wIOvgb/AKHnMg0G9uktt8Wje/TX5RIFmveOXVr2sqVrhYpWgIdUkxPrUMO/C+SEqMuKU42r5qfDPhrcQBcNQyQlcneB8UGaZdFAFPRF247uSC8fz0J1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949035; c=relaxed/simple;
	bh=wJ1fnWoxhvcVhNdLurZk+0yLTlJ2ErlrLLn7Bs9eHgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/0qqVJ5ayLkrh7Cvr1mAMJYSHxMCTAnsmyrtSIw7YvYjlWNA1PFPmSuOwli9LbUlizt3eGVVh8431M0q9dSWZE12bkzyxMXG8eWxFZTHSyGYlt1mphznGZ3JOzRI47d1kilLBaB7QiibWCwgePIA8IH5IQ1/sxeZ8FOdtHwo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwZHM82y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwZHM82y"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad617d5b80so37844675ad.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949034; x=1777553834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXv666WW+MgLa9bKzh/4dSM0XA2OxTrkc0diZZReIyQ=;
        b=BwZHM82y1ElOZmpTCfuc/nNIhGV1WyYrxvU16MDxxFu/55PgMPR/fdhledlUJwEvmn
         kMJfxLI31HzQPFG4BogU1eGuRaNt99NK+71ntv1a80RUNVBPLzbWsAqivnEaka6jMWLg
         z+d7cBqMOjIf/vAPfSqMTIACeGwUusScWQozKcq5BqRVUZi2ZEHEP9tPjRBWNdIy8qYK
         4BvfMNUiXvIMTfes4UTcKj060Pm65JdXfAnhgvj5ZC3aktZr8zTuxOWEVmuWOIqZuAyz
         stiza9g0M5FPykPug3OkW2KlAv4eKEHG1Bt8HLzyNI/9tpreVa/dEJ5a6YGyTv2enzVZ
         LV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949034; x=1777553834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YXv666WW+MgLa9bKzh/4dSM0XA2OxTrkc0diZZReIyQ=;
        b=WwFtrpYeyAWuVgeJObaCobSKjw4q2U0L7Op6RVOSpkHhe/OeLotPn4Xo3WS6hocrsO
         ZkQ9DkfaESf24sAd9RA6gPSe/T3+M2nUJmQ744RpH1fOogXC9gr8D65+oi7v3+Ws+Lce
         AcLP+vn0m6mtw21L0vqA7/u1mQoVI8Pl2W0TG7JFm+T3h62vhs5MlMTTXYAD0RDIQX6e
         Ui5e9D7KBJud8n16g3m1sVj1+S6IoTH49SMHgVZgZqv0+e7QJiuigEedDPEwMrHay6/z
         XEPANe7H8JZAkpyhS+w9Ll/72lK/g9Cq0NdKrnjDV+mOlU5p0n59bd7UAJnghgXOdKDI
         Jf2w==
X-Forwarded-Encrypted: i=1; AFNElJ+WmgAoNpXLyoL5A4zWRU1Lr4XmbNAqfZaSN5l/AbpjSb+9UAu63FqBS6Sfl1X6JdRsRzfNIYHWlxHNuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmTkzNjFzf8CATMxgVJOpm9CAYvUmt1mjHI8h9gRfhC297wmF
	cxtyf6ETwGvhDnWyftozgcmt3AVP0NNBMBkoiIL2UoRbq1LoGXarGR/l
X-Gm-Gg: AeBDies5VmA9pfXPmPTCWTHac9NWmcEsbZ1aImS4LOrCzaeOrJY85vr8KgrtxxpE/Mw
	KZGzCrKvJR8a4/tFxNQBjlhvbgGyMXB+qNab4IohIZWKIAWtgn5TqZ03OWwGq+iLO6dJNjAlGdD
	Dof8e2xp8ja4sUHUQ5xyH6QygmCKVSZsFyH+Zu+6v3x2R11j8EiM1SXzFlD2FruNQ9VQR0Kw4Nn
	HdZ0faTNm63CO5IUhVMBGBuV0dvzZf/huVjEZzPe3H9EK/1Lcn8J0KS2jZh4xIilZ5uywz1FBj8
	9imTMvmvcQ54htLi59giLgQASyuREzy2hk2jMvgmRDxUmMdWD+B3Aq+EKd+/PzCu90hw+QmHTnn
	gfUgr0gbUUXCLbhzwgpklrBKh3k2tqHq+VIZN/UnBY0K26A2wy6/LNwvyUARFe9LTZtHKzouoqk
	rJYGireUe+9Nt07fBEDfctmH0xSbocAzDJD2Lejrw2bUKRaBcK/XUFyKcMO0mp5avVE6DS
X-Received: by 2002:a17:902:7087:b0:2b4:6367:7b86 with SMTP id d9443c01a7336-2b5f9fc435dmr191850815ad.37.1776949033981;
        Thu, 23 Apr 2026 05:57:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/5] ASoC: samsung: odroid: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:44 +0700
Message-ID: <20260423125646.156599-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423125646.156599-1-phucduc.bui@gmail.com>
References: <20260423125646.156599-1-phucduc.bui@gmail.com>
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
 sound/soc/samsung/odroid.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ab3398f39f4a..5c5ecbea5331 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -36,15 +36,12 @@ static int odroid_card_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	unsigned long flags;
-	int ret = 0;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 	if (priv->be_active && priv->be_sample_rate != params_rate(params))
-		ret = -EINVAL;
-	spin_unlock_irqrestore(&priv->lock, flags);
+		return -EINVAL;
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_ops odroid_card_fe_ops = {
@@ -58,7 +55,6 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int pll_freq, rclk_freq, rfs;
-	unsigned long flags;
 	int ret;
 
 	switch (params_rate(params)) {
@@ -105,10 +101,8 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
-	priv->be_sample_rate = params_rate(params);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
+	scoped_guard(spinlock_irqsave, &priv->lock)
+		priv->be_sample_rate = params_rate(params);
 	return 0;
 }
 
@@ -116,9 +110,8 @@ static int odroid_card_be_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	unsigned long flags;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -134,8 +127,6 @@ static int odroid_card_be_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	}
 
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
-- 
2.43.0

