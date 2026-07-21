Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B0480340
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629646; cv=none; b=eh0bvb+yptIby6miLnw9KzqzCg6UNDpgj5sGi1d2zwRyKEF87KBWL3EniDZTNObm66zlCSb+0co/M+s0z0dqws7+k+0RpOu5mB/dwioRmctYy2ImUkIxixzU1b+VgoD3Vwu3g6DraNE5pGWz/QH+IU8i3AwAbXNFwEveDR5bxh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629646; c=relaxed/simple;
	bh=+nT6I4Pca0g3yL9/0MMMJ9eU5lzYcdje8+rHxYbR5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9N9iWeBxbsZxMNfhKXfeQMKmhpeaSqX5EJPEYOVajHtnke5mFu/yMsQHzkrC5ehLuGtgH3ZWdsdZLfUQOO+Vd5c2Y+ASoMP2wZAlXdX/2PI+/A5iyplu9V8BZ8hQuWREstONrPhFVn7UsHwGYYwdR3f22P8uQnMc6cTh+/dwPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFoQjan+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFoQjan+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc61541f8cso56978585ad.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629644; x=1785234444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=eFoQjan+ikwUs/ccAbbQBys2VDdM3ywU/GCJ0N0lenezip7V+kWCCNOM35p4Mf0Iwo
         SrlX+LAiActEIJn7OdZGo0Ahz/bYxb75eI0/WKXKohDWdLubTDvH/769cSfPe3wdY0S6
         q89RwJaec1g36m6MzBdfuzLTS9k6wNUa3XOBzOtH1dDUtLBOvkU+K9WpefLbDGsv9+t7
         TkLaHRgZGnr8l0uzfOE7tjDybzsFfIoX7LNnRRGvQXbBKQSetJD6BzYLC3u3yXiQhsFr
         rv7tOjiBwtwGNYHeYKGAp+yvZyVC5dDWF7BKpsM02Ex+zjlw4Aapb1oYaWIIhpdq0SzH
         Lbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629644; x=1785234444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=tVMZrExql+PgbdO9XLTHP691IYmSkFt1h5H/HJ3foJxeu7KPaoCsTD1Gjo3Q2aee3m
         Qas3bul4WQMb+0SO300fdmt3hxzwa+OkWD558CG+W11qd31fDc4D2NxdgbkfKN1B1u6b
         kez9u7rfqQTGoo/iH8GaiVqw7v7Z4ydCLh5AONaMjwdh/0kC2du4Bq3YVIMuS4F/tHMJ
         9mPHn0MhwkLhJNBxGyq3dR2GY2AB6GdFC2fHU8fp2VGbBOWzMUBWKxu4I20/uZFPff1B
         pwNiFgre6RygJKE76jyBFlAoxXe+QTdd21VjShLtHlSQZFaVDlweqUjbJ2U2AUvnS9Pb
         fcQw==
X-Forwarded-Encrypted: i=1; AHgh+RqRBGadCgJxpNPgODOSvfysZ7aJpUFvi0nHXbCyq2Ydu5/84Jxr44VjszLRZntrV9BJBpPut/U13E8YuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrKEETzZ3D3ECpMjMyYRZd/EPOI01FZQCYdAfV2ol66YzT+FXm
	YNffXRzvBvNE/PM8nF7gxW+ILJBvB3EY3waEeLnBerJ7Esr3jFpO+++e
X-Gm-Gg: AR+sD11aTo6Ctb+JofL3Boi92891efQDXyWtiDoXvd3FPNcNNXKkeZaG+iLRSKLqYge
	PF41sKGoBtaFfzYsFoOoF2ylbsJ8Z0dAvu/XMpl6xOHakSFG5ojScqkFfXmnt2HeUQs4sV9jL/W
	ntQ2xPT1UTS0kkrcqj+jd2Z+tAlJTvsBWCgOc6TwkhEYbnU+6U9jSAjGdFFkId/QsIvqRKb9zRC
	+mlxzWKS6rIcVt7HwopYC+8tykWqCs7aIM4pBbBMuFA38v83siFIjp10h/kImCiC+RGFPMK/+6z
	R/blHDqgGEpz22WGtPnGzuDxgouehz/tvq2JW4pu8UwCXTKxLQaLaVp/jHUzArE3MlkVWL7y993
	rhcys+D670cSqArNEdhXq+F3hqdVPLbeE38Vr3vLzieSfkAEP7Jg7QReXUb6uiPW1YJ/xJ0aPNM
	QfQpkAwj5E2Aw8/XPzifnOEQgnZafQlXLi7fpK
X-Received: by 2002:a17:902:e885:b0:2ce:d958:e3b with SMTP id d9443c01a7336-2cf1f570c5amr218336625ad.25.1784629644219;
        Tue, 21 Jul 2026 03:27:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 08/29] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:39 +0700
Message-ID: <20260721102600.523199-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0

