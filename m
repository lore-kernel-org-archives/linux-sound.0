Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E561E3CF696
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236748; cv=none; b=b71LR1x+akGisbJWp2f7jZ+Hpq8wLAk/2pTCqRfGmfDOvnngCGaA96YaVxcIB/t4xpY4NPtpIfYH9H0xr+xSJLPB7BQIo2HIqnyZr333XNfoZlUmf+mPKr1ghDPsAc/wbHtfUNKTzt/MwsMYvUsha2SIYhf7xQ1WjYPqYxpbwt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236748; c=relaxed/simple;
	bh=+Cat/hrzlP9TQa7q7VLyIEo3Rx45NIuQaGGmUTbrMPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCLMaO4Pj9hz6NCbzr+QWDvUFic2DkTgskNFvaIV20Zi0sU0RESU3SdFgT0aJnM1QKacsYDZmKA8n7DowijdmaGgQBKHaCUWW81d4X+/tUbhhu9FeN2HxgqME6fQgH/7S7RVMwfQlrYtKaUFdsJZHwGcpi4okAUfMlGMWFrHNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFtEicd6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFtEicd6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba4efedbeaso13345415ad.1
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236746; x=1778841546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1fF2g2fGUgug/smobxh1GYiC42PEqoDgJD4+eh4r10=;
        b=IFtEicd64JDkJNoYlJd6jHifz3oo6kVZqVS16EvYhL5af1t8Dmv4e32Gz8m/+I9Ewu
         eJTsJ9fEdBVqTPppqgUKQFM+l7yHk+2OQZwn7GpNPQLX3dKODCpNLQnPjgReVOtHZ9W9
         sGKfUS7eInuPJMuNVijeb3XDfksgc3tGDTk/V0sCa2Dli8+Crl/hrvrw5PU6fL5rM4ti
         kZyRKBjd7DTYgxM0ndfgTy+WIi2pXSQMgVdQf3gjhYWHcJWmJgMqutA3onmfptZRFLd1
         mNKDnnY7z7Vxvt1IbML51QNazfME5GAh3qfk2TrH1z7eSEQ9IyFayJXWV0WV+54s9DnF
         OSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236746; x=1778841546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N1fF2g2fGUgug/smobxh1GYiC42PEqoDgJD4+eh4r10=;
        b=bTPG8cp4zjEsXmAQs6PolWwYCyok4BIF5qhTd5ALjDXTWkQxNjnhceEziWF0Yu0/Zy
         hFIPV4QpELr/DjQvYHVop0P0Bc0aYn40sKBTJGP31bNoVjIaSTy3qbai2Kbj8RnkWU2C
         ql6VoepzDdLzMDWK1miU/ZwqkdGrPLTxD5xGz6CLW83I6FhG++ernWoqsubtx5H6/fug
         4109AE+9i309CizTdMecywQp+VcVGq6xUsGiovt+arzyFWtGbRi31fNAvYHnwS9jU6av
         qJ0gnK1pFb+lcAkv/1PyHYzPCX1HquzQQBQKh42h/RVAht7MqaHVfER/AcLgGUCNQRbt
         5RbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Nk+K09lewOpfmuqH+9gi49nVKyqtEfAwAxFzG1q1LFylzCCvljt1z4ohcAJ6xXNvpSHMYW2KJR5ov0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+7ZbtMO2ahS8VKpaONna3uUkiTvZJnTnJXcXcJaJ+nQqEVOv
	2nmPuLZG+o+UWxWbIUmmBIEObJQMoURwSgth3qY4+wEtRxjjRG8N8/QV
X-Gm-Gg: Acq92OHGbojzGL01a5ZJlpMJnjuW4JlG2gbFqKWzjPapMeE0MlW7N4+h1pW/W+t7ns/
	aAf9kEeXpXgtyvTEVKmBRH43cT9s7QpR7w68zsa98TgD7cRgzWIa8+EbuJ5AI7TrW8j9ZH5F6bR
	54SnYJ4Bqj6KLfQbvfSmX5vrd+4ZqrWKW8Pcp9BqluseP620jiHAKuxnZQfttIpRPcKVeypO/nt
	ePMWfSeERtRko4F7DHvggJGK3isVqpO7zB+gZyCuZ4n6HVL6Hvi4uk29to/kQyWpcOh5q+BfFvq
	JIvdjFKDZk0sv3KpRJPfED1fZFPcoBQm+vtM79hBzw2KRbU8jDSVdLH1hkfgBcTARGv3c4ht8CX
	izayh5YWAbPQCjIqpDlKqQecwEVBFZq2aEF2X/DTKwm45zgVvQkcxTKMENfQU7HwU4y4LKVf+nA
	0RhRN/WJg3Un1pc22E1q+pobKcgKr9XbgQ7IX8gqKBrpvt9rIolYcfEH7oVQ==
X-Received: by 2002:a17:903:1b50:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2ba794bf96emr121392205ad.14.1778236746201;
        Fri, 08 May 2026 03:39:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm18309345ad.1.2026.05.08.03.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:39:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: peter.ujfalusi@gmail.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	jarkko.nikula@bitmer.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/7] ASoC: ti: omap-dmic: Use guard() for mutex locks
Date: Fri,  8 May 2026 17:38:32 +0700
Message-ID: <20260508103837.138142-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508103837.138142-1-phucduc.bui@gmail.com>
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace open-coded mutex_lock()/mutex_unlock() pairs with guard(mutex)()
and scoped_guard() helpers.

This also simplifies the control flow by removing temporary return
variables and unnecessary goto-based cleanup paths.

No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-dmic.c | 44 ++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index fb92bb88eb5c..dc92fdb89a0f 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -91,18 +91,14 @@ static int omap_dmic_dai_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct omap_dmic *dmic = snd_soc_dai_get_drvdata(dai);
-	int ret = 0;
-
-	mutex_lock(&dmic->mutex);
 
-	if (!snd_soc_dai_active(dai))
-		dmic->active = 1;
-	else
-		ret = -EBUSY;
+	guard(mutex)(&dmic->mutex);
 
-	mutex_unlock(&dmic->mutex);
+	if (snd_soc_dai_active(dai))
+		return -EBUSY;
 
-	return ret;
+	dmic->active = 1;
+	return 0;
 }
 
 static void omap_dmic_dai_shutdown(struct snd_pcm_substream *substream,
@@ -110,14 +106,12 @@ static void omap_dmic_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct omap_dmic *dmic = snd_soc_dai_get_drvdata(dai);
 
-	mutex_lock(&dmic->mutex);
+	guard(mutex)(&dmic->mutex);
 
 	cpu_latency_qos_remove_request(&dmic->pm_qos_req);
 
 	if (!snd_soc_dai_active(dai))
 		dmic->active = 0;
-
-	mutex_unlock(&dmic->mutex);
 }
 
 static int omap_dmic_select_divider(struct omap_dmic *dmic, int sample_rate)
@@ -334,26 +328,24 @@ static int omap_dmic_select_fclk(struct omap_dmic *dmic, int clk_id,
 		return -ENODEV;
 	}
 
-	mutex_lock(&dmic->mutex);
-	if (dmic->active) {
-		/* disable clock while reparenting */
-		pm_runtime_put_sync(dmic->dev);
-		ret = clk_set_parent(mux, parent_clk);
-		pm_runtime_get_sync(dmic->dev);
-	} else {
-		ret = clk_set_parent(mux, parent_clk);
+	scoped_guard(mutex, &dmic->mutex) {
+		if (dmic->active) {
+			/* disable clock while reparenting */
+			pm_runtime_put_sync(dmic->dev);
+			ret = clk_set_parent(mux, parent_clk);
+			pm_runtime_get_sync(dmic->dev);
+		} else {
+			ret = clk_set_parent(mux, parent_clk);
+		}
 	}
-	mutex_unlock(&dmic->mutex);
 
 	if (ret < 0) {
 		dev_err(dmic->dev, "re-parent failed\n");
-		goto err_busy;
+	} else {
+		dmic->sysclk = clk_id;
+		dmic->fclk_freq = freq;
 	}
 
-	dmic->sysclk = clk_id;
-	dmic->fclk_freq = freq;
-
-err_busy:
 	clk_put(mux);
 	clk_put(parent_clk);
 
-- 
2.43.0

