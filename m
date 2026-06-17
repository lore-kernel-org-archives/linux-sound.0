Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712FB3FE645
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692588; cv=none; b=ghBgZvevMGMtBEoxa3IuERjI42D+wVw6LDX5fE92fVeOGBmGySD281GiLw8QPIOkue3g+7JSC8Zi53QusL9rEC1jfxhRUCxDj8EOPD15r1KKYXmQHjVyPgKnc4vxi1OhMh1cn+Jf5PEsKM2DS2lW0qJj2jdyJoVCiYKh1P/WPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692588; c=relaxed/simple;
	bh=PK1w8ixg4eqPxCHAGSl2zZcTbcNUnnrCgmRQCcVJPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fq414L+l49izkyj9jkfMx4vG/HDH/iYGYUeI7qHPhDswXujgyTIZ644DnB9/kV6jT0uxb73pbbQb3v1kC86zyzW5Vpn3+j85c/QyOlVG+BIFmTMD1/avIVW14T7NRmJs0BGqjnzgum1GD2TO3RYjH4zUTUTGtPObl+Tkz7UIBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7veL7RP; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7veL7RP"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13986d61b4eso4247228c88.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692583; x=1782297383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=d7veL7RPWtCVJMm6NCY+xiEt1G/zi+Oezx+BSMpjUiMRZv9lPfJyOBiYcHhk+W9/zc
         T2VJd6CYdtGzJXrNy8W84PR+tg1hZdZM7Mmjr4hmIuSaZyNvdvP5IGf8CrCjZCqaMZQN
         gxoq9oSIpMRolT/8YtY/ctwCwz9e4Xyajybow70j+oqoKZxKUgZYS+oJCs48r7f1zDep
         NNWUC89DEiOPoviVcSA+Xico7ED7RHbLiy4mkEPNsdJNmx8wmawrxhYcxUrM8xs4V0JE
         wew0c0bKE8zv+mRFe+29PDaTW4WBzZDwZDCZ5BoG4LR99eA1jWXFHWefruFheW7YtGcF
         kfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692583; x=1782297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=HIsugQpQMldCZyZgppqy2TmjavRLTdiAnhvZnvHGzvkpCLWA8aNdjwaHcR7VeMgbdL
         osJ1+CZXzT67b+lUwRIc1ZhRxtfzp5kv3eKAQ3iN8D+zayRHHalwcB10w++NPlPSdlcf
         /5CpdnpDUPW1EITbg8aDr5kM/fqHPyMlCi0EyiLQgOiMnjQ/jcFWBrZp7zrOErcftSRW
         SxovpvBzJCYOt4V29NDkbWjxuzcPq46KCqO1dlKg7FgAJ+qp1fsfL7AE4wLPYUv4ilfg
         zb3+beV4Wzt0xteLpEyEd2xYN1DXqefr/w0zsM8SKPRJhdF+69N+E8JtqHvy9DI2l4ew
         McLA==
X-Forwarded-Encrypted: i=1; AFNElJ8zzjOXboV90mf4hkjSjp2PK4xHnjGryaXMeJG9pysDrYAV850ICMRJQfV/5mMR4KQRwKn6eOlC7lBmdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt/ec1YXmsgV7/H8OEsU8B6czGewUij3pxAPwRqLoKvCNrdeBJ
	ihbzeGZJwV1ySRoDbEXK4aDH8BPGPXCir4zZBa9LtU1Jpkky0Otdd9na
X-Gm-Gg: AfdE7cnT9HEBIHv+edl5KZVudWAyR17I+DFiMx061pZEU4NHU4NrGR+YGkR4rZmcp2V
	Ss8VlHJf++LBbA7ASp4QbBMclhi24hMwZ1SYacd6yAeKKzGe+w6qeRgb4icZ9vE/1oTUdcshhTS
	QxzU+SDL66G/oSpuVqTnd54neIl7r+hKkoBESaHYnbuW/tgYVaiit7I05hoDSkRbiLf+GKpxMYy
	1ECmoXNV4g4vS47y/QHFRYgYWhKxtpAD7NmNeik/pBjxdrR4WBsYbowGKOAN2WImBSTZlbvqHHb
	1t/9wfJf7XsqAc67rcbk5+UlT0SnmEcUbK+npJwkR9ahjUdvzOqQkWKfwqL9Gbe/ZgT73UOrtZD
	IJU3C3yk745FQiUo8aCgW4p9G+BjGMZ+r529VcUNnmPY42jIE7sgMd9+adlAQn6lQvTJVOXB/5X
	LeUpIlXJ97k8llUZlW0GOBlRvyt9rXHrH4d4ZCGi910H6qEuc=
X-Received: by 2002:a05:7300:430e:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30bca0b8c3bmr1984423eec.20.1781692583469;
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
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
Subject: [PATCH 22/78] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:39 +0700
Message-ID: <20260617103235.449609-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..4abc896caab3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1892,9 +1892,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1921,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

