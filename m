Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D804534A7
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692789; cv=none; b=Y5d+CkT14yDA+ZcNyJ+3JWdQGAk7CDJSHUj2DjNV5toRuxPRC3Y+uLal+/Gll2QWsShYmfdjDpPrQiTIIljwpwamXeYbf76M6QgMFSalgB7ch8rCsS5FP1epIe1+a72sfvBlpTEiEC8fhUZx/yJgby54nwSpW3wZNxn+AY8T7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692789; c=relaxed/simple;
	bh=5JCNTsV1p32IiiWp8LevAgThvpw4U0A4EV+Xvmc/Vns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4i6c+XkP+5sf10jHoZDlFqlQG+Cx/QKrldsBEPNAKqamy9E0B/0SXdNW/t3qioufmNZW9N+K+qHu9rOH9rT9yp7AWAMAM+gzR8uSV5Q+luA591q8reWuz77u9eWEniXkj/PzPY/PicTVUtHl6kzJubola3GfDmDyrDF23re8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4svsVwo; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4svsVwo"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bd7f4fdffso371358eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692787; x=1782297587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=W4svsVwobv8HyZAXp7szDmYYU5W9FCQDaR47OizoO1j7AqkzIE7oE6EkCRDpqHPVj/
         8I62ya7onaTIeQbJLq7uuDF3VWtsQxQMofkE+klMZ7/ctEpJYPgbCEYtCULedMW2OkQY
         S8k2EXR8EY/NpCnOd6RYQhCciQ9u8ueLuozwJYa87tKdLpkMQOOK0syooOb0kdvsE0EP
         R/xUu4vxvrNoRY+z4vOB1o6U8E7r4pRCF+tusXwvxYyONlRCNVSSfskU+r+mxXJH1Jsb
         S6TR1WKyUk4Ehx5NCQAy1exJPSnX2pMKrARNuKZ41jYDstdGWBoUbFpWdk2Bs3k1UYKa
         b09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692787; x=1782297587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8UzOcdKlzqr8WU+ZxDYdCm6hGtyTeRisevBsOozeA4=;
        b=ZLb3C/n439Hgzte25yl9K2UJ3sIZxnidNDxRK17i1pd/PtRt5mLwd+nUGgFk9+mzE0
         AB6zrHkJnXjDol+tU3gM47jsgxcKp2fqeMoMHmRcn9VqIfDcQBPiqdMY+4RwY/w/TVFP
         dLWleqejf4bjHGMl5WlssaOj+kyRV4q99Cy86MsAWHXJARZS9wG8mx3GSESvZnLp0VNM
         NQ6yDa6pxpeFopdj8QdWF58jr0QCwGN879LiHMk+UlVvwlu4U/Fqxyp0ON4gM5LJUhDy
         BVfh6b5mkNl4n0Vi/2ql5hv4DwsMbmFOr4ECpDcvVeM5U6423YfVLxsLd9aB4RPk1Y7n
         JjpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+g+E/1Xf51mQHZ5kqKhakGzRhjoXu1K4Pvn1Yrg1oQu/+f1ucjenjsWYdFkgzH4wS23v5OcS3Xmp5gJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJBYH42KWMte41JSFp1bsAU7+TA3zSiT0X4clzKoqbcDSZYlr
	Um6Gk0NV3A2Aq85++v+Vj24J7/unZKnEJuQMcZqiRpXDgdDUA2ik5p0d
X-Gm-Gg: AfdE7cmIT20x0TfYdAzszxjS4TTkZrxg57Px3jOh22nwerIQ/nhn65QjZzs8X5do14T
	NphylrSZR+avpKequ0UY1u9sdLfSQNxIOBUl0HeaYl0rVTC0igwcji8waimk5owKQvVeZKRLVi6
	IXJ8xsRXMrYZ5qDdsEuG4UEnlzbRxWPv0UGx7pbfjwGVYV1QNfX6rbzdbQcvJExS4/IbuiLSiWQ
	zMfrznL7l0FBZUwUR9FOTto9VML03q9HI4Xgptf+0paIx19iIFs0aFAXJeN4lyLFliHrfdIqFex
	+u0BfAE4mftbeCn6vTdX2LR00/zMXbY7Cs3XpdyrM7zi/ad3zWGweIaqGoB3MpgLc+kRTXuBcuM
	4GDpFxO+fmWuDM376BjijwPMqwpfadm5pRiLUUHjiBQhLkiHVeGMWwjcNSMNZWCLs+w7RWpC5B+
	sXkSNES8CtC59iJiI7ZoYnVRD+zjonKMuEIJCrcBWcyvPVjVxwsribnOGs2w==
X-Received: by 2002:a05:7300:6402:b0:303:f26f:df30 with SMTP id 5a478bee46e88-30bca09f522mr1864287eec.23.1781692787536;
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:47 -0700 (PDT)
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
Subject: [PATCH 43/78] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:00 +0700
Message-ID: <20260617103235.449609-44-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5665.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..9048632488ab 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1208,7 +1208,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1274,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4562,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4637,7 +4635,6 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 
 out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0

