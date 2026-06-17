Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE343E48A
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692506; cv=none; b=cw5VZGt/dncr2krzp6oESOc4C+zWr1SYstlJrJwctlXqePRPt8JE+W1Sw9aD+xFN36NhAkqBLA+R12lITZTSlZIbxo2jrcLloAo8Hsg9oV8WIzkK1w+d38ISyXhPTMf1xL71sUaB1njHVE7oNhk3hLSj92QjTewoJtkTbZJRWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692506; c=relaxed/simple;
	bh=bnnbXh/V2n2+AtFO4atogpAp71aVpB96YqCdXUYXKh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRuIkjYhLs89obonI8mpwgrf8y0uiR66kGHvM0dF7KTFt1PizY0X3KR+nte3q61+4rXu77FR7h9NANI5hnjJBaDDoqb9Sk3THsmtT8wUlqMZjh519wTBb6YFmSGOapIH9Cw/uMtsk2BFMa/ODkJ3hKHc8jIGMfwXbo0N0df0Dyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1HsbCbx; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1HsbCbx"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137335bc3caso6883231c88.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692500; x=1782297300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=h1HsbCbx+OrcSeeWH5gttjbA3sN78vLQQ5KJacIBBE0OXX7pvuYPMWTzJV63/hZe/9
         0JDWhSCpEDJIgC6nsRjYbPYA9z+3COcfxoWW/gMJUh9NnG6tbnce4uu2mzXODOYlWZoS
         3kHqdlYaBATMlXSJmJpuHam+vCl3Gvqb0Bgh5itzwX48AdjcfmdIub6nGTSfuv+sFK2H
         OK/5HykAVvZHpE21xKhSjEseY2B5Zxe1z0Slb4JdAM9gtRdQ6MPmsAyeNwt0iqyRIZZn
         BPczn4MphW6zs3MNSyR9i9F27GO6Yaf2dqPiPaMhGpSknqrndBSheOQmh2FRZhFvWAyM
         KZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692500; x=1782297300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=MmyxqEyzwH/ycQlstF0bK7rA84HXFMMnTjW1adBwehVJwfQ4S8DGDQIqhvWtZEQzSg
         2n8kVlUgK8BBuNs1n1I9SHqbbqoU0kc4pRShLWJ9QmLl6RmssABq3PGF6bStl5OKW+Oc
         pFAwn/TzYbm2kVad/N/REMsjavxptyk+/9y99AWMMqRu9qfbkJVk62ckF+LyuueXIeQp
         xJIu4M8W6PlHunj8M/LOdq4ClUVPDmJr8t9Gy7dajUw54RWwBc+ppK8hM5/hBXblYEtD
         AyUNrB644vXLJyN4L9EWJPmpil2liW5r1eQx6f1DfIet3X6uoeE5q2IuKmHOv1N5NK7M
         PRfw==
X-Forwarded-Encrypted: i=1; AFNElJ8EJeBfM+rzLkECZycktIdNm5wKgNwqNrucAJXRfRr7mShe37283w049RBqXr5FTDXg9iJox8t3cyUJvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweZoF7Q/VjnEa3+by/TMyNgYsoRjVXHa9EufHJH1dm/STkpo26
	RNz7xVx8xbMdsaNrQOZKzUb3vlMJXFRehF0FGjr+fGISxTSvxCDJyMLq
X-Gm-Gg: AfdE7cks2xYpGQOxvpiw5YvtAJYCzOz7HLRydSOVqenFW820UMtbgmdKmSNWcif2N3O
	MBilJhrbzgthJiqc2K758+s6SSpgeiWFTuXivhLfpdmqkdeiu8JEslkifRJzo6MgRhm0j0UdZp4
	cD+NNQZfB9kXbR5mIigeklzaMGNuT8FLceq5yqd+wCcgapNjYMa2Eqmf0cCxRkSXqqYNetKFWWo
	Of0f7O3dte/W2JkI84kkt9GSgmecOwMleXaFL5vjbb3c+Ttqu7C3BVfKxHIWpiWllsChiz2aN4Q
	zcmzs116KXig2nQkSWNjkS2TkK+jECOpKhmX5bUm+qFxaolY7NnA5TXcNj6tuGUoUVW0NW9NbtZ
	iGpL2II2Oo0yvoH1PaBkVbuo5yCP9RgWU6j+h8Xa7PYHzhI/sWYYHeavTd0dyFBP5SfKSQOxBV7
	BDQ571eU4gvgNi4pEye6EisXWSTIeAiuH4dL9ksg+ySptLnnc=
X-Received: by 2002:a05:7301:7c0e:b0:303:f295:4db2 with SMTP id 5a478bee46e88-30bc91d96d0mr1569188eec.0.1781692499885;
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/78] ASoC: codecs: cs35l56: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:30 +0700
Message-ID: <20260617103235.449609-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs35l56-shared.c |  6 ++--
 sound/soc/codecs/cs35l56.c        | 56 +++++++++++++++----------------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..6cb835a5aaac 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,12 +645,12 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
 	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
@@ -692,8 +692,6 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 err:
 	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 570a68829ccd..98ebf38c9bb7 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -848,42 +848,40 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	if (ret)
 		goto err;
 
-	mutex_lock(&cs35l56->base.irq_lock);
+	scoped_guard(mutex, &cs35l56->base.irq_lock) {
+		reinit_completion(&cs35l56->init_completion);
 
-	reinit_completion(&cs35l56->init_completion);
-
-	cs35l56->soft_resetting = true;
-	cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
+		cs35l56->soft_resetting = true;
+		cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 
-	if (cs35l56->sdw_peripheral) {
-		/*
-		 * The system-reset causes the CS35L56 to detach from the bus.
-		 * Wait for the manager to re-enumerate the CS35L56 and
-		 * cs35l56_init() to run again.
-		 */
-		if (!wait_for_completion_timeout(&cs35l56->init_completion,
-						 msecs_to_jiffies(5000))) {
-			dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
-				__func__);
-			goto err_unlock;
+		if (cs35l56->sdw_peripheral) {
+			/*
+			 * The system-reset causes the CS35L56 to detach from the bus.
+			 * Wait for the manager to re-enumerate the CS35L56 and
+			 * cs35l56_init() to run again.
+			 */
+			if (!wait_for_completion_timeout(&cs35l56->init_completion,
+							 msecs_to_jiffies(5000))) {
+				dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
+					__func__);
+				goto err;
+			}
+		} else if (cs35l56_init(cs35l56)) {
+			goto err;
 		}
-	} else if (cs35l56_init(cs35l56)) {
-		goto err_unlock;
-	}
 
-	/* Check if the firmware is still reported missing */
-	cs35l56_warn_if_firmware_missing(&cs35l56->base);
+		/* Check if the firmware is still reported missing */
+		cs35l56_warn_if_firmware_missing(&cs35l56->base);
 
-	regmap_clear_bits(cs35l56->base.regmap,
-			  cs35l56->base.fw_reg->prot_sts,
-			  CS35L56_FIRMWARE_MISSING);
-	cs35l56->base.fw_patched = true;
+		regmap_clear_bits(cs35l56->base.regmap,
+				  cs35l56->base.fw_reg->prot_sts,
+				  CS35L56_FIRMWARE_MISSING);
+		cs35l56->base.fw_patched = true;
 
-	if (cs35l56_write_cal(cs35l56) == 0)
-		cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+		if (cs35l56_write_cal(cs35l56) == 0)
+			cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+	}
 
-err_unlock:
-	mutex_unlock(&cs35l56->base.irq_lock);
 err:
 	cs35l56_enable_sdw_interrupts(cs35l56);
 }
-- 
2.43.0

