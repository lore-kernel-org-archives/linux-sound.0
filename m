Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F43D47CE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454572; cv=none; b=Ie1FSEWOTryopPAtwg4jTYEWVt/mDSOU1CGUAbHfJXWTDPUDy7emPZR05JsA5Y/jlszCTvPhywWG4W1iize5p+zruw/E1Vz0HpVZZ0D+56WKzrNhWq/QpLiBMNt9JzOivUdAUBAr2fcmfS4A97mPADGEl4a5Hot27e9JE+FWIEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454572; c=relaxed/simple;
	bh=T2eO/iN+fiv9eyBvJ231A8TDz5E91d0v4s1m9L9u8+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGwWCxUrt/Y9TQBZ9LznliXxaNSx+4CRJReau0PT9N8yt+w6FIBkCxWK3U0TyxjPW2ml6PRfjjPRR9g4oLwDyLf8D+kXANkqm7zbnpDGXCaT3APxQt0shZPx8OPdSDsJa0HGs7z0jByhVH0npSIKE5QE6QNbj8yKsWDCZx7skOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLHXUMIk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLHXUMIk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37cae998401so277505a91.0
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454571; x=1783059371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSnRj0RszHC9jOxwXFHVU4Untaa2IiDeNEezb4oQ4FQ=;
        b=oLHXUMIk36wibEusMUc4JD/3TGaoxRecG+xXhahXEHnOQHMIy9AnJpaaBKFiSzfX6q
         brr45us/MUJnn7h0+498DhAGB+preVHG/M/ETxFNWKcTAnFPoO3bWYFlt/dSSLwF/ggn
         RxwJQkXO5S76bUlv7Rc6tIa332AmApEGVPIqPMPMDufoKU8d6ONGm7REBXVSeP/8ClS/
         J+vGI6fPOv+T4Lh9f/fTRM76zcK3v20jLz4iC5M9zP2i1nda5Cult26cItgLQ58CW2wg
         bodcLnJgA4l7UbRiHqxatJ8k15R61N+R57dB4g/k9kzIpIuvZ9uMUKlUsxBeG9DgBtAj
         CRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454571; x=1783059371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSnRj0RszHC9jOxwXFHVU4Untaa2IiDeNEezb4oQ4FQ=;
        b=h6PBo3mzZ7dM8tKMiiYdRGr4CN05eGSZIqlsyDpxSJld5IZ/wIqvl1Wy3ipqt4EXFl
         dZ+qiYpcpaX+Hej6Kdoq/6D8V31GIQ82vx+n/lv5NC9kM1/ywquhLZM48L15/ueT2ANp
         AhFneU5B7xI0lOPHNYi3jAmDCpaIjQJRjUgDvpKL04vz7cVUOSCDBlhMbDu3FiPYNj3D
         EBCORyu8omC77NjB/b/JFL4G69fPRoUe4bp2d7+Y7R8DpahIkPN/iO6ZPeMdxHMTzE9Q
         0Hm+Lnn9m7GCLfiVB3lp+AbGWB4G0LjBfS5OVkNtsxP7DYeOlhl795NoTQu+Z91/BaI0
         g9MA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ0cXzoxHhtavOSn/Vcc48u3dkhBnOee8GCZ/RkQ4FGeOiFgMTEman+mo3pRSK0bYeScX8cx8I58710A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdUxdcULXyV89Ud/WebmbezzYwdxBSzWpmUwl8D0q/LR9aqVw
	wetqNIDGgyFbcXjMnyCkRbyX1AEUzw3UCVQTlJGXQdxzZ+9yJYE/LSSi
X-Gm-Gg: AfdE7cmjVV1+J3tlfDiPLWzG78etNzZSDRDhCBoec8xsyA4aP2Z6rPZjukj4r6RvKcV
	uzMddFhUIjGRYaag0alx0v5NlT45DOYNZhcBDSHipsNUNVnnCDs5/dJ+TtQD5YlNK8FQm0k7OBk
	U9b62kdpzoWm2yxmkcXbHHVu4WcpbqJ2stKeDp1NAbZlGjqcXEuH0tlOWm7mUhWBSvJb5AoDnVb
	WBA9PsXGSNn43PHe8AiaCJDQHgQKoxyg0gK72HYcA98/XZH7D/vOrwOMMOYtuizgu4z36higOuy
	g4HuQu/dUvCw2YMoTrbzVoXDqxaxfs5BCyxnc4uHX/sg+vgJVAFICdABYD0LkmffS64qjRy/aGN
	NbJcduqbAk4nHq62It01AhrUUes75C5fOUspW1hwga4jArKZK3y9ZPRlncjagUJm8xq65Gr1/mQ
	qHgkli+S4zz8BXM1VKjaGltPyOaODPNox7r3bFISRnq+fSQnGG/qr03hxgwg==
X-Received: by 2002:a17:90b:2804:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37dfa1a522bmr5525074a91.4.1782454570910;
        Thu, 25 Jun 2026 23:16:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:10 -0700 (PDT)
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
Subject: [PATCH 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:25 +0700
Message-ID: <20260626061329.23264-21-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

