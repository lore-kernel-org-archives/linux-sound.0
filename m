Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592664248D2
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439179; cv=none; b=O92OKw08h33+vIX2OlSAJB5xfAGIoeCWtIq6OmkAa7l+Tx7O3HcsPSQ/EnqNZWCV5gthptH9h6skRkm1gn7QfCOMpMtXwJ6eZBg8CzZlU3Bh0S+OG0zQtjyrYLWPfPeB40q0cePYRcDD84ONLOL4aey07G9kiH2k8oyorw8Ebdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439179; c=relaxed/simple;
	bh=BySdOifFf8Y6zuhIPQKfV05XjhOObYj9M6tyXBhqX1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9mvM0QE38D9BJRzvWhKEjqU2wDNvGjPai6b6DMVAq9vyUgUOHDUWPP/sfgS78Q2XBVV/8WSswkHl6c1xg3MauLLVQWFIX2St3YU5ICLU4T9fzrPgdrdxrKZi/8P7CkbSVLFIIs0woLdgGtCgyjM7mrJZWfx4AqLpTDiiKeebK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhLmimbv; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhLmimbv"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2143334a91.2
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439178; x=1787043978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hD/iT4iwK6mqdxyxeSvFzfrctiLQS7TKv4VcHOqvJ5o=;
        b=WhLmimbv4uDsx2q78nBqwmjU36fRIxHbH5w5sRG2bZU1jxA2/VedbNIUrZl2LfxkSc
         ykPuDaD/IxFY4tE/tsO/DCQWgznDQDqozh0qTCbrUSfBbOYktEJECoY6Dzl5oxbeOBYj
         nAdZrdZfDJ2klkg/PdHEkP+dt8DUjpaNkc6vKjiGNX3k2l+99nQifqRYcWxka+Pf4uZk
         ru+aecci7tlCllHJOR6mcTohHPcFgM65RnIYX4GDFA+anUU/z3Bqn/2okEAx9qTKN8No
         JySVD1iIXPW5cA9YTpiCGGSlz4s87JnAD9jowyIE4nRoc264xTDgMALgqiHiWpjaJ44E
         sTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439178; x=1787043978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hD/iT4iwK6mqdxyxeSvFzfrctiLQS7TKv4VcHOqvJ5o=;
        b=ZslM6iKrBx+2oS3YjYM20xCUOq0pj1XTkc/zi/Jj1WmXd1wCln1yGicV6u97Xrnmzm
         hWbCZAXtx3PCTaVfC2KzYZB5MXYAZ753qUsiFd4gBZGKpmrI0jcZmrTy3eqtd23V2jpy
         +qtg75iF4WqwIGmbG2zVh6/+RUSTLZXaoEfN69a1Yvj9213900LjKu/QhtejhTREh876
         wZuOla/Px9r/+k4we3/9GstOqxWlAunws8tgDPQGOtj9mnz9HlHNtTcSO20S3YIeQmgv
         BGVehfJuAGu8fLTzGUJlFp6PTCv0nc0VVFHwCI5zSuPAADF1tXVyD7f+GT40kFRc/Pgt
         wiWA==
X-Gm-Message-State: AOJu0YzhLQsd2bSxYerHK1hEIiR/siajQr/rnDNUKLmgUwbSXSzwK9ew
	8AhsCbld9GjFj3Cmf6CB2TsXsraKazZkXV16B5+YegrxT76zW2EA4w0Z
X-Gm-Gg: AR+sD12RUXETtRo9LcvLhSLQepTKT120n4VjjGRVqhQcRJWhYjmaNlMWpaH32/ZHigA
	02h3vd3w9LwzMyYFSMFG1YTTTLCpSpS6H4kuX0/F6SnqdGb+4dfn853AhLBlp5/BbP2BmjscdVH
	JNEPsWefXah0nuBxi6SnDqnrzKvmtx8+fDc6gG45It3v2pqJEulS0CBixpEP8roKg/CzXirK5qI
	KKACNQ+1HLcbMCXeM6HApdRg1e2iLnIJr0rzaM3LfTW+ZG5Pyu42A7n2vU4OhIkjQKRgNc0sBJA
	kXaO8sTs3bmgx8U5HAOhB680BiOvZsco8JDpbjedn0yvvDTPB7untjIVoor10AZrIQQ4ylkntQ8
	XcYrWhcIzkIXbTT/dgkidCy5tZI99LteHRww2aFZp/4vY06v7I1zlZfiiGigMdd2l/gUYhF6tmr
	ShHCSZydbc0cBp4lS7ZZsFWpQnsbhTIKccP1IeI+DNbGQfgdFKCp5mq4tsMNpO2FCZQ+KaVyS4u
	U9iqQNGY9XsTpb6ULJ7iEse0LRdYyycRaLfeackh7/MOcT1X2ID5TvlhVlBwnnqlScCmPc61Kf/
	jjhn
X-Received: by 2002:a17:90b:3bc6:b0:380:f389:447b with SMTP id 98e67ed59e1d1-392ec5b6ac4mr1829394a91.11.1786439177663;
        Tue, 11 Aug 2026 02:06:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/6] ASoC: samsung: aries_wm8994: Drop redundant probe error messages
Date: Tue, 11 Aug 2026 16:05:46 +0700
Message-ID: <20260811090550.38930-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811090550.38930-1-phucduc.bui@gmail.com>
References: <20260811090550.38930-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/aries_wm8994.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 58e3e08225de..d189db96cf17 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -381,10 +381,8 @@ static int aries_late_probe(struct snd_soc_card *card)
 			headset_det_irq_thread,
 			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
 			IRQF_ONESHOT, "headset_detect", priv);
-	if (ret) {
-		dev_err(card->dev, "Failed to request headset detect irq");
+	if (ret)
 		return ret;
-	}
 
 	headset_button_gpio[0].data = priv;
 	headset_button_gpio[0].desc = priv->gpio_headset_key;
@@ -623,10 +621,8 @@ static int aries_audio_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		/* Backwards compatible way */
 		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
-		if (ret < 0) {
-			dev_err(dev, "Audio routing invalid/unspecified\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	aries_dai[1].dai_fmt = priv->variant->modem_dai_fmt;
@@ -671,10 +667,8 @@ static int aries_audio_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(dev, &aries_component,
 				aries_ext_dai, ARRAY_SIZE(aries_ext_dai));
-	if (ret < 0) {
-		dev_err(dev, "Failed to register component: %d\n", ret);
+	if (ret < 0)
 		goto out;
-	}
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret)
-- 
2.43.0

