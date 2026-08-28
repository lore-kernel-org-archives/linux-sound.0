Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F0C3932C6
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 05:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893573; cv=none; b=BwkO7gbpFDR8S28jVAnVmThf+MlzQAmq5CrC2xxtWmEkM9tpkDFipmDnNHBC2SR64jEdX0GOTRkRnkDiDPwCMZy8WrD9BYIF5545aMoj9G+/7jcLlQpZOYE7fzBgWoVzSuR13c+w96H4N3v0nzHfLkhrfIKYlvEGNeznCZGtqBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893573; c=relaxed/simple;
	bh=3GhUN1YWxQu4bJXtiFoeLFL4w/RSX1buQvfT36CMNsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyOSOgdDHZme2T7kNRuDOWTOYATLympIChEqnXWToHhPghG5y1Hqgji8fjXNMThAjkZ0npyozUTtDpiWY8/W+pvhejbiOb0MZ8joy6ukM2p68Y0/xzJKyJ6NWhER3viNNuH9eL2Y3NgdL+P5uGla8XwVYyXBfPJtbRm28Mxf/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noa2x3j/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noa2x3j/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso729854a91.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893571; x=1788498371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=noa2x3j/O1wRwpqFuCIeimXuxdVUSQQJLIWDxpm7Jjw5WPlsT0PQKWOlaHwQwhivy9
         4wZE0GvmNGnjd1AE/UuIA/iGtH7R9MC0mSqbTxPYBHinB6RsTLSfA13XgudLOYllZOw2
         yMTKBTQ8mJ80jBotXdRQPOm6gE170hPAIxdX/NZX+usbbqQQVEa/RXTl+0F7TE3EIaOY
         7WhO73GWKWICNt/mWEHz/mG1F9za1ndXeiGlyiW6GU3m3OgvOwHJGxzZgMeqifYjKbUq
         3UAvKWHYebzhrJkty0KjODB/MYmT35tpHbjyflc0fgDxjyo/UNYJVES9Ax2LC3N2ym9k
         wS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893571; x=1788498371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=n6qy5Jttwbm0Uq+eTiL9geZapyP3VZjBWwQQLO8FsS4A/Jq7VkslCQ2RQ7qKofLjhR
         6VuCHLO4HXREh01/deX33/h6pX0Et5AW4bLkqLyGC1yrwQkF1++y7K6IS1pOFwWObL7Q
         67Q/bAtZOWffPiF3oM4kfVNvy6V4jCYYwNBWxJfoPx/8Cn4gBKT0LS9bGIIYzbyjMTxP
         0chUjnUtn4WFKzKSSE+GumJLRtgb+grBH7TNBmy1OqOaxM7ZtiknXMNOgpPHmiCX159c
         6AbE/QwBPlz6omKwcKmTlSSf98RO4C1LF6U0mWryu2mfeZDr7EgOOaE9JWOOJqH137kL
         GPRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxHi6FLfLWz4oHIMXbmrZLOhYmiHgdoJ5fSGIN/hWUdOrHBprw+VeB4EOzkVrdUFwLN2iL7RqxRDxKhg==@vger.kernel.org
X-Gm-Message-State: AFuF++nIHszbhLq/B12rPl32CtL/73c+QzcUY/lPlFcaDS5YzJk1CAMm
	T14RqrN7vRyO88mHz0eqbBv7BRoXsb1RSQ8BZ6DqCYwdcpDpmr8LY9vu
X-Gm-Gg: AR+sD117LrbWHaVRyBjJ+S3J70aBHwDd2K+EE1hU3apMzZfz5Y7bhsoWqmbB+o95YaI
	e/Ztp9+YOjtpBoi1zmyGYbwf4AoUsLDM9r5pr3pnzyVAMT/x6b25FvJPxC/jFrjgBs/n2v36sFK
	JM4OTejpKVCK9aQNGlN2EBIwuUL3pyt71383rpGzMiE/gflPzNQ3+UMt9FhJlo31+TMNiEreLRH
	8LeklB74kjgAZ4QoT15lpMKvbdQvKMLZOWGQuT0+0vWjq/uLkccDUgmLPH/KxF7Opta1bF50R8J
	v+d+tmBPIsfedQqhUypQudmJ93svh33qnTvWfaeBFGBiXEJpWI+y9H3cudY0irJ4uELh9lo50Zm
	wI9Dnh7uC11tcJA1ql8wMV4mmn+VjV7hdz06AreycGC642HroSvkTWScfK71Vd/iGXOKZbmHhEs
	RJ/3Ppc0jM6vqZuuOFRWEmLI5PTrnk/2heWOn0Rx9x19appxckzb7jX9xRjxTC2wSe7oWy1mC4g
	jV65naTtl0S4cuDdpidjQe7GYTNoCDXp78QTGeYkU0vb52sB8Jybx0mnT3hFb7eSZRmrIoJEawu
	0Thu
X-Received: by 2002:a17:90b:2cc6:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-396d0d92cffmr9327276a91.2.1787893571476;
        Thu, 27 Aug 2026 22:06:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Fri, 28 Aug 2026 12:05:26 +0700
Message-ID: <20260828050526.590761-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

