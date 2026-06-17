Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46DD42EEC7
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692487; cv=none; b=TxPRLp1PM7UqWilxV7emYHA5NQPsBKq/cze53+iy9u8CkCuIYOIRXiBHRBtMP0ySmHumVBnDtDGWF2NlR1uCqzAl+HloRIa3UcDssu7XZRP8MSm9rC+F0vKMPgxvZCBDEIECCuD8+pRpR+OnpQ9Ib3WbOjN1ddpv7BHWzoyIhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692487; c=relaxed/simple;
	bh=uNHjTev2hmfXRNq+0ljawWlrrdZPdtmV526ovzJ70zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=En8N6TmMM00sF0/v2JE+18+gQfBohsyzbayJhCTsPQJxQsATPQqszoKQ8nypXwg4kntPc+7FE2PYSkyzBSzVFPB4Cw39ph1Nu9D7Ob3ShvTgFdSRYElnB9JjJliNDHvZD5pL1FrT4A4nrA9kt2cPSaMZBgPf6BMYKtXGFRlyw/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gC5dQtKc; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gC5dQtKc"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5789824eec.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692482; x=1782297282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=gC5dQtKcFYiedc6//kN5l6JjET7BMhWoBFeLiNkmmDi4Myn3zPBKxW3+WqgiaoKrNP
         iBDgt0GvEGjkK/UF+ypPTFBsdDEbNt8EOEK7duJPWtvQfXAtglXtn/7TAurS2ZAwS2d5
         hyKrlS6RTTcLC2LiJjOCq3CZw53hS0TxSBz0CJmriYkcDiwC+bTxD2JvSwtO5Wop7MyH
         1y/A0R6UXmsMyNIPjezEztYcVRKB6CNaVa7AeedTgMVAvFQ4pJd8GO24Mg0eFAqCMd2l
         1HrsA9CQLAh1z9fy31fvDarpG+UV6Kd/9/leAe8JiKGTApNng1ayLi9re40DnAgc93Qk
         X3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692482; x=1782297282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R22m/pLPBKiTabqFMhVFBn5ZxuG7/U6c6Q8dEuLYd8=;
        b=TNU2Usqiwx+bE+gQNvbbFrz6XI8sBvIXcFcosK7pS/vmgjXhG44oQjke26dJ5IKJVr
         YzHl6Zw5emc7+9mTimdrijfK+pgeA9VkXN+8+05FZgLhqNzC78s+2AR2K5zH82xxU3st
         Lqs3t2YAaKdLvVJmN3V5dGqMwK3JrTmwNt25hki24PERy1FZ7iVsVCw7V2APsCmqzXNY
         F2XS/St3z1+yWBevnUm95UHu0CqBl4qrIv564lr19IobT43+IQQy8Ik8D/T8p3o0G5kj
         3QzfbjzvgeglBkeD8fofJm/aP8ZEsSvBaSOTLop0xF3j0mslN2UDNTyCnVVqJT/pdk8f
         Jq4A==
X-Forwarded-Encrypted: i=1; AFNElJ/wCWbGJJMtZib94DTVbqPrSslEm3rEHWK+cW4EaGudFT6NSHBg8Rizb3eBZ+WBhr14mK2DlZ7Ss+k1Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzngt1fDY7vQUxyboVtClwXAFkbSVzzWU3WfCZXMbzLdte6j3CK
	FwajVBIOONPXFtUpoZ1JJ1VSeeDAmOmSconSU9wg14Hgn3lCvjbaudIw
X-Gm-Gg: AfdE7cls/lU2E9W6FZKkzUEsW8A5ccEpIe5JlacoXK9bPiU6QS+YPrWP3lQlcuhBozd
	l7T1Vt2hn531erjwYS2gI3wAkK3Odqv3kLEo06JLWUQvNP5yXJgE2Zea1bTBraEgRkOFfrvTyoO
	3J9nR2ES4DhpRtxNPaQIsbTPsiCi3XpTzXL3BK6ZqYklVh+QVZH+6O+5e+Z5cMNaJdW5315jgZ5
	szAP8ifid8VsqqHQOlm5FDstVFvG/x9o0Gk0Q1ZLkNSSDHYXPr41nVwtkiAGqotyfOrOI+Q+OZN
	IvkSpQCyJiNOpTD+2oc4q1gknlvZphewq6uVrCu49CwGjZy7XNqrU34zEMu4AyWDK6UeVpOcgW+
	vEPr5tNt6KeJ+Giy2l7NnxHUSPs4xpRyShidQLBYP6JEQfqwhgbIQw/dPPKfbbnoh1PwyUE7PrZ
	UTaW1OWxm8cXLvj1gdU88IB3ArL0SorZ9sAazkxcDCP70maSA=
X-Received: by 2002:a05:7300:6d15:b0:2ed:b131:240e with SMTP id 5a478bee46e88-30bca0dabccmr1625180eec.23.1781692481713;
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:41 -0700 (PDT)
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
Subject: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:28 +0700
Message-ID: <20260617103235.449609-12-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cros_ec_codec.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 7dc5a7c3ca96..c522bacf06de 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -608,10 +608,10 @@ static void wov_copy_work(struct work_struct *w)
 		container_of(w, struct cros_ec_codec_priv, wov_copy_work.work);
 	int ret;
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	if (!priv->wov_substream) {
 		dev_warn(priv->dev, "no pcm substream\n");
-		goto leave;
+		return;
 	}
 
 	if (ec_codec_capable(priv, EC_CODEC_CAP_WOV_AUDIO_SHM))
@@ -624,8 +624,6 @@ static void wov_copy_work(struct work_struct *w)
 				      msecs_to_jiffies(10));
 	else if (ret)
 		dev_err(priv->dev, "failed to read audio data\n");
-leave:
-	mutex_unlock(&priv->wov_dma_lock);
 }
 
 static int wov_enable_get(struct snd_kcontrol *kcontrol,
@@ -895,12 +893,11 @@ static int wov_pcm_hw_params(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
+	guard(mutex)(&priv->wov_dma_lock);
 	priv->wov_substream = substream;
 	priv->wov_rp = priv->wov_wp = 0;
 	priv->wov_dma_offset = 0;
 	priv->wov_burst_read = true;
-	mutex_unlock(&priv->wov_dma_lock);
 
 	return 0;
 }
@@ -911,10 +908,10 @@ static int wov_pcm_hw_free(struct snd_soc_component *component,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->wov_dma_lock);
-	wov_queue_dequeue(priv, wov_queue_size(priv));
-	priv->wov_substream = NULL;
-	mutex_unlock(&priv->wov_dma_lock);
+	scoped_guard(mutex, &priv->wov_dma_lock) {
+		wov_queue_dequeue(priv, wov_queue_size(priv));
+		priv->wov_substream = NULL;
+	}
 
 	cancel_delayed_work_sync(&priv->wov_copy_work);
 
-- 
2.43.0

