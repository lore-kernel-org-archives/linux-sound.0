Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852042D9792
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454536; cv=none; b=IP+UYy/HrwegVIrfMieZ5wK8BgyCUpldF5rLsu/dfjq+rTSL5RhMjg36haZGX83HLyU+A9ANwjYzylXIWsXi6rBWsjm+0gKHWm8PQskw6wpZCuJh26evdY37EAqRRft+IUqTDolT0yUOZYcVwU1R20Ba0XCccfeks+OQ6UcRb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454536; c=relaxed/simple;
	bh=WYggS4ZnMt6fzQmOJcSRrkDc66AvTs7KIbRAtBpTltY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7mZrUQSBYdQrhwlbxZoVyfJV0l8OTlhprD3ytPraYlwNQOSiVRSHFq/yBgztoY/nk28RGW8qVdClkfsiAa/Ex/MO5D7qLd0CenRXhzZpHBFjs6UmfhF+mCedBe9cyFlzafOXD2vwzfBCB6S625b6YwHUxEGmgbRVl1O6e0TB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIoY5j4I; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIoY5j4I"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37e00ef16ccso501425a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454534; x=1783059334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=JIoY5j4I1wyYNW1HSWYn1qpoKBo+SCDjRjPqW/FphytqpK28OuNEvNwmQ7VSANeQkb
         1lsR+z4aUI2NvoAd07b2Yayel6B6K6OyE5gmIBTfLekIurXwduAc6H+/w2isCT3Mo0xe
         AajXoiOPCCIP38g9xy9vhA63fXypSJPpCb/5F6vEDjmR+7L3gDnD1AEE+V1Hs4MLf52/
         m1lrSV34VhKAL3wxyb02j7h/Ti7CWGiZ8ERiWfwD6wfCFVdTl5saTygo3P/E28V/VSSO
         mlxJ1Rz3Vm9pVmPcjEkGFk6WeGExJT3iKn/O1w4ncR4QEEfkR9uhi/wyIw5p+BEmRGZi
         zNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454534; x=1783059334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=O33YwIo0UgHG9aYnaRbXFdkdgzvStqDG5B/lx2p8bh6DNvJww1D82S2rcJQXYzZ2uJ
         GeA4S3ahwQflchq0vfewhHoyP2X05YI+/ETcbnHbzHBXli6QtXDyqnothonIJlEByQDT
         UuaR7lhArQgYvZ4/RgoM0dLyMU+peYiFgTNXUY59eBYDKmMPT/bygH7w2HQ4nBL2DJhu
         4rIveiaHw39tFk5vmECsH2UNTMlDpiYX8IyfIlNtSntR+oO+RluobrEoljkrJ0JB9kH8
         DVkF4P21Ph6ekEYDssCq5z7XHxLyB5YE+3CFx9TqZCX/Xxo+4MbX1HEB9jK98sMY45Bp
         EL4A==
X-Forwarded-Encrypted: i=1; AHgh+RrggZtQuC9Eu+7/becKbLkl+d14cmIQzYctSvjIojAanfxFXpXwdS6KwiXxUwdBIwTPZvF6bOHVosoYLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjrw1tkphDtK2AgHD76VLBoXjCS5EpsbkMyG2aGbWd6j8X4VsX
	Dx7KSTOyll5t4ieIobo0wwysIli5dS4XLjlaoNd7LB4F6FpJ+quFMu9B
X-Gm-Gg: AfdE7ck4UOwPHE5FqcZQgZPR9A2tEasLJfL9rNSXesizgdM8dqVqbNbriFY/QQn6Ort
	+2LBUiuPpwMTlpPYbvEA0vHKSWO/BGU7bsmE1fyiXcwVNTBotDE46A8483Du5lz+zyUTgS7tYtp
	yIlKlXDcRiCdUXYJXGdGQ5QTHzPdB0WvDVX9jsSw+y3kgYrhNGs/2HGHH46U8sI5lZp2H64Z3W1
	KW1C2Mg0QAEOIyrMtzJaVriMypL4IYeNJKWuJFNQ58wJJ2ZOe7Qao/Szon1PMJK87sXZWiuaqwI
	go+0NGZwNGDxmiPkQPRhC5CUcNf+YKQxFD87uXhoJV5P4IrO1LPBV7b+u7hS6V+fVD8GJgZZ+Zh
	yC/QuBmjOor7ykHmO+PoC3iI5GWemttbgdq1ozCKhSTLSXfqO/TjuM4cpr2dMeF4hYo4pv24YQR
	BShIQfXGOVLpoJKXuofEbFBfW0BrD74hG3MDPlo24j3kRGVbY=
X-Received: by 2002:a17:90b:384e:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-37dfa28bb98mr5727342a91.25.1782454533622;
        Thu, 25 Jun 2026 23:15:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Fri, 26 Jun 2026 13:13:18 +0700
Message-ID: <20260626061329.23264-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert the interrupt handler to use guard(mutex) for automatic mutex
unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
reference through scope-based cleanup.
This removes the explicit cleanup paths while preserving the existing
behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs35l56-shared.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..73fe1cba3f5b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,18 +645,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
-	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
+	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return ret;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +681,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return ret;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
+	return IRQ_HANDLED;
 
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

